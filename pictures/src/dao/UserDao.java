package dao;

import pojo.User;
import util.DBUtil;
import util.UserUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {

    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String sql;


    public void changeDao(String username, String password) {
        try {
            sql = "UPDATE users SET password=? WHERE username=?";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, password);
            stmt.setString(2, username);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public boolean registerDao(String username, String password) {
        try {
            con = DBUtil.getCon();
            sql = "SELECT * FROM users WHERE username=?";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            rs = stmt.executeQuery();
            if (rs.next()) {
                System.out.println("用户名已存在");
                return false;
            }


            con = DBUtil.getCon();
            sql = "INSERT INTO users(username, password, admin) VALUES (?,?,?)";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setBoolean(3, false);
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                    rs = null;
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                    stmt = null;
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
    }

    public User loginDao(String username, String password) {
        try {
            con = DBUtil.getCon();
            //预编译语句，"?"代表参数
            String sql = "SELECT * FROM users WHERE USERNAME=? AND PASSWORD=?";
            stmt = con.prepareStatement(sql);
            //设置参数
            stmt.setString(1, username);
            //实例化预编译语句
            stmt.setString(2, password);
            //执行查询
            rs = stmt.executeQuery();
            //判断结果集是否有记录，并将指针向后移动一位

            User user = new User();

            if (rs.next()) {
                UserUtil.setUser(user, rs);
                return user;
            } else return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                    rs = null;
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                    stmt = null;
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
    }
}
