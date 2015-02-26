package net.xieee.util;

import java.io.Serializable;
import java.util.List;

public class Pager implements Serializable {
	
	/**
	 * serialVersionUID.
	 */
	private static final long serialVersionUID = 7343703255664740446L;

	public static final Integer MAX_PAGE_SIZE = 500;// 每页最大记录数限制

	private Integer pageNumber = 1;// 当前页码
	private Integer pageSize = 15;// 每页记录数
	private Integer pageCount = 0;// 总页数
	private Integer totalRows = 0;
	private boolean haveNextPage = false;
	private boolean havePrePage = false;
	private String keyWord;  //查询关键字r
	@SuppressWarnings("unchecked")
	private List list;// 数据List
	private String order = "asc";

	public Integer getPageNumber() {
		return pageNumber;
	}

	
	public Integer getTotalRows() {
		return totalRows;
	}

	public boolean isHaveNextPage() {  
        haveNextPage = false;  
        if ((getPageCount() > 1) && (getPageCount() > pageNumber))  
        	haveNextPage = true;  
        return haveNextPage;  
    }  
  
    public boolean isHavePrePage() {  
        havePrePage = false;  
        if ((getPageCount() > 1) && (pageNumber > 1))  
            havePrePage = true;  
        return havePrePage;  
    }  
    
	public void setTotalRows(Integer totalRows) {
		this.totalRows = totalRows;
	}


	public void setPageNumber(Integer pageNumber) {
		if (pageNumber < 1) {
			pageNumber = 1;
		}
		this.pageNumber = pageNumber;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		if (pageSize < 1) {
			pageSize = 1;
		} else if(pageSize > MAX_PAGE_SIZE) {
			pageSize = MAX_PAGE_SIZE;
		}
		this.pageSize = pageSize;
	}
	
	
	public Integer getPageCount() {
		pageCount = totalRows / pageSize;
		if (totalRows % pageSize > 0) {
			pageCount ++;
		}
		return pageCount;
	}
	
	
	public void setHaveNextPage(boolean haveNextPage) {
		this.haveNextPage = haveNextPage;
	}


	public void setHavePrePage(boolean havePrePage) {
		this.havePrePage = havePrePage;
	}


	public  Pager Pager(Integer totalRows,Integer pageSize,Integer currentPage){
		this.totalRows = totalRows;
		this.pageSize = pageSize;
		this.pageNumber = currentPage;
		Pager pager = new Pager();
		pager.setPageSize(pageSize);
		pager.setPageNumber(currentPage);
		pager.setPageCount(getPageCount());
		pager.setHaveNextPage(isHaveNextPage());
		pager.setHavePrePage(isHavePrePage());
		pager.setTotalRows(totalRows); // 总记录数
		return pager;
	}
	
	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}

	
	@SuppressWarnings("unchecked")
	public List getList() {
		return list;
	}

	@SuppressWarnings("unchecked")
	public void setList(List list) {
		this.list = list;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

}