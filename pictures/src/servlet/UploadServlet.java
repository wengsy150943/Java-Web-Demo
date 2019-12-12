package servlet;

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
                FileItemFactory factory = new DiskFileItemFactory();  //工厂实例
                ServletFileUpload upload = new ServletFileUpload(factory);  //ServletFileUpload实例依赖于FileItemFactory工厂
                List<FileItem> itemList = upload.parseRequest(request);  //解析表单字段，封装成一个FileItem实例的集合
                Iterator<FileItem> iterator = itemList.iterator();  //迭代器
                while (iterator.hasNext()) {
                    FileItem fileItem = iterator.next();  //依次解析每一个FileItem实例，即表单字段
                    if (fileItem.isFormField()) {
                        //普通表单字段
                        //if (fileItem.getFieldName().equals("userName")) {
                        //System.out.println(fileItem.getString("UTF-8"));  //如果表单属性name的值的userName，就获取这个表单字段的值
                        //}
                    } else {
                        //文件表单字段
                        String fileUpName = "/" + fileItem.getName();  //用户上传的文件名
                        //System.out.println(realPath);
                        System.out.println(fileUpName);

                        File file = new File(fileUpName);  //要保存到的文件
                        if (!file.exists()) {
                            //System.out.println(1);
                            file.createNewFile();  //一开始肯定是没有的，所以先创建出来
                        }
                        fileItem.write(file);  //写入，保存到目标文件
                        //fileStr.append(fileUpName + "、");
                    }
                }
                //fileStr.replace(fileStr.lastIndexOf("、"), fileStr.length(), "");
                //writer.print("<script>alert('用户" + userName + "上传了文件" + fileStr + "')</script>");
            }
        } catch (Exception e) {

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
