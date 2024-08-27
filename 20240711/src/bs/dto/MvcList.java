package bs.dto;

import java.util.ArrayList;

// 게시글의 개수가 많으면 한 페이지에 보여줄 수 없기 때문에 페이징 처리를 한다. 
// 페이지징 처리의 정보를 저장하는 8개 변수
public class MvcList {

	ArrayList<MvcDTO> list = new ArrayList<MvcDTO>();
	
	private int pageSize;		// 한 페이지에 보여줄 게시글 수
	private int totalCount;		// 전체 게시글 수
	private int totalPage; 		// 전체 페이지 수
	private int currentPage;	// 현재 페이지 번호
	private int startNo;		// 현재 페이지의 시작 번호
	private int endNo;			// 현재 페이지의 끝 번호
	private int startPage;		// 시작 페이지
	private int endPage;		// 끝 페이지
	
	public MvcList() {
		super();
	}
	
	public MvcList(int pageSize, int totalCount, int currentPage) {
		super();
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		
		init();
	}
	
	// 실제 매개변수 받아온 데이터를 이용해서 총 페이지, 게시글의 시작 번호, 끝 번호를 계산한다.
	private void init() {
		// 총 페이지
		// 무조건 올림 처리 된다.
		/* totalPage = (totalCount / pageSize) + 1; */
		totalPage = (totalCount % pageSize) == 0 ? (totalCount / pageSize) : (totalCount / pageSize) + 1;
		
		// 현재 페이지
		// 위에 무조건 1을 증가하면 총 페이지 수를 넘길 수도 있다(나머지가 0이 되는 경우 ex.25개 게시물을 5개의 페이지로 나눌 때 5번 페이지가 아닌 6번 페이지가 있어 에러 발생할 수 있다.)
		// 시작 글의 번호와 끝 번호는 없기 때문에 에러 발생할 수 있다.
		currentPage = currentPage > totalPage ? totalPage : currentPage;
		
		// 첫 번째 글과 마지막 글을 계산
		startNo = (currentPage - 1) * pageSize + 1; // mysql에서는 startNo = (currentPage - 1) * pageSize;로 작성! (∵ 인덱스가 0번부터 시작하기 때문)
		endNo = startNo + pageSize - 1;
		
		// 마지막 글 번호가 없을 수도 있다. (totalCount가 큰 경우 초과했으므로 totalCount로 변경해주기)
		endNo = endNo > totalCount ? totalCount : endNo;
		
	}

	public ArrayList<MvcDTO> getList() {
		return list;
	}

	public void setList(ArrayList<MvcDTO> list) {
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
		return "MvcList [list=" + list + ", pageSize=" + pageSize + ", totalCount=" + totalCount + ", totalPage="
				+ totalPage + ", currentPage=" + currentPage + ", startNo=" + startNo + ", endNo=" + endNo
				+ ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
	
}