package gitrepostats;

import java.io.File;
import java.util.List;
import java.util.Scanner;

import javax.servlet.http.HttpSession;

import com.wm.utils.DbConn;
import com.wm.utils.GetList;

import bean.Com;
import bean.Terms;
import utils.Dbhelper;

public class ReadCSV {
	 public static void main(int tid,String org,String proj,int course_id,int terms_id,String rootpath,String GitUsername){
	//未封装的CSV存入数据库函数
			//创建数据库操作对象
			DbConn db=Dbhelper.getDb();
			long startTime = System.currentTimeMillis();
			 /*File file = new File("./");
			 File rFile = new File(file.getAbsolutePath()+"/src/json/result.csv");
			System.out.print(rFile);*/
			//File file = new File("E:/eclipseWorkspace/.metadata/allProjUpload/customizableSys/git/src/json/result.csv");
			File file = new File(rootpath+"/github/"+GitUsername+"/"+org+"/"+proj+"/src/json/result.csv");
			System.out.println(file);
			
			try {
			Scanner in = new Scanner(file);
	 		
			System.out.println("执行Read CSV，数据库连接成功");
			//判断表是否存在，不存在则创建表,每个教师一个表
			String tablename="reposdate";
			
			
			//录入数据
			in.next();
			while (in.hasNext())
			{
				
				String temp1 = in.nextLine();		//忽略第一行
				String[] temp = temp1.split(",");
				System.out.println(temp.length);
				
				//System.out.println("temp="+temp);
				if (temp.length < 22)
				{
					System.out.println("temp.length < 22");
					continue;
				}
				if (temp.length == 22)
				{	
					
					boolean bl=db.checkTrue("select id from "+tablename+" where Num='"+temp[1]+"' and org='" +org+"' and proj='"+proj+"' and terms_id="+terms_id+" and course_id="+course_id +" and tid='"+tid+"'");
					System.out.println("bl="+bl);
					if(bl){
						System.out.print("ReadCSV改记录已存在，执行更新操作");
						System.out.println();
						List<Com> list=GetList.getlist(Com.class, db.executeQuery("select id from "+tablename+" where Num='"+temp[1]+"' and org='" +org+"' and proj='"+proj+"' and terms_id="+terms_id+" and course_id="+course_id+" and tid='"+tid+"'"));
						if(list.size()>0) {
							int id=list.get(0).getId();		
							int bls=db.executeUpdate("update "+ tablename+" set Login='"+temp[0]+"',IssueNumber='"+temp[2]+"',IssueCount='"+temp[3]+"',IssueLabels='"+temp[4]+"',Events='"+temp[5]+"',FirstTime='"+temp[6]+"',Pulls="+temp[7]+",PullDone="+temp[8]+",PullGood="+temp[9]+",PullLate="+temp[10]+",PullCopy="+temp[11]+",PullBad="+temp[12]+",PullBug="+temp[13]+",PullDemo="+temp[14]+",PullInteresting="+temp[15]+",Commits="+temp[16]+",Additions="+temp[17]+",Deletions="+temp[18]+",ChangedFiles="+temp[19]+",Comments="+temp[20]+",ReviewComments="+temp[21]+" where id="+id);
							
							}
						
						
					}else {
						System.out.println("执行插入数据操作");
						//System.out.println();
						int bls=db.executeUpdate("insert into "+tablename+" (Login,Num,IssueNumber,IssueCount,IssueLabels,Events,FirstTime,Pulls,PullDone,PullGood,PullLate,PullCopy,PullBad,PullBug,PullDemo,PullInteresting,Commits,Additions,Deletions,ChangedFiles,Comments,ReviewComments,org,proj,terms_id,course_id,tid) values('"+temp[0]+"','"+temp[1]+"','"+temp[2]+"','"+temp[3]+"','"+temp[4]+"','"+temp[5]+"','"+temp[6]+"','"+temp[7]+"','"+temp[8]+"','"+temp[9]+"','"+temp[10]+"','"+temp[11]+"','"+temp[12]+"','"+temp[13]+"','"+temp[14]+"','"+temp[15]+"','"+temp[16]+"','"+temp[17]+"','"+temp[18]+"','"+temp[19]+"','"+temp[20]+"','"+temp[21]+"','"+org+"','"+proj+"',"+terms_id+","+course_id+",'"+tid+"')");
						if(!(bls>0)){
							System.out.println("插入数据失败");
							//System.out.println();
						}
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
