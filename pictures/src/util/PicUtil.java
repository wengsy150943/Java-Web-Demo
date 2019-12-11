package util;

import pojo.Pic;

import java.sql.ResultSet;
import java.sql.SQLException;

public class PicUtil {

    public static void setPic(Pic pic, ResultSet rs) throws SQLException {
        pic.setId(rs.getInt("id"));
        pic.setName(rs.getString("name"));
        pic.setCountry(rs.getString("country"));
        pic.setLongitude(rs.getString("longitude"));
        pic.setLatitude(rs.getString("latitude"));
        pic.setAcquisition_time(rs.getString("acquisition_time"));
        pic.setPosition(rs.getString("position"));
        pic.setResolution(rs.getString("resolution"));
        pic.setScale(rs.getString("scale"));
    }
}
