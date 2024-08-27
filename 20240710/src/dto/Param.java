package dto;

// 글 시작번호랑 글 끝번호랑 같이 내용, 이름, 내용+이름 카테고리 같이 저장하는 클래스
public class Param {
	private int startNo;
	private int endNo;
	private String category;
	private String item;
	
	public Param() {
	}
	
	public Param(int startNo, int endNo, String category, String item) {
		this.startNo = startNo;
		this.endNo = endNo;
		this.category = category;
		this.item = item;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	@Override
	public String toString() {
		return "Param [startNo=" + startNo + ", endNo=" + endNo + ", category=" + category + ", item=" + item + "]";
	}
	
	
}
