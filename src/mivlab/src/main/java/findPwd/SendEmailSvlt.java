package findPwd;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.util.Date;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wm.utils.DbConn;

import net.sf.json.JSONObject;
import utils.Dbhelper;
import utils.MD5Util;

/**
 * Servlet implementation class SendEmailSvlt
 */
@WebServlet("/SendEmailSvlt")
public class SendEmailSvlt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendEmailSvlt() {
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
		 try {  
			 
				String email=request.getParameter("email");  //收件人的email
				String utype=request.getParameter("tbname");//获取用户类型对应的表名
				String id=request.getParameter("id");		//id
				String name=request.getParameter("name");   //Num
				System.out.println("name="+name);
				System.out.println("id="+id);
			 	//邮箱链接
			 	String path=request.getContextPath();  		      
			 	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path; 
			 	
			 	
			 	//配置邮箱
			 	
		        Properties prop = new Properties();  
		        prop.setProperty("mail.transport.protocol", "smtp");  
		        prop.put("mail.smtp.port","465"); 
		        prop.setProperty("mail.smtp.host", "smtp.qq.com");
		        prop.setProperty("mail.smtp.auth", "true");
		        prop.setProperty("mail.smtp.ssl.enable","true");
		        //本地测试用的服务器与端口号
		        //prop.setProperty("mail.smtp.host", "smtp.qq.com");
		        //prop.put("mail.smtp.port","25");  
		        //prop.setProperty("mail.debug", "true");  		        
		        Session session = Session.getInstance(prop,
						new Authenticator(){
						@Override
						protected PasswordAuthentication getPasswordAuthentication() {
							//返回发件人账号与密码信息
							return new PasswordAuthentication("1370763849@qq.com","你的密码");
						}
					}
				);
					
		        //填写信封写信  
		        Message msg = new MimeMessage(session);  
		        //设置发邮件的原地址  
		        msg.setFrom(new InternetAddress("1370763849@qq.com"));  
		        //设置接收人  
		        msg.setRecipient(RecipientType.TO, new InternetAddress(email));
		        //主题
		        msg.setSubject("找回密码!");  
		        //内容
		        String content="error,请重新操作";
		        //判断是什么类型的用户
		        //1.admin
		        if("admin".equals(utype)) {
		        	String tbname="adminInfo2";
		        	 content=createLink( id,name,utype, tbname,email, basePath);
		        }
		        if("students".equals(utype)) {
		        	String tbname="students2";
		        	 content=createLink( id,name,utype, tbname,email, basePath);
		        }
		        if("teacher".equals(utype)) {
		        	String tbname="teacher2";
		        	 content=createLink( id,name,utype, tbname,email, basePath);
		        }
		       
		        msg.setContent("<font color=\"red\">"+content+"</font>", "text/html;charset=gbk");
 		       		        
		        System.out.println("邮件开始发送！");

				Transport.send(msg);
				System.out.println("邮件发送成功！");
				json.put("msg", 1);  
		             
		       }catch(Exception e){  
		        e.printStackTrace();
		        json.put("msg", "发送失败");
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
	public String createLink(String id,String name,String utype,String tbname,String email, String basePath){  
	      
	    //生成密钥  
	    String secretKey=UUID.randomUUID().toString();  
	    //设置过期时间  
	    Date outDate = new Date(System.currentTimeMillis() + 30 * 60 * 1000);// 30分钟后过期  
	    System.out.println("System.currentTimeMillis()="+System.currentTimeMillis());  
	    long date = outDate.getTime() / 1000 * 1000;// 忽略毫秒数  mySql 取出时间是忽略毫秒数的  
	    System.out.println("date="+date);
	    String date2=String.valueOf(date);
	    System.out.println("date2="+date2);
	    //此处应该更新StuinfoTest表中的过期时间、密钥信息  
	    
	  //创建数据库操作对象
	  	DbConn db=Dbhelper.getDb();
	    int bls=db.executeUpdate("update "+utype+" set outDate='"+date2+"',validataCode='"+secretKey+"' where id='"+id+"'");
		System.out.print(bls);
		if(bls==1){
			System.out.println("用户信息修改成功");
			//将用户名、过期时间、密钥生成链接密钥  
		    String key =name + "$" + date2 + "$" + secretKey;  
		    System.out.println("getUsernumber="+name);  
            System.out.println("date2="+date2); 
            System.out.println("secretKey="+secretKey);    
		    String digitalSignature = MD5Util.MD5(key);// 数字签名  
		      
		    
		      
		    String resetPassHref = basePath + "/FindPwd?sid="+ digitalSignature+"&tb="+tbname+"&em="+email +"&id="+id;  
		      
		    String emailContent = "请勿回复本邮件.点击下面的链接,重设密码,本邮件超过30分钟,链接将会失效，需要重新申请找回密码." + resetPassHref;  
		      
		    return emailContent;
		}else{
			
			return "error";
		}
	      
	}
	
	

}
