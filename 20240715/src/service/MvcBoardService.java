package service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import dao.MvcBoardDAO;
import dto.MvcBoardDTO;
import mybatis.MySession;

// DB 접근할 수 있도록 Sqlsession 객체 생성해서 가져오기 및 DB 가기 전 전처리를 하는 클래스
public class MvcBoardService {
	private static MvcBoardService instance = new MvcBoardService();

	private MvcBoardService() {
	}

	public static MvcBoardService getInstance() {
		return instance;
	}
	
	private MvcBoardDAO dao = MvcBoardDAO.getInstance();

	// 전체 글을 조회하는 메서드
	public ArrayList<MvcBoardDTO> selectAll() {
		System.out.println("Service의 selectAll() 실행");

		// 1. DB 연결 정보 가져오기
		SqlSession mapper = MySession.getSession();

		// 2. DAO 호출하기
		// 3. 결과 index.jsp로 보내기
		return MvcBoardDAO.getInstance().selectAll(mapper);
	}

	// index.jsp에서 데이터의 개수를 반환하는 메서드 호출
	public int count() {
		System.out.println("Service의 count() 실행");

		SqlSession mapper = MySession.getSession();

		return MvcBoardDAO.getInstance().count(mapper);
	}

	// 게시글 한 건을 조회하는 메서드
	public MvcBoardDTO selectByIdx(int idx) {
		System.out.println("Service의 selectByIdx() 실행");

		SqlSession mapper = MySession.getSession();

		return MvcBoardDAO.getInstance().selectByIdx(mapper, idx);
	}

	// index.jsp에서 넘어온 수정할 데이터를 매개변수로 받아서 dao로 넘기는 메서드
	public MvcBoardDTO update(int idx, String subject, String content) {
		System.out.println("Service의 update() 실행");
		
		SqlSession mapper = MySession.getSession();
		
		// 1. idx 글 번호를 이용해서 데이터가 있는지 확인
		MvcBoardDTO dto = dao.selectByIdx(mapper, idx);
		MvcBoardDTO newDTO = null;
		
		if(dto != null) {
			// 2. 객체를 생성 DTO
			newDTO = new MvcBoardDTO(idx, subject, content);
			dao.update(mapper, newDTO);
			dto = dao.selectByIdx(mapper, idx);
		}
		return dto;
	}
}
