package bs.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibatis.sqlmap.client.SqlMapClient;

import bs.dao.MvcDAO;
import bs.dto.MvcDTO;
import bs.dto.MvcList;
import bs.ibatis.SqlConfig;

// MVC 게시판에서 데이터를 넘겨받아서 처리하는 클래스(내장 객체 접근, sqlMap DB, 객체도 접근, 객체 생성 등의 역할)
public class MvcService {
	private MvcService() {
	}

	public static MvcService instance = new MvcService();

	public static MvcService getInstance() {
		return instance;
	}

	// MvcDAO 객체 생성
	private MvcDAO dao = MvcDAO.getInstance();

	// insertOK.nhn으로부터 들어오는 요청을 처리하는 메서드
	public void insert(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("MvcService의 insert() 실행 시작");

		// 1. form에서 넘어온 데이터 저장하기
		MvcDTO dto = new MvcDTO();
		dto.setName(req.getParameter("name"));
		dto.setSubject(req.getParameter("subject"));
		dto.setContent(req.getParameter("content"));

		System.out.println("insert dto: " + dto);

		// 2. DB 정보 가져오기
		SqlMapClient mapper = SqlConfig.getSqlMap();
		System.out.println("1" + mapper);

		// 3. DAO 호출하기
		try {
			dao.insert(mapper, dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("MvcService의 insert() 실행 끝");
	}

	// MainController에서 요청객체와 응답객체를 전달 받는다.
	public void selectAll(HttpServletRequest request, HttpServletResponse response) {
		// 1. DB 정보 가져오기
		SqlMapClient mapper = SqlConfig.getSqlMap();

		/* ArrayList<MvcDTO> list = null; */
		// 페이징 처리까지 같이 할 수 있는 MvcList

		MvcList list = null;

		// list.nhn 주소를 작성해서 들어가면 currentPage 정보가 없다.
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (NumberFormatException e) {
		}
		// 2. dao 호출
		try {
			// 1. 페이지당 표시할 글의 개수
			// select에서 선택한 값을 가지고 온다.
			 String page = request.getParameter("pageSize");
			 int pageSize = page == null ? 5 : Integer.parseInt(page);

			// 2. 테이블의 전체 개수를 가져오는 sql문
			int totalCount = dao.selectCount(mapper);

			// 3. MvcList 객체 생성
			// 그 안의 init() 메서드가 자동으로 호출되면서 페이지 계산 및 시작, 끝 번호를 저장한다.
			list = new MvcList(pageSize, totalCount, currentPage);

			// parameterClass와 resultClass 속성은 데이터 타입은 반드시 하나만 적어야한다.
			HashMap<String, Integer> hmap = new HashMap<String, Integer>();

			// 따라서 보내야하는 시작 번호와 끝 번호를 HashMap 객체에 담아 보낸다.
			hmap.put("startNo", list.getStartNo());
			hmap.put("endNo", list.getEndNo());

			list.setList(dao.selectAll(mapper, hmap));
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 3. 서버 메모리인 내장 객체에 저장하기
		request.setAttribute("mvclist", list);
	}

}
