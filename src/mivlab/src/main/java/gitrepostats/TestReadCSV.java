package gitrepostats;

import java.io.File;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.wm.utils.DbConn;

import utils.Dbhelper;

public class TestReadCSV {
	 public static void main(int tid,String org,String proj,int course_id,int terms_id,String rootpath){
			//未封装的CSV存入数据库函数
					//创建数据库操作对象
					DbConn db=Dbhelper.getDb();
					long startTime = System.currentTimeMillis();
					
					org="hzuapps";
					proj="java-web";
					 /*File file = new File("./");
					 File rFile = new File(file.getAbsolutePath()+"/src/json/result.csv");
					System.out.print(rFile);*/
					//File file = new File("E:/eclipseWorkspace/.metadata/allProjUpload/customizableSys/git/src/json/result.csv");
					File file = new File(rootpath+"/github/"+org+"/"+proj+"/src/json/result.csv");
					System.out.print(file);
					try {
					Scanner in = new Scanner(file);
			 		
					System.out.println("数据库连接成功");
					//判断表是否存在，不存在则创建表,每个教师一个表
					String tablename="reposdate";
					
					
					//录入数据
					String regEx="[^0-9]";	//正则表达式,去掉文件前缀，保存学号
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
							//筛选出含学号的字段
							String str="";
							int begin=temp[1].indexOf("1"),end=temp[1].indexOf('/',begin+1);
							str=temp[1].substring(begin, end);
							if(str.length()!=0) {
								System.out.println(str);
								System.out.println(str.length());
							}
							
							//将筛选出来的字符再进行学号的筛选
							/**
							 * 
							 
							Pattern p= Pattern.compile(regEx);
							Matcher m=p.matcher(temp[1]);
							String strNum=m.replaceAll("").trim();	*/
							//System.out.println(strNum);
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
