package memberlist; // 기본 패키지에서 클래스 생성하면 안된다. - 중복되기 때문

// VO클래스 (읽기)
// 자바로 처리하는 최소한의 작업 단위로 데이터를 기억하는 필드와 메서드로 저장되어있다.
// bean

// 자바 빈즈 규칙
// 1. 기본 패키지 이외에 다른 패키지에 속해있어야 된다.
// 2. 멤버 변수(필드) 접근지정자 private 선언한다.
// 3. 반드시 기본생성자는 있어야 된다.
// 4. 멤버변수에 접근하는 setter/getter 메서드 있어야 한다.
// 5. setter/getter는 접근제어자는 public 선언 한다.

/*
 * <jsp:useBean id="객체 이름" class="사용할 패키지와 클래스명" scope="저장할 시스템 영역이름">
 * 		// scope 속성을 안쓰면 기본적으로 현재 page에서만 사용이 가능하다.
 * 
 *		<jsp:setProperty property="*" name = "vo2" />
 *	</jsp:useBean>
 * 
 */

public class Member {
	// 필드 선언시
	// VO 필드 이름과 form을 구성하는 요소들의 name속성이름과 반드시 똑같이 만들어야 된다.

	private String id;
	private String name;
	private String password;
	private int age;
	private boolean gender;
	private String ip;

	public Member() {
	}

	public Member(String id, String name, String password, int age, boolean gender, String ip) {
		this.id = id;
		this.name = name;
		this.password = password;
		this.age = age;
		this.gender = gender;
		this.ip = ip;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public boolean isGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", name=" + name + ", password=" + password + ", age=" + age + ", gender=" + gender
				+ ", ip=" + ip + "]";
	}
}
