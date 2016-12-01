package com.devkim.codeBrokers.util;

import org.springframework.stereotype.Component;

@Component("bbs")
public class Page {
	int startRow, endRow;
	StringBuffer sb;
	
	private static Page page = new Page();
	private Page() {};
	public static Page getInstance() {
		if (page == null) {
			page = new Page();
		}
		return page;
	}
	
	public synchronized void paging(int pageNum, int totalCount, int pageSize, int pageBlock, String category) {
		int totalPage = (int)Math.ceil((double)totalCount/pageSize);
		startRow = (pageNum - 1) * pageSize + 1;
		endRow = pageNum * pageSize;
		
		int startPage = (int)((pageNum - 1) / pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;	
		
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		
		sb = new StringBuffer();
		
		if (startPage < pageBlock) {
			
		} else {
			sb.append("<a href='list.bbs?pageNum=");
			sb.append(startPage - pageBlock);
			sb.append("&category=" + category + "'>");
			sb.append("<span style='cursor:pointer'>&laquo; prev</span></a>");
		}
		
		sb.append("&nbsp;&nbsp;|");
		for (int i = startPage; i <= endPage; i++) {
			if (i == pageNum) {
				sb.append("&nbsp;&nbsp;<b><font color='#91B7EF'>");
				sb.append(i);
				sb.append("</font></b>");
			} else {
				sb.append("&nbsp;&nbsp;<a href='list.bbs?pageNum=");
				sb.append(i);
				sb.append("&category=" + category + "'>");
				sb.append(i);
				sb.append("</a>");
			}
		}
		
		sb.append("&nbsp;&nbsp;|&nbsp;&nbsp;");
		if (totalPage > endPage) {
			sb.append("<a href='list.bbs?pageNum=");
			sb.append(startPage + pageBlock);
			sb.append("&category=" + category + "'>");
			sb.append("<span style='cursor:pointer'>next &raquo;</span></a>");
		} else {
			
		}
	}
	
	public int getStartRow() {		
		return startRow;
	}
	
	public int getEndRow() {	
		return endRow;
	}
	
	public StringBuffer getsb() {
		return sb;
	}
}
