package rentcar;

// DB로 접근하기 위해서 사용하는 클래스
public class RentcarDTO {
	private int no;				// 자동차 번호
    private String name;		// 자동차명
    private int category;		// 소형, 중형, 대형 분류
    private int price;			// 하루 렌트 가격
    private int use_people;		// 자동차 인원 수
    private String company;		// 자동차 회사
    private String img;			// 자동차 이미
    private String info;		// 자동차 정보
    
    // 액션태그를 이용해서 객체를 자동으로 생성할 때는 무조건 기본 생성자가 있어야 한다.
	public RentcarDTO() {
	}

	public RentcarDTO(int no, String name, int category, int price, int use_people, String company, String img,
			String info) {
		this.no = no;
		this.name = name;
		this.category = category;
		this.price = price;
		this.use_people = use_people;
		this.company = company;
		this.img = img;
		this.info = info;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getUse_people() {
		return use_people;
	}

	public void setUse_people(int use_people) {
		this.use_people = use_people;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	@Override
	public String toString() {
		return "RentcarDTO [no=" + no + ", name=" + name + ", category=" + category + ", price=" + price
				+ ", use_people=" + use_people + ", company=" + company + ", img=" + img + ", info=" + info + "]";
	}
    
}
