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

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {

    UserDao userDao = new UserDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().removeAttribute("status");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        //System.out.println(username);
        //System.out.println(password);
        User user = userDao.loginDao(username, password);
        if (null == user) {
            HttpSession session = request.getSession();
            session.setAttribute("status", "用户名或密码错误");
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else if (user.isAdmin()) {
            HttpSession session = request.getSession();
            session.setAttribute("curUsername", user.getUsername());
            session.setAttribute("user", new User(username, password, true));
            response.sendRedirect(request.getContextPath() + "/main/main.jsp");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("curUsername", user.getUsername());
            session.setAttribute("user", new User(username, password, false));
            response.sendRedirect(request.getContextPath() + "/main/main.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
