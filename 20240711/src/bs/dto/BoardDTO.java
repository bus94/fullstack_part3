package bs.dto;

import java.util.Date;

public class BoardDTO {
	private int idx; 			// 글번호
	private String title; 		// 제목
	private String fileName; 	// 첨부파일
	private String writer; 		// 작성자
	private Date time; 			// 등록일
	private int readCount; 		// 조회수

	public BoardDTO() {
	}

	public BoardDTO(int idx, String title, String fileName, String writer, Date time, int readCount) {
		this.idx = idx;
		this.title = title;
		this.fileName = fileName;
		this.writer = writer;
		this.time = time;
		this.readCount = readCount;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	@Override
	public String toString() {
		return "BoardDTO [idx=" + idx + ", title=" + title + ", fileName=" + fileName + ", writer=" + writer + ", time="
				+ time + ", readCount=" + readCount + "]";
	}

}
