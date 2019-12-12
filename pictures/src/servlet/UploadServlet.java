package servlet;

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
import java.util.Iterator;
import java.util.List;


@WebServlet(name = "UploadServlet")
public class UploadServlet extends HttpServlet {

    //String realPath = getServletContext().getRealPath("/");

    private static Integer id = 0;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);  //enctype属性是否是multipart/form-data
        PrintWriter writer = response.getWriter();
        String userName = "";  //上传者
        StringBuffer fileStr = new StringBuffer();  //上传的文件名，最后输出用
        try {
            if (isMultipart) {
                DiskFileItemFactory factory = new DiskFileItemFactory();  //工厂实例
                ServletFileUpload upload = new ServletFileUpload(factory);
                //ServletFileUpload实例依赖于FileItemFactory工厂
                @SuppressWarnings("unchecked")
                List<FileItem> itemList = upload.parseRequest(request);  //解析表单字段，封装成一个FileItem实例的集合
                Iterator<FileItem> iterator = itemList.iterator();  //迭代器
                while (iterator.hasNext()) {
                    FileItem fileItem = iterator.next();
                    if (fileItem.isFormField()) {
                        if (fileItem.getFieldName().equals("userName")) {
                            System.out.println(fileItem.getString("UTF-8"));  //如果表单属性name的值的userName，就获取这个表单字段的值
                        }
                    } else {
                        String type = StringUtil.getPicName(fileItem.getFieldName());
                        if (type == null) {
                            request.getSession().setAttribute("uploadStatus","文件类型必须为jpg、png");
                            response.sendRedirect(request.getContextPath() + "/doImages/addImage.jsp");
                        }
                        String fileUpName = request.getSession().getServletContext().getRealPath("") + "/../../../web/pictures/" + (++id).toString() + type;  //用户上传的文件名
                        File file = new File(fileUpName);  //要保存到的文件
                        if (!file.exists()) {
                            file.createNewFile();  //一开始肯定是没有的，所以先创建出来
                        }
                        fileItem.write(file);  //写入，保存到目标文件
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
