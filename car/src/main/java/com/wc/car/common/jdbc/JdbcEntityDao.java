package com.wc.car.common.jdbc;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.AnnotatedElement;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.Validate;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.SingleColumnRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSourceUtils;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.util.NumberUtils;

import com.google.common.collect.Lists;
import com.wc.car.common.jdbc.PageRequest.Sort;

public abstract class JdbcEntityDao<T, ID extends Number> extends JdbcDaoSupport {

	// public static final String DEFAULT_ALIAS = "x";

	// 不暴漏给子类使用，防止子类修改状态，子类如果需要使用SimpleJdbcInsert，自己创建一个
	private SimpleJdbcInsert simpleJdbcInsert;
	private String tableName;
	private String pkColumn;
	private Class<T> entityClass;
	private Class<ID> pkClass;
	private Table table;

	public String getUpdateByPkSql() {

		if (table.getPrimaryKeyColumns().size() == 0) {
			throw new IllegalStateException("not found primary key on table:" + table.getTableName());
		}
		StringBuilder sb = new StringBuilder("UPDATE ").append(getTableName()).append(" SET ");

		sb.append(StringUtils.join(getUpdateColumns().iterator(), ","));
		sb.append(" WHERE ");

		for (int i = 0; i < table.getPrimaryKeyColumns().size(); i++) {
			Column c = table.getPrimaryKeyColumns().get(i);
			sb.append(c.getSqlName() + " = " + getColumnPlaceholder(c));
			if (i < table.getPrimaryKeyColumns().size() - 1)
				sb.append(" AND ");
		}
		return sb.toString();
	}

	private BeanInfo getBeanInfo() {
		try {
			return Introspector.getBeanInfo(entityClass);
		} catch (IntrospectionException e) {
			throw new IllegalArgumentException("error: generate Table instance from Class,clazz:" + entityClass, e);
		}
	}

	private boolean isPrimaryKeyColumn(PropertyDescriptor pd) {
		boolean isPrimaryKey = false;
		if (getPKColumn().equals(toUnderscoreName(pd.getName()))) {
			isPrimaryKey = true;
		}
		return isPrimaryKey;
	}

	private String getColumnSqlName(PropertyDescriptor pd, Method readMethod) {
		String sqlName = null;
		if (sqlName == null || sqlName.length() == 0) {
			sqlName = toUnderscoreName(pd.getName());
		}
		return sqlName;
	}

	private void createTable() {
		BeanInfo info = getBeanInfo();
		PropertyDescriptor[] pds = info.getPropertyDescriptors();
		List<Column> columns = new ArrayList<Column>();
		for (PropertyDescriptor pd : pds) {
			if ("class".equals(pd.getName()))
				continue;
			Method readMethod = pd.getReadMethod();
			if (readMethod == null || pd.getWriteMethod() == null) {
				continue;
			}
			if (isTransientProperty(readMethod)) {
				continue;
			}

			boolean isPrimaryKey = isPrimaryKeyColumn(pd);
			String sqlName = getColumnSqlName(pd, readMethod);
			Column column = new Column(sqlName, pd.getName(), isPrimaryKey);
			columns.add(column);
		}
		this.table = new Table(getTableName(), columns);
	}

	@SuppressWarnings("unchecked")
	@Override
	protected void initTemplateConfig() {
		super.initTemplateConfig();
		AnnotatedElement target = getClass();
		EntityDao entityDao = target.getAnnotation(EntityDao.class);
		pkColumn = entityDao.PK();
		tableName = entityDao.Table();

		Type genType = getClass().getGenericSuperclass();
		// 忽略CGLIB代理
		if (ParameterizedType.class.isInstance(genType)) {
			Type[] params = ParameterizedType.class.cast(genType).getActualTypeArguments();
			entityClass = (Class<T>) params[0];
			pkClass = (Class<ID>) params[1];
		}
		this.simpleJdbcInsert = new SimpleJdbcInsert(getDataSource()).withTableName(getTableName()).usingGeneratedKeyColumns(getPKColumn());
		createTable();
	}

	protected String getPKColumn() {
		return pkColumn;
	}

	protected String getTableName() {
		return tableName;
	}

	public int[] add(T[] entities) {
		SqlParameterSource[] batch = SqlParameterSourceUtils.createBatch(entities);
		return simpleJdbcInsert.executeBatch(batch);
	}

