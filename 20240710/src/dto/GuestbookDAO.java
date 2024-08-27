package dto;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.ibatis.sqlmap.client.SqlMapClient;

public class GuestbookDAO {
	private static GuestbookDAO instance = new GuestbookDAO();

	private GuestbookDAO() {
	}

	public static GuestbookDAO getInstance() {
		return instance;
	}

	// InsertService클래스에서 호출되는 mapper와 테이블에 저장할 데이터가 저장된 객체를 넘겨받고, guestbook.xml 파일의
	// sql문을 실행할 수 있도록 연결하는 메서드를 만든다.
	public void insert(SqlMapClient mapper, GuestbookDTO dto) throws SQLException {
		System.out.println("GuestbookDAO의 insert()실행");

		// 실제 ibatis가 제공하는 추가하는 메서드인 insert("실행할 sql명령의 id", sql명령으로 전달할 데이터)

		mapper.insert("insert", dto);
	}

	public ArrayList<GuestbookDTO> selectList(SqlMapClient mapper, HashMap<String, Integer> hmap) throws SQLException {
		System.out.println("GuestbookDAO의 selectList() 실행");

		// 아이바티스에서 데이터를 조회할 떄 사용하는 메서드
		// 1. sql 한 건을 조회할 때 select 결과가 한 개
		// mapper.queryForObject()
		// 결과 타입이 Object이기 때문에 형변환(casting) 해야한다.

		// 2. sql을 실행했을 때 여러 개의 결과 값이 올 때는
		// mapper.queryForList()
		// 결과 타입이 List 인터페이스로 되어있음

		return (ArrayList<GuestbookDTO>) mapper.queryForList("selectAll", hmap);
		
		// queryForList() 매개변수를 여러 개 넘기면
		// 첫 번째 매개변수는 id 빠지고 나머지 2개의 매개변수 값을 이용해서 데이터를 찾는다.
		// parameterClass 하나의 타입만 지정 가능하다.
		// resultClass 하나의 타입만 지정 가능하다.
		
		// 따라서 startNo, endNo 하나의 클래스로 묶어서 넘긴다.
		// Hash 
		
		// 오라클에서는 rownum
		// : 오라클에서 생성된 모든 테이블에서 사용할 수 있는 select쿼리문으로 추출하는데 (row)에 순차적으로 부여되는 순번
		// 서브 쿼리를 이용해서 순서대로 명령문을 실행하기
		// 1. select * from guestbook order by idx desc; 
		// 위의 명령문 통해 게시글의 번호를 이용해서 내림차순으로 정렬 (정렬된 상태 먼저 가져오기)
		// 2. 정렬된 상태에서 rownum을 부여한다.
		// 3. 순차적으로 
	}	

	// DB에서 데이터의 개수를 반환하는 메서드
	// mapper 정보를 매개변수로 받아서 xml로 연결
	public int count(SqlMapClient mapper) throws SQLException {

		return (int) mapper.queryForObject("count");
	}

	// 실제 sql.xml 파일에서 sql문 실행하기
	public ArrayList<GuestbookDTO> selectListMemo(SqlMapClient mapper, Param param) throws SQLException {
		System.out.println("GuestbookDAO의 selectListMemo() 실행");

		return (ArrayList<GuestbookDTO>) mapper.queryForList("selectListMemo", param);
	}

	public ArrayList<GuestbookDTO> selectListName(SqlMapClient mapper, Param param) throws SQLException {
		System.out.println("GuestbookDAO의 selectListName() 실행");

		return (ArrayList<GuestbookDTO>) mapper.queryForList("selectListName", param);
	}

	public ArrayList<GuestbookDTO> selectListTotal(SqlMapClient mapper, Param param) throws SQLException {
		System.out.println("GuestbookDAO의 selectListTotal() 실행");

		return (ArrayList<GuestbookDTO>) mapper.queryForList("selectListTotal", param);
	}

	public GuestbookDTO selectByIdx(SqlMapClient mapper, int idx) throws SQLException {
		System.out.println("GuestbookDAO의 selectByIdx() 실행");

		return (GuestbookDTO) mapper.queryForObject("selectByIdx", idx);
	}

	public void update(SqlMapClient mapper, GuestbookDTO post) throws SQLException {
		System.out.println("GuestbookDAO의 update() 실행");

		mapper.update("update", post);
	}

	public void delete(SqlMapClient mapper, GuestbookDTO post) throws SQLException {
		System.out.println("GuestbookDAO의 delete() 실행");

		mapper.delete("delete", post);
	}

	/*
	 * 1. insert.jsp 실행 2. insert.jsp 입력 후 버튼 클릭 → insertOK.jsp 로 간다. 3. insertOK에서
	 * DB로 가는 전처리 기능 InsertService 객체로 들어간다. insert()메서드 실행 4. DB 정보를 가지고 있는 mapper
	 * 객체를 저장하고 DAO로 전송(메서드 이용) 5. DAO 클래스로 들어가서 insert() 메서드 실행 후 실제 sql을 처리하는
	 * xml파일로 간다. 6. xml 파일로 전송(메서드) id값을 이용해서(첫 번째 매개변수인 id) 태그를 찾는다. 7. 태그를 찾으면 그
	 * 안에 명령문을 실행한다. 8. 실행이 끝나면 DAO로 돌아온다. 9. Service 클래스로 돌아온다. 10. insertOK.jsp로
	 * 돌아간다. 11. 여기에서 새로운 페이지 요청이 있으면 새로운 페이지로 이동하고, 없으면 실행 종료된다.
	 * 
	 */
}
