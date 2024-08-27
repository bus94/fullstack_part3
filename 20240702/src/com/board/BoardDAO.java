package com.board;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

// DB는 아직 없지만 저장하는 공간이다
// 게시글을 저장하는 클래스로 사용
public class BoardDAO {
	
	// 싱글톤 기법
	// 하나의 객체를 만들어서 여러 인스턴스들이 공유할 수 있도록 만든다.
	// 생성자는 private으로 선언한다.
	private BoardDAO() {}
	private static BoardDAO instance = new BoardDAO();
	
	// BoardDAO 저장소에 접근을 하는 페이지들은 모두 getInstance() 메서드를 호출해서 저장소에 접근 한다.
	public static BoardDAO getInstance() {
		return instance;
	}
	
	// 게시글 고유 번호
	private static int idNum = 0;
	
	// 실제 저장소
	private ArrayList<BoardDTO> boardList = new ArrayList<>();
	
	// 새 게시글을 저장하는 메서드
	public void boardWrite(BoardDTO board) {
		// board라는 변수에 DTO 키보드로 입력해서 넘어오면 글번호는 0으로 되어있다.
		
		// DB가 없기 때문에 일단 직접 작성
		int num = ++BoardDAO.idNum;
		String regDate = getDate();
		
		board.setNum(num);
		board.setRegDate(regDate);
		
		// 글이 추가되면 실제 증가시킨다.
		
		boardList.add(board);
	}
	
	// 오늘 날짜를 문자열로 리턴해주는 메서드
	public String getDate() {
		Date date = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(date);
		
		
		// 응용
		// 현재 날짜이면 시간만 출력하고 오늘이 아니면 날짜만 출력하기 (미완성)
		
	}
	
	// 글 개수를 가져오는 메서드
	public int getAllCount() {
		return boardList.size();
	}
	
	// 현재 저장하고 있는 boardList의 데이터를 꺼내가는 메서드
	public ArrayList<BoardDTO> getBoardList() {
		return boardList;
	}
	
	// 게시글 한 건을 가지고 가는 메서드
	public BoardDTO getBoardByNum(int num) {
		int index = getBoardIndex(num);
		BoardDTO board = boardList.get(index);
		
		// 게시글을 선택했기 때문에 조회수를 1 증가 시킨다.
		board.setReadCount(board.getReadCount() + 1);
		
		return board;
	}
	
	// 게시글을 수정하는 메서드(이메일, 제목, 내용)
	public void boardUpdate(BoardDTO board) {
		int num = getBoardIndex(board.getNum());
		boardList.get(num).setEmail(board.getEmail());
		boardList.get(num).setSubject(board.getSubject());
		boardList.get(num).setContent(board.getContent());
	}
	
	// 게시글을 삭제하는 메서드(글번호, 비밀번호)
	// 비밀 번호가 일치하면 1을 불일치하면 -1을 리턴
	public int boardDelete(int num, String password) {
		int result = -1;
		
		// ArrayList에 들어있는 게시글을 찾고, 그 안에 있는 비밀번호를 꺼내온다.
		
		int index = getBoardIndex(num);
		String dbPassword = boardList.get(index).getPassword();
		
		if(dbPassword.equals(password)) {
			result = 1;
			
			boardList.remove(index);
		}
		
		return result; 
	}
	
	// 현재는 삭제를 했을 때 기존에 있던 데이터들이 한칸씩 앞으로 저장하기 때문에 에러 발생할 수 있다.
	// 글 번호를 매개변수로 받아서 arrayList에서 인덱스를 찾는 메서드가 필요하다.
	public int getBoardIndex(int num) {
		int index = -1;
		
		for(int i = 0; i < boardList.size(); i++) {
			if(boardList.get(i).getNum() == num) {
				index = i;
			}
		}
		return index;
	}
}
