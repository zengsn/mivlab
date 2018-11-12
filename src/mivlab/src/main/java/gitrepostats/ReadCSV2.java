package gitrepostats;

import java.io.File;
import java.util.Scanner;

import com.wm.utils.DbConn;

import utils.Dbhelper;

public class ReadCSV2 {
	 public static void main(int tid,String org,String proj,String rootpath){
			//未封装的CSV存入数据库函数
					//创建数据库操作对象
					DbConn db=Dbhelper.getDb();
					long startTime = System.currentTimeMillis();
					
					//File file1 = new File("E:/installBlock/eclipseEE/eclipse-jee-oxygen-2-win32-x86_64/eclipse/src2018Android/json/result.csv");
					//System.out.print(file1);
					File file = new File(rootpath+"/github/"+org+"/"+proj+"/src/json/result.csv");
					System.out.print(file);
					try {
					Scanner in = new Scanner(file);
			 		
					System.out.println("数据库连接成功");
					//判断表是否存在，不存在则创建表,每个教师一个表
					String tablename="outreposdate";
					
					//dao.CreateTable.main(tablename);
					//录入数据
					in.next();
					while (in.hasNext())
					{
						String temp1 = in.nextLine();		//忽略第一行
						String[] temp = temp1.split(",");
						
						//System.out.println("temp="+temp);
						if (temp.length < 14)
							continue;
			 
						if (temp.length == 14)
						{	
							boolean bl=db.checkTrue("select id from "+tablename+" where Num='"+temp[1]+"' and Login='"+temp[0]+"' and org='" +org+"' and proj='"+proj+"' and tid="+tid);
							if(bl){
								System.out.print("改记录已存在，执行更新操作");
								System.out.println();
								int bls=db.executeUpdate("update "+ tablename+" set Login='"+temp[0]+"',IssueNumber='"+temp[2]+"',IssueCount='"+temp[3]+"',IssueLabels='"+temp[4]+"',Events='"+temp[5]+"',FirstTime='"+temp[6]+"',Pulls="+temp[7]+",Commits="+temp[8]+",Additions="+temp[9]+",Deletions="+temp[10]+",ChangedFiles="+temp[11]+",Comments="+temp[12]+",ReviewComments="+temp[13]+"  where Num='"+temp[1]+"' and Login='"+temp[0]+"' and org='" +org+"' and proj='"+proj+"' and tid="+tid);
								
							}else {
								System.out.print("执行插入数据操作");
								System.out.println();
								int bls=db.executeUpdate("insert into "+tablename+" (Login,Num,IssueNumber,IssueCount,IssueLabels,Events,FirstTime,Pulls,Commits,Additions,Deletions,ChangedFiles,Comments,ReviewComments,org,proj,tid) values('"+temp[0]+"','"+temp[1]+"','"+temp[2]+"','"+temp[3]+"','"+temp[4]+"','"+temp[5]+"','"+temp[6]+"','"+temp[7]+"','"+temp[8]+"','"+temp[9]+"','"+temp[10]+"','"+temp[11]+"','"+temp[12]+"',"+temp[13]+",'"+org+"','"+proj+"',"+tid+")");
								
							}
						}
					}
						

			 
					long EndTime = System.currentTimeMillis();
					long time = (EndTime - startTime) / 1000;
			 
					System.out.println("导入数据共用时：" + time);
					in.close();
				 }catch (Exception ex) {			 
					      System.out.print("读取数据出错");
				 }
					 
			        
			 }
		}