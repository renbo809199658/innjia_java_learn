package com.wc.car.common.jdbc;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.Validate;

import com.google.common.collect.Lists;

public class PageRequest {
	protected int iDisplayStart = 1;

	protected String orderBy = null;
	protected String orderDir = null;
	protected int iDisplayLength = 10;
	protected int sEcho = 1;
	protected int iSortCol_0 = -1;
	protected String sSortDir_0;
	protected String sColumns;

	protected long iTotalDisplayRecords;
	protected boolean countTotal = true;

	public PageRequest() {
	}

	public PageRequest(int iDisplayStart, int pageSize, int iDisplayLength, int sEcho) {
		this.iDisplayStart = iDisplayStart;
		this.iDisplayLength = iDisplayLength;
		this.sEcho = sEcho;
	}

	public int getsEcho() {
		return sEcho;
	}

	public void setsEcho(int sEcho) {
		this.sEcho = sEcho;
	}

	/**
	 * 获得每页的记录数量, 默认为不分页.
	 */
	public int getIDisplayLength() {
		return iDisplayLength == 0 ? Integer.MAX_VALUE : iDisplayLength;
	}

	/**
	 * 获得当前页的页号, 序号从1开始, 默认为1.
	 */
	public int getIDisplayStart() {
		return iDisplayStart;
	}

	/**
	 * 设置当前页的页号, 序号从1开始, 低于1时自动调整为1.
	 */
	public void setIDisplayStart(final int iDisplayStart) {
		this.iDisplayStart = iDisplayStart;

		if (iDisplayStart < 1) {
			this.iDisplayStart = 1;
		}
	}

	/**
	 * 设置每页的记录数量, 低于1时自动调整为1.
	 */
	public void setIDisplayLength(final int pageSize) {
		this.iDisplayLength = pageSize;

		if (pageSize < 1) {
			this.iDisplayLength = 1;
		}
	}

	/**
	 * 获得排序字段, 无默认值. 多个排序字段时用','分隔.
	 */
	public String getOrderBy() {
		if (getsColumns() == null) {
			return "";
		}

		String[] columns = getsColumns().split(",");
		String column = columns[this.getiSortCol_0()];
		setOrderBy(column);
		return column;
	}

	/**
	 * 设置排序字段, 多个排序字段时用','分隔.
	 */
	public void setOrderBy(final String orderBy) {
		this.orderBy = orderBy;
	}

	/**
	 * 获得排序方向, 无默认值.
	 */
	public String getOrderDir() {
		// TODO 设置排序方向
		this.orderDir = getsSortDir_0();
		return orderDir;
	}

	/**
	 * 设置排序方式向.
	 * 
	 * @param orderDir
	 *          可选值为desc或asc,多个排序字段时用','分隔.
	 */
	public void setOrderDir(final String orderDir) {
		String lowcaseOrderDir = StringUtils.lowerCase(orderDir);

		// 检查order字符串的合法值
		String[] orderDirs = StringUtils.split(lowcaseOrderDir, ',');
		for (String orderDirStr : orderDirs) {
			if (!StringUtils.equals(Sort.DESC, orderDirStr)
			    && !StringUtils.equals(Sort.ASC, orderDirStr)) {
				throw new IllegalArgumentException("排序方向" + orderDirStr
				    + "不是合法值");
			}
		}

		this.orderDir = lowcaseOrderDir;
	}

	/**
	 * 获得排序参数.
	 */
	public List<Sort> getSort() {
		String[] orderBys = StringUtils.split(getOrderBy(), ',');
		String[] orderDirs = StringUtils.split(getOrderDir(), ',');
		Validate.isTrue(orderBys.length == orderDirs.length,
		    "分页多重排序参数中,排序字段与排序方向的个数不相等");

		List<Sort> orders = Lists.newArrayList();
		for (int i = 0; i < orderBys.length; i++) {
			orders.add(new Sort(orderBys[i], orderDirs[i]));
		}

		return orders;
	}

	/**
	 * 是否已设置排序字段,无默认值.
	 */
	public boolean isOrderBySetted() {
		return (StringUtils.isNotBlank(getOrderBy()) && StringUtils
		    .isNotBlank(sSortDir_0));
	}

	/**
	 * 是否默认计算总记录数.
	 */
	public boolean isCountTotal() {
		return countTotal;
	}

	/**
	 * 设置是否默认计算总记录数.
	 */
	public void setCountTotal(boolean countTotal) {
		this.countTotal = countTotal;
	}

	/**
	 * 根据pageNo和pageSize计算当前页第一条记录在总结果集中的位置, 序号从0开始.
	 */
	public int getOffset() {
		if (iDisplayStart == 1) {
			iDisplayStart = 0;
		}
		return iDisplayStart;
	}

	public static class Sort {
		public static final String ASC = "asc";
		public static final String DESC = "desc";

		private final String property;
		private final String dir;

		public Sort(String property, String dir) {
			this.property = property;
			this.dir = dir;
		}

		public String getProperty() {
			return property;
		}

		public String getDir() {
			return dir;
		}
	}

	public int getiSortCol_0() {
		return iSortCol_0;
	}

	public void setiSortCol_0(int iSortCol_0) {
		this.iSortCol_0 = iSortCol_0;
	}

	public String getsSortDir_0() {
		return sSortDir_0;
	}

	public void setsSortDir_0(String sSortDir_0) {
		this.sSortDir_0 = sSortDir_0;
	}

	public String getsColumns() {
		return sColumns;
	}

	public void setsColumns(String sColumns) {
		this.sColumns = sColumns;
	}
}
