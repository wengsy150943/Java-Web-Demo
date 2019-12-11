package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Driver;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {

    public static final String driver="com.mysql.jdbc.Driver";
    public static final String url="jdbc:mysql://localhost:3306/pictures?characterEncoding=utf8";
    public static final String username="root";
    public static final String password="Yaobaobao111^_^";
    public static Connection con=null;


    static{
        try {
            Class.forName(driver);//得到DriverManager，在下面建立连接时使用
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getCon(){

        if(con == null){
            try {
                con = DriverManager.getConnection(url, username, password);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return con;
    }

    //关闭的方法
    public static void close(Statement statement,Connection conn){
        if(statement !=null){
            try {
                statement.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        if(conn !=null){
            try {
                conn.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }

    public static void main(String args[]){
        new DBUtil().getCon();
    }
}