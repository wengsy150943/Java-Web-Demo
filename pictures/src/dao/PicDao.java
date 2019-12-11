package dao;

import pojo.Pic;
import util.DBUtil;
import util.PicUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PicDao {
    public static ArrayList<Pic> getAllPictures() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Pic> list = new ArrayList<Pic>();
        try {
            conn = DBUtil.getCon();
            String sql = "SELECT * FROM pictures;";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Pic pic = new Pic();
                PicUtil.setPic(pic, rs);
                list.add(pic);
            }
            return list;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
            //释放数据集对象
            if (rs != null) {
                try {
                    rs.close();
                    rs = null;
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            //释放语句对象
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

    public ArrayList<Pic> getPicturesByCountry(String country) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Pic> list = new ArrayList<Pic>();    //商品集合
        try {
            conn = DBUtil.getCon();
            String sql = "SELECT * FROM pictures WHERE country=?;";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, country);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Pic pic = new Pic();
                PicUtil.setPic(pic, rs);
                list.add(pic);
            }
            return list;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
            //释放数据集对象
            if (rs != null) {
                try {
                    rs.close();
                    rs = null;
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            //释放语句对象
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

    public static void main(String[] args) {
        ArrayList<Pic> pics=getAllPictures();
        for(Pic pic:pics){
            System.out.println(1);
            System.out.println(pic.getResolution());
        }
    }
}
