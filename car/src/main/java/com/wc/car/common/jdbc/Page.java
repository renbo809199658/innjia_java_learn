package com.wc.car.common.jdbc;

import java.util.Iterator;
import java.util.List;

import com.google.common.collect.Lists;

/**
 * 与具体ORM实现无关的分页查询结果封装.
 * 
 * @param <T>
 *            Page中记录的类型.
 */
public class Page<T> extends PageRequest implements Iterable<T> {

	protected List<T> aaData = null;
	
	protected long iTotalRecords = -1;
	
	public Page() {
	}

	public Page(PageRequest request) {
		this.iTotalDisplayRecords = request.iTotalDisplayRecords;
		this.iDisplayStart = request.iDisplayStart;
		this.iDisplayLength = request.iDisplayLength;
		this.sEcho = request.sEcho;
		this.orderBy = request.orderBy;
		this.orderDir = request.orderDir;
	}

	/**
	 * 获得页内的记录列表.
	 */
	public List<T> getAaData() {
		return aaData;
	}

	/**
	 * 设置页内的记录列表.
	 */
	public void setAaData(final List<T> aaData) {
		this.aaData = aaData;
	}

	/**
	 * 获得总记录数, 默认值为-1.
	 */
	public long getITotalRecords() {
		return iTotalRecords;
	}

	public long getITotalDisplayRecords() {
		return iTotalRecords;
	}
	
	
	
	public void setITotalDisplayRecords(final long iTotalDisplayRecords) {
		this.iTotalDisplayRecords = iTotalDisplayRecords;
	}
	

	/**
	 * 设置总记录数.
	 */
	public void setITotalRecords(final long iTotalRecords) {
		this.iTotalRecords = iTotalRecords;
	}

	/**
	 * 实现Iterable接口, 可以for(Object item : page)遍历使用
	 */
	public Iterator<T> iterator() {
		return aaData.iterator();
	}

	/**
	 * 根据pageSize与totalItems计算总页数.
	 */
	public int getTotalPages() {
		return (int) Math.ceil((double) iTotalRecords / (double) getIDisplayLength());

	}

	/**
	 * 是否还有下一页.
	 */
	public boolean hasNextPage() {
		return (getIDisplayStart() + 1 <= getTotalPages());
	}

	/**
	 * 是否最后一页.
	 */
	public boolean isLastPage() {
		return !hasNextPage();
	}

	/**
	 * 取得下页的页号, 序号从1开始. 当前页为尾页时仍返回尾页序号.
	 */
	public int getNextPage() {
		if (hasNextPage()) {
			return getIDisplayStart() + 1;
		} else {
			return getIDisplayStart();
		}
	}

	/**
	 * 是否还有上一页.
	 */
	public boolean hasPrePage() {
		return (getIDisplayStart() > 1);
	}

	/**
	 * 是否第一页.
	 */
	public boolean isFirstPage() {
		return !hasPrePage();
	}

	/**
	 * 取得上页的页号, 序号从1开始. 当前页为首页时返回首页序号.
	 */
	public int getPrePage() {
		if (hasPrePage()) {
			return getIDisplayStart() - 1;
		} else {
			return getIDisplayStart();
		}
	}

	/**
	 * 计算以当前页为中心的页面列表,如"首页,23,24,25,26,27,末页"
	 * 
	 * @param count
	 *            需要计算的列表大小
	 * @return pageNo列表
	 */
	public List<Integer> getSlider(int count) {
		int halfSize = count / 2;
		int totalPage = getTotalPages();

		int startPageNo = Math.max(getIDisplayStart() - halfSize, 1);
		int endPageNo = Math.min(startPageNo + count - 1, totalPage);

		if (endPageNo - startPageNo < count) {
			startPageNo = Math.max(endPageNo - count, 1);
		}

		List<Integer> result = Lists.newArrayList();
		for (int i = startPageNo; i <= endPageNo; i++) {
			result.add(i);
		}
		return result;
	}


	public void setSortBy(String sortBy) {
		this.orderBy = sortBy;
	}

	public void setOrder(String order) {
		this.orderDir = order;
	}

	public void setPage(Integer page) {
		this.iDisplayStart = page;
	}
}
