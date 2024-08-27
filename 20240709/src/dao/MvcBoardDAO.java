package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import dto.MvcBoardDTO;

public class MvcBoardDAO {
	private static MvcBoardDAO instance = new MvcBoardDAO();

	private MvcBoardDAO() {
	}

	public static MvcBoardDAO getInstance() {
		return instance;
	}

	Connection conn = null;
	PreparedStatement pt = null;
	ResultSet rs = null;

	// 연결 정보 가져오기
	public Connection getConnect() {

		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}

	// list.jsp 페이지에 글을 가져가는 메서드
	public ArrayList<MvcBoardDTO> selectList() {

		ArrayList<MvcBoardDTO> list = null;

		try {
			// 1. 연결
			conn = getConnect();

			// 2. sql문 작성
			String sql = "select * from mvcboard order by idx desc";

			// 3. sql 검사
			pt = conn.prepareStatement(sql);

			// 4. sql 실행
			rs = pt.executeQuery();

			// 5. 결과 ArrayList 담기
			if (rs.next()) {
				// 만약 데이터가 있다면 리스트 생성
				list = new ArrayList<>();

				do {
					// 1. DTO 객체 생성
					MvcBoardDTO dto = new MvcBoardDTO();

					// 2. 기본 생성자 또는 매개변수 받는 생성자
					dto.setIdx(rs.getInt("idx"));
					dto.setName(rs.getString("name"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setGup(rs.getInt("gup"));
					dto.setLev(rs.getInt("lev"));
					dto.setSeq(rs.getInt("seq"));
					dto.setHit(rs.getInt("hit"));
					dto.setWriteDate(rs.getDate("writeDate"));

					// 3. ArrayList 추가하기
					list.add(dto);

				} while (rs.next());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		/* list = null; */
		// 6. 리턴
		return list;
	}

	// 추가하는 메서드
	public void insert(MvcBoardDTO dto) {
		System.out.println("DAO안의 insert() 메서드 실행");
		MvcBoardDTO dtoN = null;
		try {

			conn = getConnect();
			String sql = "insert into mvcboard(idx, name, subject, content, gup, lev, seq) ";
			sql += " values (mvcboard_idx_seq.nextval, ?, ?, ?, mvcboard_idx_seq.currval, 0, 0) ";
			pt = conn.prepareStatement(sql);
			pt.setString(1, dto.getName());
			pt.setString(2, dto.getSubject());
			pt.setString(3, dto.getContent());

			pt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// service에서 넘어온 idx값을 이용해서 상세 글을 한 건 조회해서 service로 보내기
	public MvcBoardDTO selectByIdx(int idx) {
		System.out.println("DAO안의 selectByIdx() 메서드 실행");
		MvcBoardDTO dto = null;

		try {
			// 1. 연결
			conn = getConnect();

			// 2. sql문 작성
			String sql = "select * from MVCBOARD ";
			sql += " where idx = ? ";

			// 3. sql 검사
			pt = conn.prepareStatement(sql);
			pt.setInt(1, idx);

			// 4. sql 실행

			// 5. 결과 ArrayList 담기!
			rs = pt.executeQuery();

			if (rs.next()) {

				int idx2 = rs.getInt("IDX");
				String name = rs.getString("NAME");
				String subject = rs.getString("SUBJECT");
				String content = rs.getString("CONTENT");
				int gup = rs.getInt("GUP");
				int lev = rs.getInt("LEV");
				int seq = rs.getInt("SEQ");
				int hit = rs.getInt("HIT");
				Date writeDate = rs.getTimestamp("WRITEDATE");

				dto = new MvcBoardDTO(idx2, name, subject, content, gup, lev, seq, hit, writeDate);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;

	}

	// 조회수를 증가시키는 메서드
	public void increment(int idx) {
		try {
			conn = getConnect();

			String sql = "update mvcboard set ";
			sql += " hit = hit + 1 ";
			sql += " where idx = ? ";

			pt = conn.prepareStatement(sql);
			pt.setInt(1, idx);

			rs = pt.executeQuery();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				pt.close();
			} catch (Exception e) {
			}
		}
	}

	// service에서 넘겨받은 dto를 수정하는 메서드
	public void update(MvcBoardDTO dto) {
		try {
			conn = getConnect();

			String sql = "update mvcboard set subject = ?, content = ? where idx = ?";
			pt = conn.prepareStatement(sql);
			pt.setString(1, dto.getSubject());
			pt.setString(2, dto.getContent());
			pt.setInt(3, dto.getIdx());

			pt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void delete(int idx) {
		try {
			conn = getConnect();

			String sql = "delete from mvcboard where idx = ?";
			pt = conn.prepareStatement(sql);
			pt.setInt(1, idx);

			pt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
