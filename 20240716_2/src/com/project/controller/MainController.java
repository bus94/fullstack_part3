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

		String url = req.getRequestURI();
		String contextPath = req.getContextPath();
		String context = url.substring(contextPath.length());

		String viewpage = "/WEB-INF/";
		switch (context) {
		
		case "/listOK.do":
			service.list(req, resp);
			return;

		case "/list.do":
			viewpage += "list";
			break;

		default:
			break;
		}
		viewpage += ".jsp";

		req.getRequestDispatcher(viewpage).forward(req, resp);
	}

}

