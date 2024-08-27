package service;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import dto.GuestbookDAO;
import dto.GuestbookDTO;
import ibatis.MyAppSqlConfig;

public class InsertService {
	// singleton 클래스 디자인 패턴은 한 순간에 단 한개의 객체만 필요할 경우 사용하는 디자인 패턴
	
	// 1. 자기 자신(현재 클래스)의 객체를 기본 생성자를 사용해서 정적(공유) 필드로 선언한다.
	private static InsertService instance = new InsertService();
	
	// 2. 클래스 외부에서 객체를 생성할 수 없도록 기본 생성자의 접근 권한을 private으로 변경한다.
	private InsertService() {}
	
	// 3. 자신의 객체를 리턴시키는 정적(공유) 메서드를 만든다.
	public static InsertService getInstance() {
		return instance;
	}
	
	// insertOK.jsp 에서 넘어오는 테이블에 저장할 실제 데이터가 저장된 객체(dto)를 넘겨 받고 mapper를 얻어와서 DAO 클래스의 글 1건을 테이블에 저장하는 insert sql 명령을 실행하는 메서드를 호출하는 메서드를 만든다.
	// 자바와 sql을 연결시키는 것을 mapper 
	public void insert(GuestbookDTO dto) {
		System.out.println("InsertService의 insert() 실행");
		System.out.println(dto);
		
		// ibatis에 mapper를 가져온다.
		// mapper에는 DB 연결 connection과 연결 후 실행할 sql 명령(guestbook.xml)이 저장되어있다.
		SqlMapClient mapper = MyAppSqlConfig.getSqlMap();
		
		try {
			GuestbookDAO.getInstance().insert(mapper, dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
