package memberList;

import java.util.Arrays;

// 서블릿(자바파일)
// 자바에서 우베 클라이언트가 요청한 데이터를 처리
// 그 데이터 한 건을 저장하는 클래스
public class Member {
	private String id;
	private String pw;
	private String name;
	private String email;
	private String[] hobby;
	
	public Member() {
	}

	public Member(String id, String pw, String name, String email, String[] hobby) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.hobby = hobby;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String[] getHobby() {
		return hobby;
	}

	public void setHobby(String[] hobby) {
		this.hobby = hobby;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pw=" + pw + ", name=" + name + ", email=" + email + ", hobby="
				+ Arrays.toString(hobby) + "]";
	}
	
}
