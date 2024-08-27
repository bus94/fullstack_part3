package com.project.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.project.dto.MemberDTO;

public class MemberDAO {
	private static MemberDAO instance = new MemberDAO();

	private MemberDAO() {
	}

	public static MemberDAO getInstance() {
		return instance;
	}

	public int selectCount(SqlSession mapper) {
		return (int) mapper.selectOne("selectCount");
	}

	public ArrayList<MemberDTO> selectAll(SqlSession mapper, HashMap<String, Integer> hmap) {
		return (ArrayList<MemberDTO>) mapper.selectList("selectAll", hmap);
	}
	
}
