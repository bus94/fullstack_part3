package dto;

import java.util.Date;

// 게시글 한 건을 저장하는 클래스
public class MvcBoardDTO {
	private int idx;			// 글번호
	private String name;		// 작성자
	private String subject;		// 글제목
	private String content;		// 게시물 내용
	private int gup;			// 댓글용
	private int lev;			// 댓글용
	private int seq;			// 댓글용
	private int hit;			// 조회수
	private Date writeDate;		// 작성시간(일)
	
	public MvcBoardDTO() {
	}

	public MvcBoardDTO(int idx, String name, String subject, String content, int gup, int lev, int seq, int hit,
			Date writeDate) {
		this.idx = idx;
		this.name = name;
		this.subject = subject;
		this.content = content;
		this.gup = gup;
		this.lev = lev;
		this.seq = seq;
		this.hit = hit;
		this.writeDate = writeDate;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getGup() {
		return gup;
	}

	public void setGup(int gup) {
		this.gup = gup;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "[idx=" + idx + ", name=" + name + ", subject=" + subject + ", content=" + content + ", gup="
				+ gup + ", lev=" + lev + ", seq=" + seq + ", hit=" + hit + ", writeDate=" + writeDate + "]\n";
	}

	
}
