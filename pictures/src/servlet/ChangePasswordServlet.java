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

@WebServlet(name = "ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {

    UserDao userDao = new UserDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().removeAttribute("status");
        String username = request.getParameter("username");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        System.out.println(username + oldPassword + newPassword);
        User user = userDao.loginDao(username, oldPassword);
        if (user == null) {
            HttpSession session = request.getSession();
            session.setAttribute("status", "密码错误！");
            response.sendRedirect(request.getContextPath() + "/user/change.jsp");
        } else {
            userDao.changeDao(username, newPassword);
            HttpSession session = request.getSession();
            session.setAttribute("status", "修改成功！");
            response.sendRedirect(request.getContextPath() + "/user/change.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
