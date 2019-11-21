package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import user.User;

/**
 * Servlet implementation class RegisterServlet
 */

public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        int id = Integer.valueOf(request.getParameter("id"));
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        int role = Integer.valueOf(request.getParameter("role"));
        User user = new User();
        user.setId(id);
        user.setName(name);
        user.setPassword(password);
        user.setRole(role);
        UserDao userDAO = new UserDao();
        boolean result = userDAO.addUser(user);
        if (result) {
            System.out.println("注册成功！");
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            String loginSuccess = "LoginSuccess.jsp";
            response.sendRedirect(loginSuccess);
        } else {
            System.out.println("注册失败！");
            String loginFail = "LoginFail.jsp";
            response.sendRedirect(loginFail);
        }
        //request.getRequestDispatcher("Login.jsp").forward(request, response);
    }
}