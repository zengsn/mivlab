package teachingSys.svlt;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import teachingSys.utils.Dbhelper;

import com.wm.utils.DbConn;

public class AddszySvlt extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddszySvlt() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		//创建json对象
		JSONObject json=new JSONObject();
		// 文件上传之后的文件保存路径
		String filepath = getServletContext().getRealPath("")+java.io.File.separator+"stufile";
		File saveDir = new File(filepath);
		if(!saveDir.exists()){
			saveDir.mkdir();
		}
		filepath+=java.io.File.separator;
		//定义文件名和文件类型变量
		String filename = "";
		String type="";
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload sfu = new ServletFileUpload(factory);
		sfu.setHeaderEncoding("UTF-8");
		//可接收文件的大小
		sfu.setFileSizeMax(10240*10240*20);
		sfu.setSizeMax(10240*10240*21);
		//前台数据链表
		List<FileItem> itemList;
		//定义文件变量
		File file=null;
		//表单数据
		String zyinfo_id="";
		//定义服务器文件名变量
		String fffname=String.valueOf(System.currentTimeMillis());
		try {
			itemList = sfu.parseRequest(request);
			for (FileItem fileItem : itemList) {
				if(fileItem.isFormField()){
					String value = fileItem.getString();
					value = new String(value.getBytes("ISO-8859-1"),"UTF-8");	
					if("zyinfo_id".equals(fileItem.getFieldName())){
						zyinfo_id=value;
					}
				}else{
					String name = fileItem.getName();
					int p=name.lastIndexOf(".");
					type=name.substring(p);
					filename=fffname+type;
					file = new File(filepath,filename);
					fileItem.write(file);
					fileItem.getOutputStream().flush();
					fileItem.getOutputStream().close();
				}
			}
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		if(file!=null){
			//创建数据库操作对象
			DbConn db=Dbhelper.getDb();
			String sql="insert into stuword(zyinfo_id,students_id,stuzyword) values("+zyinfo_id+","+session.getAttribute("userid")+",'"+filename+"')";
			System.out.println(sql);
			if(db.executeUpdate(sql)>0){
				json.put("msg", "操作成功");
			}else{
				json.put("msg", "操作失败");
			}
		}else{
			json.put("msg", "文件获取失败.");
		}
		//======================
		PrintWriter out=response.getWriter();
		out.print(json.toString());
		out.close();
	} 

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
