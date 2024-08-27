package bookstore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// 고객이든 관리자든 로그인을 할 경우
// DB 접속 시 사용할 DAO 클래스
public class CustomerDAO {
	
	// 싱글톤: 하나의 객체를 생성해서 여러 개의 jsp 페이지들이 공유하면서 쓸 수 있도록 만든 기법
	
	// 기본 생성자는 private
	// 클래스 생성도 내부에서 해야한다.
	private CustomerDAO() {}
	private static CustomerDAO instance = new CustomerDAO();
	public static CustomerDAO getInstance() {
		return instance;
	}
	
	private Connection conn = null;
	private PreparedStatement pt = null;
	private ResultSet rs = null;
	
	// DB 접근 시 사용하는 클래스 변수들 선언
	private Connection getConnection() {
		String url = "jdbc:mysql://localhost:3306/bookstoredb05";
		String user = "root";
		String password = "1234";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	// 로그인 시 사용자 인증 처리를 하는 메서드
	public int userCheck(String id, String passwd) {
		int result = -1;
		try {
			conn = getConnection();
			
			String sql = "select count(*) from member where id = ? and passwd = ?";
			pt = conn.prepareStatement(sql);
			pt.setString(1, id);
			pt.setString(2, passwd);
			
			rs = pt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}

		return result;
	}
}