	public T add(T entity) {
		SqlParameterSource param = new BeanPropertySqlParameterSource(entity);
		ID pk = NumberUtils.convertNumberToTargetClass(simpleJdbcInsert.executeAndReturnKey(param), pkClass);

		try {
			PropertyUtils.setProperty(entity, getPKColumn(), pk);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return entity;
	}

	public T getByPK(final ID pk) {
		StringBuffer sb = new StringBuffer();
		sb.append(" select * from ").append(getTableName());
		sb.append(" where ").append(getPKColumn()).append(" = ? ");
		return get(sb.toString(), pk);
	}

	public List<T> findByPK(final ID[] pk) {
		if (pk == null || pk.length == 0) {
			return Lists.newArrayList();
		}
		StringBuffer sb = new StringBuffer();
		sb.append(" select * from ").append(getTableName());
		sb.append(" where ").append(getPKColumn()).append(" in (").append(StringUtils.join(pk, ",")).append(") ");
		return find(sb.toString());
	}

	public List<T> findAll() {
		StringBuffer sb = new StringBuffer();
		sb.append(" select * from ").append(getTableName()).append(" order by ").append(getPKColumn());
		return find(sb.toString());
	}

	public void execute(String sql) {
		this.getJdbcTemplate().execute(sql);
	}

	public T get(String sql, Object... args) {
		try {
			return getJdbcTemplate().queryForObject(sql, BeanPropertyRowMapper.newInstance(entityClass), args);
		} catch (EmptyResultDataAccessException e) {
			return null;
		} catch (DataAccessException e) {
			e.printStackTrace();
			return null;
		} catch (Exception e) {
			logger.error("not result!{}", e);
			return null;
		}
	}

	public List<T> find(String sql, Object... args) {
		return getJdbcTemplate().query(sql, SingleColumnRowMapper.newInstance(entityClass), args);
	}

	public int[] update(T[] entities) {
		SqlParameterSource[] batch = SqlParameterSourceUtils.createBatch(entities);
		// JdbcTemplate 不支持 SqlParameterSource的批量更新 by tao
		return new NamedParameterJdbcTemplate(this.getDataSource()).batchUpdate(getUpdateByPkSql(), batch);
	}

	public int[] update(String sql, T[] entities) {
		SqlParameterSource[] batch = SqlParameterSourceUtils.createBatch(entities);
		// JdbcTemplate 不支持 SqlParameterSource的批量更新 by tao
		return new NamedParameterJdbcTemplate(this.getDataSource()).batchUpdate(sql, batch);
	}

	public void delete(ID pk) {
		StringBuffer sb = new StringBuffer();
		sb.append(" delete from ").append(getTableName());
		sb.append(" where ").append(getPKColumn()).append(" = ?");
		this.getJdbcTemplate().update(sb.toString(), pk);
	}

	public void delete(String idList) {
		StringBuffer sb = new StringBuffer();
		sb.append(" delete from ").append(getTableName());
		sb.append(" where ").append(getPKColumn()).append(" in ( " + idList + " )");
		this.getJdbcTemplate().update(sb.toString());
	}

	/**
	 * 按HQL分页查询.
	 * 
	 * @param page
	 *          分页参数.
	 * @param sql
	 *          hql语句.
	 * @param values
	 *          命名参数,按名称绑定.
	 * 
	 * @return 分页查询结果, 附带结果列表及所有查询输入参数.
	 */
	public Page<T> findPage(final PageRequest pageRequest, String sql, final Object... values) {
		Validate.notNull(pageRequest, "page不能为空");

		Page<T> page = new Page<T>(pageRequest);

		if (pageRequest.isCountTotal()) {
			long totalCount = countSqlResult(sql, values);
			page.setITotalRecords(totalCount);
			page.setITotalDisplayRecords(totalCount);
		}

		if (pageRequest.isOrderBySetted()) {
			sql = setOrderParameterToSql(sql, pageRequest);
		}

		// TODO Limit
		sql = setPageParameterToQuery(sql, pageRequest);
		System.out.println(sql);
		List<T> result = find(sql, values);
		page.setAaData(result);
		return page;
	}

	/**
	 * 设置分页参数到Query对象,辅助函数.
	 */
	protected String setPageParameterToQuery(String sql, final PageRequest pageRequest) {
		StringBuffer sb = new StringBuffer(sql);
		sb.append(" limit ");
		sb.append(pageRequest.getOffset());
		sb.append(", ");
		sb.append(pageRequest.getIDisplayLength());
		return sb.toString();
	}

	/**
	 * 执行count查询获得本次Hql查询所能获得的对象总数.
	 * 
	 * 本函数只能自动处理简单的hql语句,复杂的hql查询请另行编写count语句查询.
	 */
	protected long countSqlResult(final String sql, final Object... values) {
		String countSql = prepareCountSql(sql);

		try {
//			Long count = this.getJdbcTemplate().queryForLong(countSql, values);
			return 0L;
		} catch (Exception e) {
			throw new RuntimeException("hql can't be auto count, hql is:" + countSql, e);
		}
	}

	/**
	 * 在HQL的后面添加分页参数定义的orderBy, 辅助函数.
	 */
	protected String setOrderParameterToSql(final String sql, final PageRequest pageRequest) {
		StringBuilder builder = new StringBuilder(sql);
		builder.append(" order by");

		for (Sort orderBy : pageRequest.getSort()) {
			builder.append(String.format(" %s %s,", TransCodingUtils.camel4underline(orderBy.getProperty()), orderBy.getDir()));
		}

		builder.deleteCharAt(builder.length() - 1);

		return builder.toString();
	}

	// /**
	// * 按属性过滤条件列表分页查找对象.
	// */
	// public Page<T> findPage(final PageRequest pageRequest,
	// final List<PropertyFilter> filters) {
	// return null;
	// }

	// protected String[] buildFieldFilters(final List<PropertyFilter> filters) {
	// List<String> whereList = new ArrayList<String>();
	// for (PropertyFilter filter : filters) {
	// }
	// }
	//
	// protected String buildFieldFilter(final String fieldName,
	// final Object[] fieldValues, final MatchType matchType) {
	// Assert.hasText(fieldName, "fieldName不能为空");
	// StringBuffer where = new StringBuffer();
	// try {
	// // 根据MatchType构造criterion
	// if (MatchType.EQ.equals(matchType)) {
	// where.append(fieldName);
	// where.append(" = ");
	// where.append(fieldValues[0]);
	// } else if (MatchType.LE.equals(matchType)) {
	// where.append(fieldName);
	// where.append(" <= ");
	// where.append(fieldValues[0]);
	// } else if (MatchType.LT.equals(matchType)) {
	// where.append(fieldName);
	// where.append(" < ");
	// where.append(fieldValues[0]);
	// } else if (MatchType.GE.equals(matchType)) {
	// where.append(fieldName);
	// where.append(" >= ");
	// where.append(fieldValues[0]);
	// } else if (MatchType.GT.equals(matchType)) {
	// where.append(fieldName);
	// where.append(" > ");
	// where.append(fieldValues[0]);
	// } else if (MatchType.LIKE.equals(matchType)) {
	// where.append(fieldName);
	// where.append(" like %");
	// where.append(fieldValues[0]);
	// where.append("% ");
	// } else if (MatchType.LIKE_START.equals(matchType)) {
	// where.append(fieldName);
	// where.append(" like %");
	// where.append(fieldValues[0]);
	// } else if (MatchType.LIKE_END.equals(matchType)) {
	// where.append(fieldName);
	// where.append(" like ");
	// where.append(fieldValues[0]);
	// where.append("% ");
	// } else if (MatchType.LIKE_ANYWHERE.equals(matchType)) {
	// where.append(fieldName);
	// where.append(" like %");
	// where.append(fieldValues[0]);
	// where.append("% ");
	// } else if (MatchType.BETWEEN.equals(matchType)) {
	// where.append(fieldName);
	// where.append(" between ");
	// where.append(fieldValues[0]);
	// where.append(" and ");
	// where.append(fieldValues[1]);
	// } else if (MatchType.NE.equals(matchType)) {
	// where.append(fieldName);
	// where.append(" <> ");
	// where.append(fieldValues[0]);
	// }
	// } catch (Exception e) {
	// throw ReflectionUtils.convertReflectionExceptionToUnchecked(e);
	// }
	// return where.toString();
	// }

	private String prepareCountSql(String orgSql) {
		String fromSql = orgSql;
		// select子句与order by子句会影响count查询,进行简单的排除.
		fromSql = "from " + StringUtils.substringAfter(fromSql, "from");
		fromSql = StringUtils.substringBefore(fromSql, "order by");
		String countSql = "select count(*) " + fromSql;
		return countSql;
	}

	private String toUnderscoreName(String name) {
		if (name == null)
			return null;

		String filteredName = name;
		if (filteredName.indexOf("_") >= 0 && filteredName.equals(filteredName.toUpperCase())) {
			filteredName = filteredName.toLowerCase();
		}
		if (filteredName.indexOf("_") == -1 && filteredName.equals(filteredName.toUpperCase())) {
			filteredName = filteredName.toLowerCase();
		}

		StringBuffer result = new StringBuffer();
		if (filteredName != null && filteredName.length() > 0) {
			result.append(filteredName.substring(0, 1).toLowerCase());
			for (int i = 1; i < filteredName.length(); i++) {
				String preChart = filteredName.substring(i - 1, i);
				String c = filteredName.substring(i, i + 1);
				if (c.equals("_")) {
					result.append("_");
					continue;
				}
				if (preChart.equals("_")) {
					result.append(c.toLowerCase());
					continue;
				}
				if (c.matches("\\d")) {
					result.append(c);
				} else if (c.equals(c.toUpperCase())) {
					result.append("_");
					result.append(c.toLowerCase());
				} else {
					result.append(c);
				}
			}
		}
		return result.toString();
	}

	private List<String> getUpdateColumns() {
		List<Column> columns = table.getColumns();
		List<String> updateColumns = new ArrayList<String>(columns.size());
		for (int i = 0; i < columns.size(); i++) {
			Column c = columns.get(i);
			if (c.isUpdatable() && !c.isPrimaryKey()) {
				updateColumns.add(c.getSqlName() + " = " + getColumnPlaceholder(c));
			}
		}
		return updateColumns;
	}

	private String getColumnPlaceholder(Column c) {
		return ":" + c.getPropertyName();
	}

	private static boolean isTransientProperty(Method readMethod) {
		if (readMethod.isAnnotationPresent(FieldIgnore.class)) {
			return true;
		}
		return false;
	}

}
