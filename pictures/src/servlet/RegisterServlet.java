package servlet;

import dao.UserDao;
import pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "RegisterServlet")
public class RegisterServlet extends HttpServlet {

    UserDao userDao = new UserDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().removeAttribute("status");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean success = userDao.registerDao(username, password);
        if (success) {
            HttpSession session = request.getSession();
            session.setAttribute("status", "注册成功！");
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("status", "用户名已被使用！");
            response.sendRedirect(request.getContextPath() + "/user/signup.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
