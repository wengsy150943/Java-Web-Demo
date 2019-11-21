package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import user.User;
import util.DBUtil;

public class UserDao {

    //数据库连接对象
    public  User  login(String username,String password) {
        User u=null;
        Connection connection =null;
        PreparedStatement pstmt=null;
        ResultSet resultSet=null;

        //赋值
        try {
            connection=DBUtil.getCon();
            //静态sql语句
            String sql = "select * from user where name=? and password=?";
            pstmt = (PreparedStatement) connection.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            resultSet = pstmt.executeQuery();
            if(resultSet.next()){
                u=new User();
                u.setName(resultSet.getString("name"));
                u.setPassword(resultSet.getString("password"));
                System.out.println("登录成功！");
            }else{
                System.out.println("用户名或者密码错误！");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            // DBUtil.close(pstmt, connection);
        }
        return u;

    }

    public boolean addUser(User user) {
        Connection connection = null;
        PreparedStatement psmt = null;
        try {
            connection = DBUtil.getCon();

            String sql  ="insert into user(id,name,password,role)values(?,?,?,?);";

            psmt = (PreparedStatement) connection.prepareStatement(sql);

            //运用实体对象进行参数赋值
            psmt.setInt(1, user.getId());
            psmt.setString(2, user.getName());
            psmt.setString(3,user.getPassword());
            psmt.setInt(4, user.getRole());
            psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            //DBUtil.close(psmt, connection);
        }
        return true;
    }
}