package dao;
import java.sql.*;

public class CreateTable {
	//1����ȡʵ�������
	//2����ȡ��ʦ����
	//����ʵ������ͽ�ʦ������ɱ���
	//��ôҪִ�д������DDl���
    static String creatsql = "";
           

    final static String JDBC_DRIVER = "com.mysql.jdbc.Driver";
        //ָ���������ݿ��url
    final static String DB_URL = "jdbc:mysql://localhost:3306/customizableSys?characterEncoding=utf-8";
    //mysql�û���
    final static String name = "root";
        //mysql����
    final static String pwd = "123456";
    
    
    
    public static void main(String args)
    {
    	
    	
    	
    	
      creatsql="CREATE TABLE `"+args+"` (" + 
      		"  `id` int(11) NOT NULL AUTO_INCREMENT," + 
      		"  `Login` varchar(45) DEFAULT NULL," + 
      		"  `Num` varchar(45) DEFAULT NULL," + 
      		"  `IssueNumber` int(11) DEFAULT NULL," + 
      		"  `IssueCount` int(11) DEFAULT NULL," + 
      		"  `IssueLabels` varchar(45) DEFAULT NULL," + 
      		"  `Events` int(11) DEFAULT NULL," + 
      		"  `FirstTime` varchar(45) DEFAULT NULL," + 
      		"  `Pulls` int(11) DEFAULT NULL," + 
      		"  `Commits` int(11) DEFAULT NULL," + 
      		"  `Additions` int(11) DEFAULT NULL," + 
      		"  `Deletions` int(11) DEFAULT NULL," + 
      		"  `ChangedFiles` int(11) DEFAULT NULL," + 
      		"  `Comments` int(11) DEFAULT NULL," + 
      		"  `ReviewComments` int(11) DEFAULT NULL," + 
      		"  `org` varchar(100) DEFAULT NULL," + 
      		"  `proj` varchar(100) DEFAULT NULL," +
      		"  `terms_id` int(11) DEFAULT NULL," +
      		"  `course_id` int(11) DEFAULT NULL," +
      		"  `score` float DEFAULT NULL," +
      		"  PRIMARY KEY (`id`)," + 
      		"  UNIQUE KEY `id_UNIQUE` (`id`)" + 
      		") ENGINE=InnoDB DEFAULT CHARSET=utf8";
      Connection conn = null;
      PreparedStatement stmt = null;
      try
      {
          //ע��jdbc����
          Class.forName(JDBC_DRIVER);
          //������
          System.out.println("//�������ݿ�");
          conn = DriverManager.getConnection(DB_URL,name,pwd);
          
        //�жϱ��Ƿ����
      	  DatabaseMetaData dbm = conn.getMetaData();

          ResultSet rs = dbm.getTables(null, null, args, null);

          if (rs.next()) {

            System.out.println("Exists");

          }

          else {

            System.out.println("Not Exist");
          //ִ�д�����
            System.out.println("//������");
            stmt = conn.prepareStatement(creatsql);           
           if(false == stmt.execute())
           {
               System.out.println("�ɹ�������");
           }
           else
           {
               System.out.println("������ʧ�ܣ�");
           }
           //
            stmt.close();
            conn.close();
            System.out.println("//�ر���Դ");
          }
          
          
      }
      catch(Exception e)
      {
          System.out.println("������ʧ�ܣ�");
          e.printStackTrace();
      }
    }
}
