package com.project.dto;

import java.util.ArrayList;

public class ListDTO {
	private int pageSize;		// 한 페이지에 보여줄 게시글 수
	private int totalCount;		// 전체 게시글 수
	private int totalPage; 		// 전체 페이지 수
	private int currentPage;	// 현재 페이지 번호
	private int startNo;		// 현재 페이지의 시작 번호
	private int endNo;			// 현재 페이지의 끝 번호
	private int startPage;		// 시작 페이지
	private int endPage;		// 끝 페이지
	private int checkCount;		// 조회수
	
	ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
	
	public ListDTO() {}
	
	public ListDTO(int pageSize, int totalCount, int currentPage) {
		super();
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		
		init();
	}

	private void init() {
		int checkPage = (totalCount / pageSize);
		totalPage = (totalCount % pageSize) == 0 ? checkPage : checkPage + 1;
		currentPage = currentPage > totalPage ? totalPage : currentPage;
		
		startNo = (currentPage - 1) * pageSize + 1;
		endNo = startNo + pageSize - 1;
		
		endNo = endNo > totalCount ? totalCount : endNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getCheckCount() {
		return checkCount;
	}

	public void setCheckCount(int checkCount) {
		this.checkCount = checkCount;
	}

	public ArrayList<MemberDTO> getList() {
		return list;
	}

	public void setList(ArrayList<MemberDTO> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "ListDTO [pageSize=" + pageSize + ", totalCount=" + totalCount + ", totalPage=" + totalPage
				+ ", currentPage=" + currentPage + ", startNo=" + startNo + ", endNo=" + endNo + ", startPage="
				+ startPage + ", endPage=" + endPage + ", checkCount=" + checkCount + ", list=" + list + "]";
	}
}
