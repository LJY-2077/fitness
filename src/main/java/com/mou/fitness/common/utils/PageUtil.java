/**  
* @Title: PageUtil.java
* @Package com.mou.fitness.common.utils
* @Description: TODO(用一句话描述该文件做什么)
* @author lijingyang   
* @date 2018年1月25日 下午5:32:14
* @version V1.0  
*/
package com.mou.fitness.common.utils;

import java.util.List;

import org.codehaus.jackson.annotate.JsonIgnore;

/**
 * @ClassName: PageUtil
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author li jingyang
 * @date 2018年1月25日 下午5:32:14
 *
 */
public class PageUtil
{

	private int rows;

	private int total;

	private int page;

	private String orderStr;

	private String sort;

	private String order;

	private Object queryObj;

	private List<?> data;

	@JsonIgnore
	public String getOrderStr()
	{
		orderStr = "";
		if (!org.springframework.util.StringUtils.isEmpty(order))
		{
			String[] orders = order.split(",");
			String[] sorts = sort.split(",");
			for (int i = 0; i < sorts.length; i++)
			{
				orderStr += sorts[i] + " " + orders[i] + ", ";
			}
			orderStr = orderStr.endsWith(", ") ? orderStr.substring(0, orderStr.length() - 2) : orderStr;
		}
		return orderStr;
	}

	@JsonIgnore
	public int getPageSize()
	{
		return rows;
	}

	public List<?> getRows()
	{
		return data;
	}

	public void setRows(int rows)
	{
		this.rows = rows;
	}

	public int getTotal()
	{
		return total;
	}

	public void setTotal(int total)
	{
		this.total = total;
	}

	@JsonIgnore
	public int getPage()
	{
		return page;
	}

	public void setPage(int page)
	{
		this.page = page;
	}

	@JsonIgnore
	public String getSort()
	{
		return sort;
	}

	public void setSort(String sort)
	{
		this.sort = sort;
	}

	@JsonIgnore
	public String getOrder()
	{
		return order;
	}

	public void setOrder(String order)
	{
		this.order = order;
	}

	@JsonIgnore
	public Object getQueryObj()
	{
		return queryObj;
	}

	public void setQueryObj(Object queryObj)
	{
		this.queryObj = queryObj;
	}

	public void setOrderStr(String orderStr)
	{
		this.orderStr = orderStr;
	}

	public void setData(List<?> data)
	{
		this.data = data;
	}

	@Override
	public String toString()
	{
		return "PageUtil [rows=" + rows + ", total=" + total + ", page=" + page + ", orderStr=" + orderStr + ", sort="
				+ sort + ", order=" + order + ", queryObj=" + queryObj + ", data=" + data + "]";
	}
}
