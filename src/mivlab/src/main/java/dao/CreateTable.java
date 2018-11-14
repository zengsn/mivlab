package dao;
import java.sql.*;

public class CreateTable {
	//1、获取实验库名，
	//2、获取教师工号
	//利用实验库名和教师工号组成表名
	//我么要执行创建表的DDl语句
    static String creatsql = "";
           

    final static String JDBC_DRIVER = "com.mysql.jdbc.Driver";
        //指定连接数据库的url
    final static String DB_URL = "jdbc:mysql://localhost:3306/customizableSys?characterEncoding=utf-8";
    //mysql用户名
    final static String name = "root";
        //mysql密码
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
          //注册jdbc驱动
          Class.forName(JDBC_DRIVER);
          //打开连接
          System.out.println("//连接数据库");
          conn = DriverManager.getConnection(DB_URL,name,pwd);
          
        //判断表是否存在
      	  DatabaseMetaData dbm = conn.getMetaData();

          ResultSet rs = dbm.getTables(null, null, args, null);

          if (rs.next()) {

            System.out.println("Exists");

          }

          else {

            System.out.println("Not Exist");
          //执行创建表
            System.out.println("//创建表");
            stmt = conn.prepareStatement(creatsql);           
           if(false == stmt.execute())
           {
               System.out.println("成功创建表！");
           }
           else
           {
               System.out.println("创建表失败！");
           }
           //
            stmt.close();
            conn.close();
            System.out.println("//关闭资源");
          }
          
          
      }
      catch(Exception e)
      {
          System.out.println("创建表失败！");
          e.printStackTrace();
      }
    }
}
