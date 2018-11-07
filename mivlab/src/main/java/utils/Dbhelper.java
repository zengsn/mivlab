package utils;

import com.wm.utils.DbConn;

public class Dbhelper {
	/**
	 * 获取数据库连接
	 */
	public static DbConn getDb(){
		//数据库连接字符串
		//String url="jdbc:mysql://localhost:3306/customizableSys?characterEncoding=utf-8";
		//String url="localhost:3306/mivlab?characterEncoding=utf-8";
		String url="jdbc:mysql://localhost:3306/mivlab?characterEncoding=utf-8";
		//数据库驱动字符串
		String driver="com.mysql.jdbc.Driver";
		//数据库的用户
		String uname="root";
		//数据库密码
		String upassword="123456";		
		//String upassword="admin123?";
		//返回数据库连接对象
		return new DbConn(driver,url,uname,upassword);
	}
}
