package rentcar;

// 차 예약할 때 정보들을 저장하는 클래스
public class CarReserveDTO {
	private int no; 
	private String id;
	private int qty; 
	private int dday; 
	private String rday; 
	private int usein; 
	private int usewifi; 
	private int usenavi;
	private int useseat;
	
	public CarReserveDTO() {
	}

	public CarReserveDTO(int no, String id, int qty, int dday, String rday, int usein, int usewifi, int usenavi,
			int useseat) {
		this.no = no;
		this.id = id;
		this.qty = qty;
		this.dday = dday;
		this.rday = rday;
		this.usein = usein;
		this.usewifi = usewifi;
		this.usenavi = usenavi;
		this.useseat = useseat;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getDday() {
		return dday;
	}

	public void setDday(int dday) {
		this.dday = dday;
	}

	public String getRday() {
		return rday;
	}

	public void setRday(String rday) {
		this.rday = rday;
	}

	public int getUsein() {
		return usein;
	}

	public void setUsein(int usein) {
		this.usein = usein;
	}

	public int getUsewifi() {
		return usewifi;
	}

	public void setUsewifi(int usewifi) {
		this.usewifi = usewifi;
	}

	public int getUsenavi() {
		return usenavi;
	}

	public void setUsenavi(int usenavi) {
		this.usenavi = usenavi;
	}

	public int getUseseat() {
		return useseat;
	}

	public void setUseseat(int useseat) {
		this.useseat = useseat;
	}

	@Override
	public String toString() {
		return "[no=" + no + ", id=" + id + ", qty=" + qty + ", dday=" + dday + ", rday=" + rday
				+ ", usein=" + usein + ", usewifi=" + usewifi + ", usenavi=" + usenavi + ", useseat=" + useseat + "]";
	}
	
	
}
