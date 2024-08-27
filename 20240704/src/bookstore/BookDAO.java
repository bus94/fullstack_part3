package bookstore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

// DB에 접근하는 클래스 (book 테이블)
public class BookDAO {
	private BookDAO() {
	}

	private static BookDAO instance = new BookDAO();

	public static BookDAO getInstance() {
		return instance;
	}

	private Connection conn = null;
	private PreparedStatement pt = null;
	private ResultSet rs = null;

	private Connection getConnection() {
		String url = "jdbc:mysql://localhost:3306/bookstoredb05";
		String user = "root";
		String password = "1234";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}

	// 책의 정보를 반환하는 메서드
	// 책의 분류에 따라서 값을 리턴한다.
	public ArrayList<BookDTO> getSelectBook(String book_kind) {
		ArrayList<BookDTO> list = null;

		try {
			conn = getConnection();
			/*
			 * String sql =
			 * "select * from book where book_kind = ? order by reg_date desc limit 3";
			 */
			String sql = "select * from book ";

			if (book_kind.equals("all")) {
				pt = conn.prepareStatement(sql);
			} else {
				sql += " where book_kind = ? order by reg_date desc";
				System.out.println(sql);
				pt = conn.prepareStatement(sql);
				pt.setString(1, book_kind);
			}
			
			rs = pt.executeQuery();

			if (rs.next()) {
				/* int count = 0; */
				list = new ArrayList<BookDTO>();

				do {
					BookDTO bean = new BookDTO();
					bean.setBook_id(rs.getInt("book_id"));
					bean.setBook_kind(rs.getString("book_kind"));
					bean.setBook_title(rs.getString("book_title"));
					bean.setBook_price(rs.getInt("book_price"));
					bean.setBook_count(rs.getInt("book_count"));
					bean.setAuthor(rs.getString("author"));
					bean.setPublishing_com(rs.getString("publishing_com"));
					bean.setPublishing_date(rs.getString("publishing_date"));
					bean.setBook_image(rs.getString("book_image"));
					bean.setBook_content(rs.getString("book_content"));
					bean.setDiscount_rate(rs.getInt("discount_rate"));
					bean.setReg_date(rs.getString("reg_date"));

					list.add(bean);
					/*
					 * 이 코드로 3개의 정보로 제한할 수 있지만 mysql에서는 limit가 있기 때문에 여기서는 사용하지 않는다. count++;
					 * if(count == 3) { break; }
					 */
				} while (rs.next());
				System.out.println(list);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// book_id를 전달받아서 한 개의 책 정보를 가져가는 메서드
	public BookDTO getBook(int book_id) {

		BookDTO dto = null;

		try {
			conn = getConnection();
			String sql = "select * from book where book_id = ?";
			pt = conn.prepareStatement(sql);
			pt.setInt(1, book_id);
			rs = pt.executeQuery();

			if (rs.next()) {

				dto = new BookDTO();

				dto.setBook_id(rs.getInt("book_id"));
				dto.setBook_kind(rs.getString("book_kind"));
				dto.setBook_title(rs.getString("book_title"));
				dto.setBook_price(rs.getInt("book_price"));
				dto.setBook_count(rs.getInt("book_count"));
				dto.setAuthor(rs.getString("author"));
				dto.setPublishing_com(rs.getString("publishing_com"));
				dto.setPublishing_date(rs.getString("publishing_date"));
				dto.setBook_image(rs.getString("book_image"));
				dto.setBook_content(rs.getString("book_content"));
				dto.setDiscount_rate(rs.getInt("discount_rate"));
				dto.setReg_date(rs.getString("reg_date"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}
}
