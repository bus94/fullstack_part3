package com.project.service;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.project.dao.MemberDAO;
import com.project.dto.ListDTO;
import com.project.mybatis.MySqlSession;

public class MemberService {
	private static MemberService instance = new MemberService();
	private MemberDAO dao = MemberDAO.getInstance();

	private MemberService() {
	}

	public static MemberService getInstance() {
		return instance;
	}

	public void list(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		System.out.println("Service의 list()");

		req.setCharacterEncoding("UTF-8");
		
		SqlSession mapper = MySqlSession.getSqlSession();
		
		ListDTO list = null;
		
		String pagesize = req.getParameter("pagesize");
		
		if(pagesize == null) {
			pagesize = "5";
		}
		int pageSize = Integer.parseInt(pagesize);
		System.out.println("service의 list pageSize: " + pageSize);
		
		int totalCount = dao.selectCount(mapper);
		System.out.println("service의 list totalCount: " + totalCount);
		
		int currentPage = 1;
		// 받아오는 현재 페이지로 변경해주기
		// currentPage = Integer.parseInt(req.getParameter("currentPage");
		// System.out.println("service의 list currentPage: " + currentPage);
		
		list = new ListDTO(pageSize, totalCount, currentPage);
		
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", list.getStartNo());
		hmap.put("endNo", list.getEndNo());
		System.out.println("service의 list startNo: " + list.getStartNo());
		System.out.println("service의 list endNo: " + list.getEndNo());
		
		list.setList(dao.selectAll(mapper, hmap));

		/* resp.setContentType("application/json"); - parsererror 발생 하여 주석 처리 후 해결 o */
		resp.setCharacterEncoding("UTF-8");
		
		String jsonResp = "{\"list\" : " + list + "}";
		System.out.println(jsonResp);
		resp.getWriter().write(jsonResp);
	}
}
