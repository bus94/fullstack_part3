package service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.ibatis.sqlmap.client.SqlMapClient;

import dto.GuestbookDAO;
import dto.GuestbookDTO;
import dto.GuestbookList;
import dto.Param;
import ibatis.MyAppSqlConfig;

public class SelectService {
	private static SelectService instance = new SelectService();

	private SelectService() {
	}

	public static SelectService getInstance() {
		return instance;
	}

	public GuestbookDTO selectByIdx(int idx) {
		System.out.println("SelectService의 selectByIdx() 실행");

		// 1. DB 연결
		SqlMapClient mapper = MyAppSqlConfig.getSqlMap();

		// 2. DAO 호출
		GuestbookDTO post = null;
		try {
			post = GuestbookDAO.getInstance().selectByIdx(mapper, idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// 3. 리턴
		return post;
	}

	public GuestbookList selectListTotal(int currentPage, String item) {
		System.out.println("SelectService의 selectListTotal() 실행");

		// 1. DB 연결
		SqlMapClient mapper = MyAppSqlConfig.getSqlMap();

		// 2. DAO 호출
		GuestbookDAO dao = GuestbookDAO.getInstance();

		GuestbookList guestbookList = null;
		try {
			// 현재 보여지는 개수는 jsp에서 가지고 넘어온다.
			int pageSize = 5;

			int totalCount = dao.count(mapper);

			guestbookList = new GuestbookList(pageSize, totalCount, currentPage);

			Param param = new Param();
			param.setStartNo(guestbookList.getStartNo());
			param.setEndNo(guestbookList.getEndNo());
			param.setItem(item);

			guestbookList.setList(dao.selectListTotal(mapper, param));
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// 3. 리턴
		return guestbookList;
	}

	public GuestbookList selectListName(int currentPage, String item) {
		System.out.println("SelectService의 selectListName() 실행");

		// 1. DB 연결
		SqlMapClient mapper = MyAppSqlConfig.getSqlMap();

		// 2. DAO 호출
		GuestbookDAO dao = GuestbookDAO.getInstance();

		GuestbookList guestbookList = null;
		try {
			// 현재 보여지는 개수는 jsp에서 가지고 넘어온다.
			int pageSize = 5;

			int totalCount = dao.count(mapper);

			guestbookList = new GuestbookList(pageSize, totalCount, currentPage);

			Param param = new Param();
			param.setStartNo(guestbookList.getStartNo());
			param.setEndNo(guestbookList.getEndNo());
			param.setItem(item);

			guestbookList.setList(dao.selectListName(mapper, param));
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// 3. 리턴
		return guestbookList;
	}

	// listPro.jsp에서 호출되는 화면에 표시할 페이지와 (넘겨받은) 검색어로 mapper를 얻은 후 DAO에 글 목록을 얻어오는
	// select sql명령을 실행하는 메서드를 호출한다.
	public GuestbookList selectListMemo(int currentPage, String item) {
		System.out.println("SelectService의 selectListMemo() 실행");

		// 1. DB 연결
		SqlMapClient mapper = MyAppSqlConfig.getSqlMap();

		// 2. DAO 호출
		GuestbookDAO dao = GuestbookDAO.getInstance();

		GuestbookList guestbookList = null;
		try {
			// 현재 보여지는 개수는 jsp에서 가지고 넘어온다.
			int pageSize = 5;

			int totalCount = dao.count(mapper);

			guestbookList = new GuestbookList(pageSize, totalCount, currentPage);

			Param param = new Param();
			param.setStartNo(guestbookList.getStartNo());
			param.setEndNo(guestbookList.getEndNo());
			param.setItem(item);

			// dao 메서드를 호출하기
			// selectListMemo() 메서드 매개변수 타입 변경 하기
			// 데이터 가져오면 guestbookList
			// list 값을 수정하기

			guestbookList.setList(dao.selectListMemo(mapper, param));
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// 3. 리턴
		return guestbookList;
	}

	public int count() {
		System.out.println("SelectService의 count() 실행");

		// 1. DB연결 위해서 mapper
		SqlMapClient mapper = MyAppSqlConfig.getSqlMap();

		// 2. DAO 호출하기
		int count = 0;

		try {
			count = GuestbookDAO.getInstance().count(mapper);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// 3. 리턴 반환(jsp)
		return count;
	}

	public GuestbookList selectList(int currentPage) {
		System.out.println("SelectService의 selectList() 실행");

		// 1. DB 정보 가져오기
		SqlMapClient mapper = MyAppSqlConfig.getSqlMap();

		// 2. DAO 호출하기

		// 한 페이지 분량의 글 목록과 페이징 작업에 사용할 변수를 가지고 있는 객체를 선언한다.
		GuestbookList guestbookList = null;

		GuestbookDAO dao = GuestbookDAO.getInstance();
		try {

			// 한 페이지당 표시할 글의 개수를 정한다.
			int pageSize = 5;

			// 테이블에 저장된 전체 글의 개수를 얻어온다.
			int totalCount = dao.count(mapper);
			System.out.println("service size: " + totalCount);

			guestbookList = new GuestbookList(pageSize, totalCount, currentPage);

			HashMap<String, Integer> hmap = new HashMap<String, Integer>();

			hmap.put("startNo", guestbookList.getStartNo());
			hmap.put("endNo", guestbookList.getEndNo());

			// 현재 페이지에 따라서 글 시작 번호, 글 끝 번호를 넘겨서 그 개수만큼 list에 저장해야된다.
			guestbookList.setList(dao.selectList(mapper, hmap));

		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println(guestbookList);

		// 3. 결과 반환
		return guestbookList;
	}
}
