package servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.wm.utils.DbConn;

import bean.Students;
import net.sf.json.JSONObject;
import utils.Dbhelper;

/**
 * Servlet implementation class ImportExcel
 */
@WebServlet("/ImportExcel")
public class ImportExcel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 // 上传文件存储目录
     private static final String UPLOAD_DIRECTORY = "ImportExcel";
     // 上传配置
     private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
     private static final int MAX_FILE_SIZE      = 1024 * 1024 * 4; // 40MB
     private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 5; // 50MB
  
     
     /**
      * 上传数据及保存文件
      */
     protected void doPost(HttpServletRequest request,
         HttpServletResponse response) throws ServletException, IOException {
     	response.setCharacterEncoding("utf-8");
 		response.setContentType("text/html");
 		
 		
 	 	//创建json对象
 		JSONObject json=new JSONObject();
 		//创建数据库操作对象
 		DbConn db=Dbhelper.getDb();
 		HttpSession session=request.getSession();    	
         // 检测是否为多媒体上传
         if (!ServletFileUpload.isMultipartContent(request)) {
             // 如果不是则停止
            PrintWriter writer = response.getWriter();
             writer.println("Error: 表单必须包含 enctype=multipart/form-data");
             writer.flush();
             return;
         	
         }
         
         // 配置上传参数
         DiskFileItemFactory factory = new DiskFileItemFactory();
         // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
         factory.setSizeThreshold(MEMORY_THRESHOLD);
         // 设置临时存储目录
         factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
  
         ServletFileUpload upload = new ServletFileUpload(factory);
          
         // 设置最大文件上传值
         upload.setFileSizeMax(MAX_FILE_SIZE);
          
         // 设置最大请求值 (包含文件和表单数据)
         upload.setSizeMax(MAX_REQUEST_SIZE);

         // 中文处理
         upload.setHeaderEncoding("UTF-8"); 

         // 构造临时路径来存储上传的文件
         // 这个路径相对当前应用的目录
         String basePath=request.getServletContext().getRealPath("./") + File.separator;       
         String uploadPath = basePath+UPLOAD_DIRECTORY;
             		   		  	     
         // 如果目录不存在则创建
         File uploadDir = new File(uploadPath);
         if (!uploadDir.exists()) {
             uploadDir.mkdir();
         }
         Object cid=session.getAttribute("cid");
         int classid=Integer.parseInt(cid.toString());
        
         try {
             // 解析请求的内容提取文件数据
             //@SuppressWarnings("unchecked")
             List<FileItem> formItems = upload.parseRequest(request);
                         
             if (formItems != null && formItems.size() > 0) {            
                 // 迭代表单数据
                 for (FileItem item : formItems) {
                     // 处理不在表单中的字段
                	 System.out.print("item.getName()="+item.getName());
                     if (!item.isFormField()) {
                     String fileName = new File(item.getName()).getName();                       
                 	System.out.print("fileName="+fileName);
                 	                  		
                         String filePath = uploadPath + File.separator + fileName;                        
                         File storeFile = new File(filePath);
                         // 在控制台输出文件的上传路径                      
                         System.out.println(";filePath="+filePath);                       
                        
                         // 保存文件到硬盘
                         item.write(storeFile); 
                         //测试读取Excel文件中的内容
                        try{
                        	File excel = new File(filePath);
                            if (excel.isFile() && excel.exists()) {   //判断文件是否存在
                            	String[] split = excel.getName().split("\\.");  //.是特殊字符，需要转义
                            	Workbook wb;
                                //根据文件后缀（xls/xlsx）进行判断
                            	if ( "xls".equals(split[1])){
                                    FileInputStream fis = new FileInputStream(excel);   //文件流对象
                                    wb = new HSSFWorkbook(fis);
                                }else if ("xlsx".equals(split[1])){
                                    wb = new XSSFWorkbook(excel);
                                }else {
                                    System.out.println("文件类型错误!");
                                    return;
                                }
                            	//创建students对象
                            	
                            	List<Students> stuList = new ArrayList();
                            	
                            	//开始解析
                            	Sheet sheet=wb.getSheetAt(0);	//读取sheet 0
                            	int firstRowIndex = sheet.getFirstRowNum()+1;	//第一行是title，所以+1
                            	int lastRowIndex =sheet.getLastRowNum();
                            	System.out.println("firstRowIndex:"+firstRowIndex);
                            	System.out.println("lastRowIndex:"+lastRowIndex);
                            	for(int rowIndex =firstRowIndex;rowIndex<=lastRowIndex;rowIndex++) {
                            		System.out.println("rowIndex="+rowIndex);
                            		Row row=sheet.getRow(rowIndex);
                            		if(row !=null) {
                            			int firstCellIndex=row.getFirstCellNum();
                            			int lastCellIndex=row.getLastCellNum();
                            			Students stu=new Students();
                            			for (int cellIndex=firstCellIndex;cellIndex<lastCellIndex;cellIndex++) {
                            				Cell cell=row.getCell(cellIndex);                            				
                        					//此处考虑固定模板的Excel文件，格式为    “学号，姓名，性别，手机号，密码”                       				                        					
                        					if(cellIndex==0 && cell!=null) {                        						
                        						stu.setSno(cell.toString());                        						
                        					}
                        					if(cellIndex==1 && cell!=null) {                        						
                        						stu.setSname(cell.toString());                        						
                        					}
                        					if(cellIndex==2 && cell!=null) {
                        						stu.setSgender(cell.toString());                        						
                        					}
                        					if(cellIndex==3 && cell!=null) {
                        						String phone=String.valueOf(cell.toString());
                        						stu.setSphone(phone);                        					                       						
                        					}
                        					if(cellIndex==4 && cell!=null) {                        						
                        						stu.setSpassword(cell.toString());                       						
                        					}
                        					
                        					stuList.add(stu);                            				
                            			}
                            		}
                            	}
                            	//将读取的数据写入数据库
                            	int stuIsExist=0;	
                        		int insertFai=0;
                        		int inserSuc=0;
                            	for(int i=0;i<stuList.size();i++) {
                            		String sno,sname,sgender,phone,pwd;
                            		int class_id;
                            		sno=stuList.get(i).getSno();
                            		sname=stuList.get(i).getSname();
                            		sgender=stuList.get(i).getSgender();
                            		phone=stuList.get(i).getSphone();
                            		pwd=stuList.get(i).getSpassword();
                            		
                            		
                            		//先查询改记录是否存在，不存在则插入数据库
                            		boolean bl=db.checkTrue("select id from students where sno='"+sno+"'");
                    				if(bl){
                    					
                    					int bls=db.executeUpdate("update students set sname='"+sname+"',sgender='"+sgender+"',classinfo_id="+classid+",sphone='"+phone+"',spassword='"+pwd+"' where sno="+sno);             							
                    				}else{
                    					int bls=db.executeUpdate("insert into students(sno,sname,sgender,classinfo_id,sphone,spassword) values('"+sno+"','"+sname+"','"+sgender+"',"+classid+",'"+phone+"','"+pwd+"')");
                    					if(bls>0){
                    						insertFai=1;
                    					}else{
                    						inserSuc=1;
                    					}
                    				}                    				                    				
                            	}
                            	if(stuIsExist==1) {
                					System.out.println("有数据已存在");
                				}else
                				if(insertFai==1) {
                					System.out.println("有数据插入失败");
                				}else {
                					System.out.println("全部数据已更新至数据库");
                				}
                            }else {
                            	System.out.println("找不到指定文件");
                            }
                        }catch(Exception e) {
                        	e.printStackTrace();
                        }
                        
                         json.put("msg", "1");
                         
                     }	
                     else {
                    	 System.out.println("不是fieldName");
                     }
             }
             }
         } catch (Exception ex) {
         	json.put("msg", "错误信息:"+ex.getMessage());
                  	   
         }       
         PrintWriter out=response.getWriter();
 		out.print(json.toString());
 		System.out.print("YYY");   
 		out.flush();
 		out.close(); 
     }
}
