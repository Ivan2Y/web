package bbs.controller;

import bbs.model.Message;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.Vector;

public class postMessage extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String author =(String) session.getAttribute("username");
        String title = new String(req.getParameter("title").getBytes("iso-8859-1"),"utf-8");
        String content = new String(req.getParameter("content").getBytes("iso-8859-1"),"utf-8");
        Date time = new Date();

        Vector<Message> message = (Vector<Message>) session.getAttribute("message");
        message.add(new Message(title,author,time,content));
        resp.sendRedirect("login.jsp");
    }
}
