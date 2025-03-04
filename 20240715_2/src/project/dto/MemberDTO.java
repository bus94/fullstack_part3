package project.dto;

public class MemberDTO {
	private String id;
	private String passwd;
	private String name;
	private String reg_date;
	private String address;
	private String tel;
	
	public MemberDTO() {
		super();
	}
	
	public MemberDTO(String id, String passwd, String name, String reg_date, String address, String tel) {
		super();
		this.id = id;
		this.passwd = passwd;
		this.name = name;
		this.reg_date = reg_date;
		this.address = address;
		this.tel = tel;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", passwd=" + passwd + ", name=" + name + ", reg_date=" + reg_date + ", address="
				+ address + ", tel=" + tel + "]";
	}
	
}
