package rentcar;

import java.sql.*;
import java.util.ArrayList;

// 자동차의 정보를 한 건 저장하는 클래스
public class RentcarDAO {

	private RentcarDAO() {
	}

	private static RentcarDAO instance = new RentcarDAO();

	public static RentcarDAO getInstance() {
		return instance;
	}

	// DB 접근 시 사용하는 클래스들을 전역변수로 생성한다.
	// 클래스 안에 어떤 함수에서든 사용할 수 있도록 클래스 멤버 변수를 선언한다.
	private Connection conn = null;
	private PreparedStatement pt = null;
	private ResultSet rs = null;

	// DB 연결 정보 생성하는 메서드
	private Connection getConnection() {
		// 1. url, user, password 가져오기
		// 2. mysql 드라이버 가져오기
		// 3. DriverManager 클래스 이용해서 DB 연결 Connection 객체 생성하기
		// 예외 처리하기

		String url = "jdbc:mysql://localhost:3306/rentcardb04";
		String user = "root";
		String password = "1234";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		/* System.out.println("연결 확인: " + conn); */
		return conn;
	}

	// 로그인을 확인하는 메서드
	public int getMember(String id, String pw) {
		int result = 0;
		try {
			// 1. DB 연결
			conn = getConnection();

			// 2. 예외발생 - try~catch문

			// 3. sql문 작성
			String sql = "select count(*) from member where id = ? and pw1 = ? ";

			// 4. sql 검사 후 메서드 가져오기
			pt = conn.prepareStatement(sql);

			// 5. ? 물음표 채우기
			pt.setString(1, id);
			pt.setString(2, pw);

			// 6. DB전송 (sql문 실행)
			rs = pt.executeQuery();

			// 7. 결과
			if (rs.next()) {
				result = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		// 8. jsp 페이지로 전송 (return)
		return result;
	}

	// 자동차 정보 3개를 꺼내오는 메서드
	public ArrayList<RentcarDTO> getSelectCar() {
		ArrayList<RentcarDTO> list = null;

		try {
			// 1. DB 연결
			conn = getConnection();

			// 2. sql 명령문 + 전송해서 데이터 가져오기
			// 최신순으로 가져오려면
			// "select * from rentcar order by no desc limit 3"
			String sql = "select * from rentcar order by no desc limit 3";

			pt = conn.prepareStatement(sql);
			rs = pt.executeQuery();

			// 3. ArrayList 담기
			/*
			 * list = new ArrayList<RentcarDTO>(); while(rs.next()) {
			 * 
			 * }
			 */

			if (rs.next()) {
				list = new ArrayList<RentcarDTO>();

				do {
					RentcarDTO bean = new RentcarDTO(rs.getInt("no"), rs.getString("name"), rs.getInt("category"),
							rs.getInt("price"), rs.getInt("use_people"), rs.getString("company"), rs.getString("img"),
							rs.getString("info"));

					list.add(bean);
				} while (rs.next());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		// 4. 리턴 (jsp 파일로 전송)
		return list;
	}

	// no를 이용해서 DB에서 한 건의 차량 정보를 저장하는 메서드를 생성
	public RentcarDTO getSelectByNo(int no) {
		RentcarDTO dto = null;
		try {
			// 1. DB 연결
			conn = getConnection();

			// 2. sql 명령문 작성
			String sql = "select * from rentcar where no = ? ";
			pt = conn.prepareStatement(sql);
			pt.setInt(1, no);

			// 3. sql문 전송
			rs = pt.executeQuery();

			// 4. 결과 받아오면 RentcarDTO 저장하기
			if (rs.next()) {
				do {
					dto = new RentcarDTO(rs.getInt("no"), rs.getString("name"), rs.getInt("category"),
							rs.getInt("price"), rs.getInt("use_people"), rs.getString("company"), rs.getString("img"),
							rs.getString("info"));
				} while (rs.next());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		// 5. 리턴하기
		return dto;
	}

	// category를 이용
	public ArrayList<RentcarDTO> getSelectByCategory(int category) {
		ArrayList<RentcarDTO> list = null;
		try {
			conn = getConnection();

			String sql = "select * from rentcar where category = ? ";
			pt = conn.prepareStatement(sql);
			pt.setInt(1, category);

			rs = pt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<RentcarDTO>();
				do {
					RentcarDTO bean = new RentcarDTO(rs.getInt("no"), rs.getString("name"), rs.getInt("category"),
							rs.getInt("price"), rs.getInt("use_people"), rs.getString("company"), rs.getString("img"),
							rs.getString("info"));

					list.add(bean);
				} while (rs.next());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// 예약한 정보를 DB에 저장하는 메서드
	public void setReserveCar(CarReserveDTO rbean) {

		try {
			int num = 0;

			// 1. DB 연결 예외 발생처리
			conn = getConnection();

			// 2. sql 명령문 작성
			// 현재 autoincrement로 되어있지 않았기 때문에(이건 상황마다 다르니 DB 확인하면 될듯)
			// 가장 미자막에 저장된 번호를 가지고 와서 1을 더해서 새로운 값을 reserve_seq 값 넣기
			String sql = "select MAX(reserve_seq) from car_reserve";

			// 3. sql 검사 후 메서드 반환
			pt = conn.prepareStatement(sql);
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			}

			// 4. 물음표 채우기 - sql 실행
			sql = "INSERT INTO car_reserve (reserve_seq , no, id, qty, d_day, r_day, use_in, use_wifi, use_navi, use_seat) "
					+ " VALUES(?, ?,?,?,?,?,?,?,?,?) ";
			pt = conn.prepareStatement(sql);
			
			pt.setInt(1, num);
			pt.setInt(2, rbean.getNo());
			pt.setString(3, rbean.getId());
			pt.setInt(4, rbean.getQty());
			pt.setInt(5, rbean.getDday());
			pt.setString(6, rbean.getRday());
			pt.setInt(7, rbean.getUsein());
			pt.setInt(8, rbean.getUsewifi());
			pt.setInt(9, rbean.getUsenavi());
			pt.setInt(10, rbean.getUseseat());
			
			pt.executeUpdate();

			// 5. 결과 리턴(void 타입이면 return 필요없음)

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 예약한 차량의 정보를 가져오는 메서드
	public ArrayList<CarReserveDTO> selectReserveCar() {
		ArrayList<CarReserveDTO> reserveCarList = null;
		
		
		return reserveCarList;
	}

}


/*
 * MVC 디자인 설계 패턴 Model : 데이터 조회 결과값을 저장할 객체 (VO, DTO) - DB도 포함 View : 화면 구성
 * (html, css, jsp, js, ...) Controller : DB에 접근할 수 있는 코드가 담긴 객체(DAO, service),
 * Model과 View를 연결
 * 
 * [jsp 방식] [model1 방식] main.jsp → add.jsp → info.jsp ↕ dao.jsp 각 페이지마다 필요 시 자바
 * 코드가 작성되며 DB와 연결하는 코드도 jsp 파일 안에서 모두 작성된다. 분리되어 있지 않아 규모가 작은 프로젝트에서는 나쁘지 않은
 * 방식이지만 코드가 확장될수록 가독성이 떨어지고, 분업이 어려워지고, 유지보수가 떨어진다.
 * 
 */
