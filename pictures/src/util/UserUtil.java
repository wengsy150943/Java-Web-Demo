package util;

import pojo.User;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserUtil {
    public static void setUser(User user, ResultSet rs) throws SQLException {
        user.setUsername(rs.getString("username"));
        user.setPassword(rs.getString("password"));
        user.setAdmin(rs.getBoolean("admin"));
    }
}
