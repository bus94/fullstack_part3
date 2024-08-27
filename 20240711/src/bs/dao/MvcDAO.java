package bs.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.ibatis.sqlmap.client.SqlMapClient;

import bs.dto.MvcDTO;

// ibatis xml 파일과 자바를 연결해주는 클래스. sql 실행 (DB 접근)
public class MvcDAO {
	private MvcDAO() {}
	public static MvcDAO instance = new MvcDAO();
	public static MvcDAO getInstance() {
		return instance;
	}
	
	// MvcService 클래스가 mapper, 글 정보를 넘겨주면 board.xml 파일로 insert sql 실행할 수 있도록 메서드 선언
	public void insert(SqlMapClient mapper, MvcDTO dto) throws SQLException {
		System.out.println("MvcDAO의 insert() 실행");
		mapper.insert("insert", dto);
	}

	public ArrayList<MvcDTO> selectAll(SqlMapClient mapper, HashMap<String, Integer> hmap) throws SQLException {
		return (ArrayList<MvcDTO>)mapper.queryForList("selectAll", hmap);
	}

	// 게시글의 총 개수를 반환하는 sql 실행 dao 메서드
	public int selectCount(SqlMapClient mapper) throws SQLException {
		return (int)mapper.queryForObject("selectCount");
	}	
}
