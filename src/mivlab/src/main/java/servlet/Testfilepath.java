package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wm.utils.DbConn;
import com.wm.utils.GetList;

import bean.GitDate;
import bean.ScoreProportion;
import utils.Dbhelper;

/**
 * Servlet implementation class Testfilepath
 */
@WebServlet("/Testfilepath")
public class Testfilepath extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static final String UPLOAD_DIRECTORY = "upload";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Testfilepath() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		/*存储GitHub数据的路径测试-begin*/
		 File file = new File("./");
		 file.getCanonicalPath();
		 String path= file.getCanonicalPath();
		 path=path+"/src/json/";
	     System.out.print(path);
		 //gitrepostats.ReadCSV.main(1,"org","proj",1,1);
		// System.out.print("ok");
		 //System.out.println();
		 /*存储GitHub数据的路径测试-end */
		 
		 /*存储到当前项目目录的 路径测试-begin	*/		
		//String uploadPath = request.getServletContext().getRealPath("./") + File.separator + UPLOAD_DIRECTORY;
	    /* String uploadPath = request.getServletContext().getRealPath("./") + File.separator + UPLOAD_DIRECTORY;
		 System.out.print("uploadPath="+uploadPath+"****");
		 System.out.println();*/
		 
		//取得根目录路径
		 /*
		 String realPath=getServletContext().getRealPath("/");//项目绝对路径

		 
		 System.out.print("realPath="+realPath+"****");
		 System.out.println();
		 */
	     
	     //测试抓取原数据*、以下
		/* String[] a= {};
		    gitrepostats.App.main(a);
		    System.out.print("执行APP");
		   */ 
		    
	     //以下为测试只保留学号
	     
	   //未封装的CSV存入数据库函数
			//创建数据库操作对象
	     	
			DbConn db=Dbhelper.getDb();
			long startTime = System.currentTimeMillis();
			 File file1 = new File("./");
			 File rFile = new File(file1.getAbsolutePath()+"/src2018Android/json/result.csv");
			
			System.out.print(rFile);
			try {
			Scanner in = new Scanner(rFile);
	 		
			System.out.println("数据库连接成功");
			//判断表是否存在，不存在则创建表,每个教师一个表
			//String tablename="reposdate";
			
			//dao.CreateTable.main(tablename);
			//录入数据
			String regEx="[^0-9]";	//正则表达式
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
					Pattern p= Pattern.compile(regEx);
					Matcher m=p.matcher(temp[1]);
					String str=m.replaceAll("").trim();	
					System.out.print(str);
					System.out.println();
					int bls=db.executeUpdate("insert into students (sno,sname,sgender,classinfo_id,sphone,spassword) values('"+str+"','学生名','男','4','123','222')");
				}
			}
				

	 
			long EndTime = System.currentTimeMillis();
			long time = (EndTime - startTime) / 1000;
	 
			System.out.println("导入数据共用时：" + time);
			in.close();
		 }catch (Exception ex) {			 
			      System.out.print("读取数据出错");
		 }
	     
	     
	     //以上为测试只保留学号
		    
		 //以下测试系外学生数据是否录入系统
	     /*
		  //创建数据库操作对象
			DbConn db=Dbhelper.getDb();
			//获取session对象
			HttpSession session=request.getSession();
		  //将数据写到数据库
		    int tid=1;
		    String org="hzuapps";
		    String proj="android-labs-2018";
		    String rootpath="null";
		    gitrepostats.ReadCSV2.main(tid,org,proj,rootpath);	//读取实验数据
		    		    		    
		    //统计成绩
		    //pull占比，满分次数
		    String pulls="0.4";
			String pullsFull="6";
			//commits占比，满分次数
		    String commits="0.4";
			String commitsFull="6";			
			//pull占比，满分次数
		    String files="0.1";
			String filesFull="6";		
			//pull占比，满分次数
		    String comments="0.1";
			String commentsFull="0";
		    PrintWriter out=response.getWriter();
			
		    //实例化分值比例
		   
		    ScoreProportion sp=new ScoreProportion();
		    sp.setPulls(Double.parseDouble(pulls));
		    sp.setCommits(Double.parseDouble(commits));
		    sp.setComments(Double.parseDouble(comments));
		    sp.setFile(Double.parseDouble(files));
		    sp.setPullsFull(Integer.parseInt(pullsFull));
		    sp.setCommitsFull(Integer.parseInt(commitsFull));
		    sp.setFileFull(Integer.parseInt(filesFull));
		    sp.setCommentsFull(Integer.parseInt(commentsFull));
		    
		    //读取查询库的实验数据，实例化
		    String tablename="outreposdate";
		    String sql="select id,Pulls,Commits,ChangedFiles,Comments from "+tablename+" where org='"+org+"' and proj='"+proj+"'";
		    List<GitDate> gitdatelist=GetList.getlist(GitDate.class, db.executeQuery(sql));
		    System.out.print("查询语句="+sql);
		    System.out.println();
		    System.out.print("数据长度"+gitdatelist.size());
		    int flag=0;  //所以成绩都更新完毕
		    for(int i=0;i<gitdatelist.size();i++) {
		    	double sum=0;
		    	int p=gitdatelist.get(i).getPulls();
		    	int co=gitdatelist.get(i).getComments();
		    	int ci=gitdatelist.get(i).getCommits();
		    	int f=gitdatelist.get(i).getChangedFiles();
		    	
		    	//满分次数
		    	int pf=sp.getPullsFull();
		    	int cif=sp.getCommitsFull();
		    	int cof=sp.getCommentsFull();
		    	int ff=sp.getFileFull();
		    	
		    	//分值比例
		    	double pull2=sp.getPulls();
		    	double commit2=sp.getCommits();
		    	double file2=sp.getFile();
		    	double comment2=sp.getComments();
		    	
		    	DecimalFormat df=new DecimalFormat("0.0");
		    	if(p>=pf) {
		    		sum=pull2;	    		
		    	}else {	    		
		    		sum=sum+pull2*p/pf;
		    	}
		    	if(ci>=cif) {
		    		sum=sum+commit2;
		    	}else {
		    		sum=sum+commit2*ci/cif;
		    	}
		    	if(f>=ff) {
		    		sum=sum+file2;
		    	}else {
		    		sum=sum+file2*f/ff;
		    	}
		    	if(co>=cof) {
		    		sum=sum+comment2;
		    	}else {
		    		sum=sum+comment2*co/cof;	    		
		    	}
		    	sum=sum*100;
		    	
		    	System.out.print((int)sum);
		    	System.out.println();
		    	int bls=db.executeUpdate("update  "+tablename+" set score="+(int)sum+" where id="+gitdatelist.get(i).getId());
		    	if(bls<=0){
					flag=1;
				}		    	
		    }
		    
		    /*删除文件程序
		    String filepath=rootpath+"/github/";
		    if( gitrepostats.DelDirfile.delAllFile(filepath)) {
		    	System.out.print("删除文件成功！");
		    	if(flag==1) {
					json.put("msg", "有数据未更新，请重新操作");
				}else{
					json.put("msg", "所有数据更新完毕");
				}
		    }
		    删除文件程序*/
		   
		    
		    
		 //以上测试系外学生数据是否录入系统
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
