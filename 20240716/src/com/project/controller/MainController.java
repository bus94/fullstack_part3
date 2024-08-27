package com.project.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.service.MemberService;

public class MainController extends HttpServlet {
	private MemberService service = MemberService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestPro(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestPro(req, resp);
	}

	protected void requestPro(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 * req.setCharacterEncoding("UTF-8");
		 * resp.setContentType("text/html; charset=UTF-8");
		 */

		String url = req.getRequestURI();
		String contextPath = req.getContextPath();
		String context = url.substring(contextPath.length());

		String viewpage = "/WEB-INF/";
		switch (context) {
		case "/insertForm.do":
			viewpage += "insertForm";
			break;
			
		case "/emailCheck.do":
			service.emailCheck(req, resp);
			return;

		default:
			break;
		}
		viewpage += ".jsp";

		req.getRequestDispatcher(viewpage).forward(req, resp);
	}
}
