package findPwd;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wm.utils.DbConn;
import com.wm.utils.GetList;

import bean.Students;
import bean.Teacher;
import bean.user;
import net.sf.json.JSONObject;
import utils.Dbhelper;
import utils.MD5Util;

/**
 * Servlet implementation class ChangeEmailSvlt2
 */
@WebServlet("/ChangeEmailSvlt2")
public class ChangeEmailSvlt2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeEmailSvlt2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//设置传输数据编码方式
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html");
				//创建json对象
				JSONObject json=new JSONObject();
				System.out.println("执行ChangeEmailSvlt2"); 
				
		       
		        //获取链接中的加密字符串  
		        String sid=request.getParameter("sid");
		        System.out.println("sid=."+sid); 
		        //获取链接中的用户名  
		        String id=request.getParameter("id");
		       //获取表名
		        String tbname=request.getParameter("tb");
		        //获取邮箱
		        String email=request.getParameter("em");
		        if(sid.equals(null) ||id.equals(null) ||email.equals(null)){  
		            System.out.println("请求的链接不正确,请重新操作.");  
		              
		            json.put("msg", "请求的链接不正确,请重新操作.");
		        }
		        
		        //判断是否有这个用户，并取回这个用户的所有信息
		        
		        //创建数据库操作对象
				DbConn db=Dbhelper.getDb(); 
				
				
				if("adminEmail".equals(tbname)) {
					user user=new user();
					List<user> list=GetList.getlist(user.class, db.executeQuery("select * from admin where id='"+id+"'"));
					if(list.size()>0) {
						user=list.get(0);
						System.out.println("存在这个用户");
					}
			        if(user!=null){  
			            //获取当前用户申请找回密码的过期时间  
			            //找回密码链接已经过期  
			        	 System.out.println("System.currentTimeMillis()="+System.currentTimeMillis()); 
			        	 Date outDate = new Date(System.currentTimeMillis());
			        	 long date = outDate.getTime() / 1000 * 1000;
			            if(Long.parseLong(user.getOutDate())<=date){  
			                System.out.println("链接已经过期"); 
			                json.put("msg", "链接已经过期");
			                
			            }  
			            //获取当前登陆人的加密码  
			            String key = user.getId()+"$"+user.getOutDate()+"$"+user.getValidataCode();//数字签名  
			            System.out.println("getUsernumber="+user.getId());  
			            System.out.println("stu.getOutDate()="+user.getOutDate()); 
			            System.out.println("stu.getValidataCode()="+user.getValidataCode());  
			            
			            String digitalSignature = MD5Util.MD5(key);// 数字签名  
			            System.out.println("digitalSignature=."+digitalSignature);    
			            if(!digitalSignature.equals(sid)){  
			                System.out.println("链接加密密码不正确");  
			                 
			                json.put("msg", "链接加密密码不正确");
			            }else{  
			            	
			                //验证成功,更新邮箱
			            	int bls=db.executeUpdate("update admin set email='"+email+"' where id="+id);
							if(bls>0){
								json.put("msg", "修改成功,重新登录后更新");
							}else{
								json.put("msg", "修改失败,请重试");
							}
			            }  
			        }else{  
			            System.out.println("用户信息不存在"); 
			            json.put("msg", "用户信息不存在");
			            
			        	} 			              
			        }
				if("stuEmail".equals(tbname)) {
					Students user=new Students();
					List<Students> list=GetList.getlist(Students.class, db.executeQuery("select * from students where id='"+id+"'"));
					if(list.size()>0) {
						user=list.get(0);
						System.out.println("存在这个用户");
					}
			        if(user!=null){  
			            //获取当前用户申请找回密码的过期时间  
			            //找回密码链接已经过期  
			        	 System.out.println("System.currentTimeMillis()="+System.currentTimeMillis()); 
			        	 Date outDate = new Date(System.currentTimeMillis());
			        	 long date = outDate.getTime() / 1000 * 1000;
			            if(Long.parseLong(user.getOutDate())<=date){  
			                System.out.println("链接已经过期"); 
			                json.put("msg", "链接已经过期");
			                
			            }  
			            //获取当前登陆人的加密码  
			            String key = user.getSno()+"$"+user.getOutDate()+"$"+user.getValidataCode();//数字签名  
			            System.out.println("getUsernumber="+user.getId());  
			            System.out.println("stu.getOutDate()="+user.getOutDate()); 
			            System.out.println("stu.getValidataCode()="+user.getValidataCode());  
			            
			            String digitalSignature = MD5Util.MD5(key);// 数字签名  
			            System.out.println("digitalSignature=."+digitalSignature);    
			            if(!digitalSignature.equals(sid)){  
			                System.out.println("链接加密密码不正确");  
			                 
			                json.put("msg", "链接加密密码不正确");
			            }else{   
			            	//验证成功,更新邮箱
			            	int bls=db.executeUpdate("update students set email='"+email+"' where id="+id);
							if(bls>0){
								json.put("msg", "修改成功,重新登录后更新");
							}else{
								json.put("msg", "修改失败,请重试");
							} 
			            }  
			        }else{  
			            System.out.println("用户信息不存在"); 
			            json.put("msg", "用户信息不存在");
			            
			        	} 			              
			        }
				if("teaEmail".equals(tbname)) {
					Teacher user=new Teacher();
					List<Teacher> list=GetList.getlist(Teacher.class, db.executeQuery("select * from teacher where id='"+id+"'"));
					if(list.size()>0) {
						user=list.get(0);
						System.out.println("存在这个用户");
					}
			        if(user!=null){  
			            //获取当前用户申请找回密码的过期时间  
			            //找回密码链接已经过期  
			        	 System.out.println("System.currentTimeMillis()="+System.currentTimeMillis()); 
			        	 Date outDate = new Date(System.currentTimeMillis());
			        	 long date = outDate.getTime() / 1000 * 1000;
			            if(Long.parseLong(user.getOutDate())<=date){  
			                System.out.println("链接已经过期"); 
			                json.put("msg", "链接已经过期");
			                
			            }  
			            //获取当前登陆人的加密码  
			            String key = user.gettNo()+"$"+user.getOutDate()+"$"+user.getValidataCode();//数字签名  
			            System.out.println("getUsernumber="+user.getId());  
			            System.out.println("stu.getOutDate()="+user.getOutDate()); 
			            System.out.println("stu.getValidataCode()="+user.getValidataCode());  
			            
			            String digitalSignature = MD5Util.MD5(key);// 数字签名  
			            System.out.println("digitalSignature=."+digitalSignature);    
			            if(!digitalSignature.equals(sid)){  
			                System.out.println("链接加密密码不正确");  
			                 
			                json.put("msg", "链接加密密码不正确");
			            }else{  
			            	
			                //验证成功,跳入到修改密码界面  
			            	//验证成功,更新邮箱
			            	int bls=db.executeUpdate("update teacher set email='"+email+"' where id="+id);
							if(bls>0){
								json.put("msg", "修改成功,重新登录后更新");
							}else{
								json.put("msg", "修改失败,请重试");
							}
			            }  
			        }else{  
			            System.out.println("用户信息不存在"); 
			            json.put("msg", "用户信息不存在");
			            
			        	} 			              
			        }
				PrintWriter out=response.getWriter();
				out.print(json.toString());
				out.flush();
				out.close();
				
				 
		        
			}

			/**
			 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
			 */
			protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// TODO Auto-generated method stub
				doGet(request, response);
			}

		}
