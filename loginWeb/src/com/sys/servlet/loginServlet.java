package com.sys.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/login.do")
public class loginServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1.设置请求编码
		req.setCharacterEncoding("UTF-8");
		//2.获得 数据
		String user=req.getParameter("user");
		String pwd=req.getParameter("pdw");
		//3.设置响应格式
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		//4.响应内容(判断)
		//4.1创建cookie
		Cookie userCookie=new Cookie("user",user);
		Cookie pwdCookie=new Cookie("pwd",pwd);
		//4.2存入 cookie
		resp.addCookie(userCookie);
		resp.addCookie(pwdCookie);
		PrintWriter out=resp.getWriter();
		out.print("登录成功3秒跳转到主页");
		resp.setHeader("refresh", "3;url=./login.jsp");
		out.close();
		
		
	}
}
