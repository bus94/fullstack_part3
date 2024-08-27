package dto;

import java.util.ArrayList;

// 1페이지 분량의 글 목록과 페이징 작업에 사용할 8개의 변수를 초기화하는 클래스

// 페이징
// - 게시물이 많을 경우 목록을 1~20개 정도씩 나눠 페이지별로 출력하는 기능
//  페이징 기능이 없을 경우 
//  - 스크롤이 길어지게 되어 사용자가 목록에서 원하는 게시글 찾기 어려워진다.
//	- 전송해야 할 데이터가 많아지므로 페이지 로딩속도가 느려진다.
//	- 한꺼번에 많은 데이터를 처리해야하므로 DB 과부화
public class GuestbookList {

	// 1. 여러 개의 게시글을 저장하는 List를 선언
	// - 1페이지 분량의 글 목록을 기억하는 list
	private ArrayList<GuestbookDTO> list = new ArrayList<GuestbookDTO>();

	// 2. 페이징 작업에 필요한 8개 변수를 선언한다.
	// 한 페이지에 표시할 글의 개수 (한 페이지의 게시물 개수)
	private int pageSize = 10;

	// 총 게시글의 개수
	private int totalCount = 0;
	// 전체 페이지 개수
	private int totalPage = 0;
	// 현재 브라우저에 표시되는 페이지 번호
	private int currentPage = 1;

	// DB에서 데이터를 꺼내오기 위해서 시작 하는 번호와 끝나는 번호를 저장하는 변수
	private int startNo = 0;
	private int endNo = 0;

	// 페이지 이동을 하기 위한 버튼
	private int startPage = 0;
	private int endPage = 0;

	// 3. 변수 선언 후 시작
	// 테이블에 저장된 글의 개수를 카운트(전체)
	private void calc() {
		// 전체 페이지 수를 계산
		// 전체 게시길 수 / pageSize
		// 18개의 게시글을 5개씩 보여준다.
//		totalPage = totalCount / pageSize;
//		totalPage = (totalCount - 1) / pageSize + 1;
//		totalPage = (int) Math.ceil(totalCount / pageSize) != 0 ? 나머지값이 0보다 크면 +1 : 나머지값이 0이면 +0;

		// DB에서 현재 보고 있는 페이지를 기준으로 값을 가져오기
		// 시작값을 구하는 공식 : (현재 페이지 - 1) * pageSize + 1; (+1을 하는 이유는 오라클에선 시작하는 인덱스가 1부터
		// 시작이기 때문에)
		/*
		 * endNo = startNo + endNo - 1;
		 * 
		 * 제일 마지막 번호는 데이터가 비어있을 수 있다. endNo = endNo > totalCount ? totalCount : endNo;
		 */

		totalPage = (totalCount / pageSize) + 1;
		startNo = (currentPage - 1) * pageSize + 1;
		endNo = Math.min(startNo + pageSize - 1, totalCount); // 더 작은 값
	}

	public GuestbookList() {
	}

	public GuestbookList(int pageSize, int totalCount, int currentPage) {
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		// 위의 변수들 외에 나머지는 페이징 처리를 위해서 계산 후 초기화 시킬 것!

		calc();
	}

	public ArrayList<GuestbookDTO> getList() {
		return list;
	}

	public void setList(ArrayList<GuestbookDTO> list) {
		this.list = list;
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

	@Override
	public String toString() {
		return "GuestbookList [list=" + list + ", pageSize=" + pageSize + ", totalCount=" + totalCount + ", totalPage="
				+ totalPage + ", currentPage=" + currentPage + ", startNo=" + startNo + ", endNo=" + endNo
				+ ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
	
}
