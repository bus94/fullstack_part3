package service;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import dto.GuestbookDAO;
import dto.GuestbookDTO;
import ibatis.MyAppSqlConfig;

public class DeleteService {
	private static DeleteService instance = new DeleteService();

	private DeleteService() {
	}

	public static DeleteService getInstance() {
		return instance;
	}

	public void delete(GuestbookDTO post) {
		System.out.println("DeleteService의 delete() 실행");

		// 1. DB 연결
		SqlMapClient mapper = MyAppSqlConfig.getSqlMap();

		// 2. DAO 호출
		try {
			GuestbookDAO.getInstance().delete(mapper, post);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
