package dto;

import java.util.Date;

// 방명록을 작성할 한 건의 데이터를 저장하는 클래스
public class GuestbookDTO {
	// 모든 변수는 private 선언
	// 기본생성자
	// setter/getter 필수

	private int idx; // 글번호
	private String name; // 작성자
	private String password; // 비밀번호
	private String memo; // 게시글
	private Date writeDate; // 작성일
	private String ip; // 작성자 ip 주소

	public GuestbookDTO() {
		super();
	}

	public GuestbookDTO(int idx, String name, String password, String memo, Date writeDate, String ip) {
		super();
		this.idx = idx;
		this.name = name;
		this.password = password;
		this.memo = memo;
		this.writeDate = writeDate;
		this.ip = ip;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@Override
	public String toString() {
		return "GuestbookDTO [idx=" + idx + ", name=" + name + ", password=" + password + ", memo=" + memo
				+ ", writeDate=" + writeDate + ", ip=" + ip + "]";
	}

}
