package utils;

import com.wm.utils.DbConn;

public class Dbhelper {
	/**
	 * ��ȡ���ݿ�����
	 */
	public static DbConn getDb(){
		//���ݿ������ַ���
		//String url="jdbc:mysql://localhost:3306/customizableSys?characterEncoding=utf-8";
		//String url="localhost:3306/mivlab?characterEncoding=utf-8";
		String url="jdbc:mysql://localhost:3306/mivlab?characterEncoding=utf-8";
		//���ݿ������ַ���
		String driver="com.mysql.jdbc.Driver";
		//���ݿ���û�
		String uname="root";
		//���ݿ�����
		String upassword="123456";		
		//String upassword="admin123?";
		//�������ݿ����Ӷ���
		return new DbConn(driver,url,uname,upassword);
	}
}
