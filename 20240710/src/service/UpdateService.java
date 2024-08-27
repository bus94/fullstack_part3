package service;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import dto.GuestbookDAO;
import dto.GuestbookDTO;
import ibatis.MyAppSqlConfig;

public class UpdateService {
	private static UpdateService instance = new UpdateService();

	private UpdateService() {
	}

	public static UpdateService getInstance() {
		return instance;
	}

	public void update(GuestbookDTO post) {
		System.out.println("UpdateService의 update() 실행");
		/* System.out.println("UpdateService의 update(): " + post); */

		// 1. DB 연결
		SqlMapClient mapper = MyAppSqlConfig.getSqlMap();

		// 2. DAO 호출
		try {
			GuestbookDAO.getInstance().update(mapper, post);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
