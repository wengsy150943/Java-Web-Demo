package servlet;

import dao.PicDao;
import pojo.Pic;
import util.StringUtil;
import util.StringUtil.*;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


@WebServlet(name = "UploadServlet")
public class UploadServlet extends HttpServlet {


    static String getPicName(String s) {
        Pattern p = Pattern.compile("(.*)(\\.)(png|jpg)", Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);
        Matcher m = p.matcher(s);
        if (m.matches()) {
            return m.group(3);
        } else {
            return "1";
        }
    }
    //String realPath = getServletContext().getRealPath("/");

    PicDao picDao = new PicDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().removeAttribute("uploadStatus");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        PrintWriter writer = response.getWriter();
        String userName = "";
        StringBuffer fileStr = new StringBuffer();
        try {
            if (isMultipart) {
                DiskFileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                //ServletFileUpload实例依赖于FileItemFactory工厂
                @SuppressWarnings("unchecked")
                List<FileItem> itemList = upload.parseRequest(request);  //解析表单字段，封装成一个FileItem实例的集合
                Iterator<FileItem> iterator = itemList.iterator();  //迭代器
                Pic pic = new Pic();
                while (iterator.hasNext()) {
                    FileItem fileItem = iterator.next();

                    if (fileItem.isFormField()) {
                        if (fileItem.getFieldName().equals("name")) {
                            pic.setName(new String(fileItem.getString().getBytes("ISO8859_1"), "utf-8"));
                        }
                        if (fileItem.getFieldName().equals("country")) {
                            pic.setCountry(new String(fileItem.getString().getBytes("ISO8859_1"), "utf-8"));
                        }
                        if (fileItem.getFieldName().equals("scale")) {
                            pic.setScale(new String(fileItem.getString().getBytes("ISO8859_1"), "utf-8"));
                        }
                        if (fileItem.getFieldName().equals("position")) {
                            pic.setPosition(new String(fileItem.getString().getBytes("ISO8859_1"), "utf-8"));
                        }
                        if (fileItem.getFieldName().equals("latitude")) {
                            pic.setLatitude(new String(fileItem.getString().getBytes("ISO8859_1"), "utf-8"));
                        }
                        if (fileItem.getFieldName().equals("longitude")) {
                            pic.setLongitude(new String(fileItem.getString().getBytes("ISO8859_1"), "utf-8"));
                        }
                        if (fileItem.getFieldName().equals("acquisition_time")) {
                            pic.setAcquisition_time(new String(fileItem.getString().getBytes("ISO8859_1"), "utf-8"));
                        }
                        if (fileItem.getFieldName().equals("resolution")) {
                            pic.setResolution(new String(fileItem.getString().getBytes("ISO8859_1"), "utf-8"));
                        }
                    } else {
                        String type = getPicName(fileItem.getName());
                        if (type.equals("1")) {
                            request.getSession().setAttribute("uploadStatus", "文件类型必须为jpg、png");
                            System.out.println("文件类型必须为jpg、png");
                            response.sendRedirect(request.getContextPath() + "/doImages/addImage.jsp");
                            return;
                        }
                        Random random = new Random();
                        Integer integer = random.nextInt();
                        Calendar calendar = Calendar.getInstance();
                        String id = calendar.getTime().toString() + integer + "." + type;
                        pic.setId(id);
                        picDao.insertDao(pic);
                        String fileUpName = request.getSession().getServletContext().getRealPath("") + "pictures/" + id;
                        System.out.println(fileUpName);
                        File file = new File(fileUpName);
                        fileItem.write(file);
                        System.out.println("写入成功");
                    }
                }
                response.sendRedirect(request.getContextPath() + "/doImages/addImage.jsp");
            }
        } catch (Exception e) {

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
