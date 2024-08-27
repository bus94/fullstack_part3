package dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import dto.MvcBoardDTO;

// DB 전송(id값을 기준으로 해서 sql mapper 파일과 매칭)
public class MvcBoardDAO {
	private static MvcBoardDAO instance = new MvcBoardDAO();

	private MvcBoardDAO() {
	}

	public static MvcBoardDAO getInstance() {
		return instance;
	}

	// 전체 조회
	public ArrayList<MvcBoardDTO> selectAll(SqlSession mapper) {
		System.out.println("DAO의 selectAll() 실행");

		return (ArrayList<MvcBoardDTO>) mapper.selectList("selectAll"); // List 타입이므로 캐스팅 해야한다.
	}

	// 데이터 개수 조회
	public int count(SqlSession mapper) {
		System.out.println("DAO의 count() 실행");

		return (int) mapper.selectOne("count");
	}

	// 게시글 한 건 조회
	public MvcBoardDTO selectByIdx(SqlSession mapper, int idx) {
		System.out.println("DAO의 selectByIdx() 실행");

		return (MvcBoardDTO) mapper.selectOne("selectByIdx", idx);
		
		/*
		 * 동적 sql 문 작성이 가능하다. xml파일에서 jstl 처럼
		 * 아래의 코드는 mvcboard.xml에 작성하게 될 내용인 것!!
		 * <where> <if test="idx >= 1"> where idx = #{idx} </if> </where>
		 * → where 조건문을 실행하기 전에 idx >= 1인지 확인 후 where idx = #{idx}를 실행하게 된다.
		 */
	}

	// Service에서 넘어온 매개변수들을 이용해서 xml로 넘긴다.
	public void update(SqlSession mapper, MvcBoardDTO newDTO) {
		System.out.println("DAO의 update() 실행");

		mapper.update("update", newDTO);
	}
}
