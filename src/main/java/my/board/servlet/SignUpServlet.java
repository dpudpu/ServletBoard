package my.board.servlet;

import my.board.dao.MemberDao;
import my.board.dto.MemberDto;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/signUp")
public class SignUpServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/signUp.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MemberDto memberDto = new MemberDto();
        memberDto.setPassword(req.getParameter("password"));
        memberDto.setNickname(req.getParameter("nickname"));
        memberDto.setEmail(req.getParameter("email"));

        MemberDao memberDao = new MemberDao();
        try {
            if (memberDao.signUp(memberDto) == 0)
                throw new Exception();
        } catch (Exception e) {
            e.printStackTrace();
            PrintWriter out = resp.getWriter();
            out.println("failed signUp");
            out.close();
            try {
                Thread.sleep(2000);
            } catch (InterruptedException e1) {
                e1.printStackTrace();
            }
        }

        resp.sendRedirect("/");
    }

}
