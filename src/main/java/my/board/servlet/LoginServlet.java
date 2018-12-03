package my.board.servlet;

import my.board.dao.MemberDao;
import my.board.dto.MemberDto;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("WEB-INF/views/login.jsp");
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MemberDto memberDto = new MemberDto();
        memberDto.setEmail(req.getParameter("email"));
        memberDto.setPassword(req.getParameter("password"));

        MemberDao memberDao = new MemberDao();
        if(memberDao.login(memberDto)!=null){
            HttpSession session = req.getSession();
            session.setAttribute("member", memberDto);
            resp.sendRedirect("/main");
        }else{
            req.setAttribute("msg",-1);
            req.setAttribute("email",req.getParameter("email"));
            req.setAttribute("password",req.getParameter("password"));
            RequestDispatcher dispatcher = req.getRequestDispatcher("WEB-INF/views/login.jsp");
            dispatcher.forward(req,resp);
        }
    }
}
