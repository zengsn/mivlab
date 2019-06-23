package servlet;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wm.utils.DbConn;
import com.wm.utils.GetList;

import bean.Com;
import bean.GitDate;
import bean.ScoreProportion;
import bean.Teacher;
import bean.Terms;
import bean.user;
import net.sf.json.JSONObject;
import utils.Dbhelper;

/**
 * Servlet implementation class GitSlvt
 */
@WebServlet("/GitSlvt")
public class GitSlvt extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GitSlvt() {
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
		//创建数据库操作对象
		DbConn db=Dbhelper.getDb();
		//获取session对象
		HttpSession session=request.getSession();
				
		//获取当前登录用户信息
		Object useridd=session.getAttribute("userid");
		
		if(useridd==null){
			request.getRequestDispatcher("index.jsp").forward(request, response);
			/**
			PrintWriter out=response.getWriter();
			out.print("请重新登录");
			out.flush();
			out.close();
			**/
			return;
		}else {
			
		//判断用户类型
			String GitUsername,TOKEN,CLIENT_ID,CLIENT_SECRET;
		String uType=request.getParameter("uType");
		if(uType.equals("admin")) {
			user userinfo=(user)session.getAttribute("userinfo");
			 GitUsername=userinfo.getGitUsername();
			 TOKEN=userinfo.getTOKEN();
			 CLIENT_ID=userinfo.getCLIENT_ID();
			 CLIENT_SECRET=userinfo.getCLIENT_SECRET();
		}else {
			//获取当前登录用户信息
			Teacher userinfo=(Teacher)session.getAttribute("userinfo");
			 GitUsername=userinfo.getGitUsername();
			 TOKEN=userinfo.getTOKEN();
			 CLIENT_ID=userinfo.getCLIENT_ID();
			 CLIENT_SECRET=userinfo.getCLIENT_SECRET();
		}
		
		System.out.print("gitname="+GitUsername);
		
		//获取用户指定的实验库信息
		String org=request.getParameter("org");
		String proj=request.getParameter("proj");
		//初始化连接数据
			    //API
	   /* String[] a= {};
	    gitrepostats.App.main(a);
	    System.out.print("执行APP");*/
		int flagg;
	    //flagg=gitrepostats.App3.main2(GitUsername,TOKEN,CLIENT_ID,CLIENT_SECRET,org,proj);
		String rootpath=getServletContext().getRealPath("/");//项目绝对路径
		flagg=gitrepostats.App3.main2(GitUsername,TOKEN,CLIENT_ID,CLIENT_SECRET,org,proj,rootpath);
	    if(flagg==404) {
	    	json.put("msg", "所访问的资源不存在，请检查GitHub信息、组织库信息、实验库信息是否正确");
	    }else if(flagg>=500 & flagg<=600) {
	    	json.put("msg","服务器错误，请重试");
	    }else {
	    	json.put("msg","发生错误，请重试");
	    }
	    
	    //将数据写到数据库
	    
	    int tid=Integer.parseInt(String.valueOf(useridd));
	    int terms_id=Integer.parseInt(request.getParameter("cktermsid"));
		int course_id=Integer.parseInt(request.getParameter("ccoursesid"));
	    gitrepostats.ReadCSV.main(tid,org,proj,course_id,terms_id,rootpath,GitUsername);
	    
	    

	    
	    //统计成绩
	    //pull占比，满分次数
	    String pulls=request.getParameter("pulls");
		String pullsFull=request.getParameter("pullsFull");
		//commits占比，满分次数
	    String commits=request.getParameter("commits");
		String commitsFull=request.getParameter("commitsFull");			
		//changefiles占比，满分次数
	    String files=request.getParameter("files");
		String filesFull=request.getParameter("filesFull");			
		//Comment占比，满分次数
	    String comments=request.getParameter("comments");
		String commentsFull=request.getParameter("commentsFull");
		//pullDone占比，满分次数
	    String pullDone=request.getParameter("pullDone");
		//pullGood占比，满分次数
	    String pullGood=request.getParameter("pullGood");
		//pullLate占比，满分次数
	    String pullLate=request.getParameter("pullLate");
		//pullCopy占比，满分次数
	    String pullCopy=request.getParameter("pullCopy");
		//pullBad占比，满分次数
	    String pullBad=request.getParameter("pullBad");
		//pullBug占比，满分次数
	    String pullBug=request.getParameter("pullBug");
		//pullDemo占比，满分次数
	    String pullDemo=request.getParameter("pullDemo");
		//pullInteresting占比，满分次数
	    String pullInteresting=request.getParameter("pullInteresting");
		
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
	    
	    sp.setPullDone(Double.parseDouble(pullDone));
	    sp.setPullGood(Double.parseDouble(pullGood));
	    sp.setPullLate(Double.parseDouble(pullLate));
	    sp.setPullCopy(Double.parseDouble(pullCopy));
	    sp.setPullBad(Integer.parseInt(pullBad));
	    sp.setPullBug(Integer.parseInt(pullBug));
	    sp.setPullDemo(Integer.parseInt(pullDemo));
	    sp.setPullInteresting(Integer.parseInt(pullInteresting));
	    

	    
	    //读取查询库的实验数据，实例化
	    String tablename="reposdate";
	    String sql="select id,Pulls,PullDone,PullGood,PullLate,PullCopy,PullBad,PullBug,PullDemo,PullInteresting,Commits,ChangedFiles,Comments from "+tablename+" where org='"+org+"' and proj='"+proj+"' and terms_id="+terms_id+" and course_id="+course_id;
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
	    	
	    	int pDone=gitdatelist.get(i).getPullDone();
	    	int pGood=gitdatelist.get(i).getPullGood();
	    	int pLate=gitdatelist.get(i).getPullLate();
	    	int pCopy=gitdatelist.get(i).getPullCopy();
	    	int pBad=gitdatelist.get(i).getPullBad();
	    	int pBug=gitdatelist.get(i).getPullBug();
	    	int pDemo=gitdatelist.get(i).getPullDemo();
	    	int pInteresting=gitdatelist.get(i).getPullInteresting();
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
	    	
	    	double pullDone2=sp.getPullDone();
	    	double pullGood2=sp.getPullGood();
	    	double pullLate2=sp.getPullLate();
	    	double pullCopy2=sp.getPullCopy();
	    	double pullBad2=sp.getPullBad();
	    	double pullBug2=sp.getPullBug();
	    	double pullDemo2=sp.getPullDemo();
	    	double pullInteresting2=sp.getPullInteresting();
	    		    	
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
	    	//加分项
	    	sum=sum+pullDone2*pDone+pullGood2*pGood+pullDemo2*pDemo+pullInteresting2*pInteresting;
	    	//减分项
	    	sum=sum-pullLate2*pLate-pullCopy2*pCopy-pullBad2*pBad-pullBug2*pBug;
	    	System.out.print((int)sum);
	    	System.out.println();
	    	int bls=db.executeUpdate("update  "+tablename+" set score="+(int)sum+" where id="+gitdatelist.get(i).getId());
	    	if(bls<=0){
				flag=1;
			}		    	
	    }
	    
	    //String filepath="E:/eclipseWorkspace/.metadata/allProjUpload/customizableSys/git/src/json/" ;
	    /*	File file = new File("./");
		 file.getCanonicalPath();
		 String filepath= file.getCanonicalPath();
		 filepath=filepath+"/src/json/";*/
	    /**
	     * 将成绩result存放到服务器，将路径存入数据库，可供教师查看原始数据
	     */
	    String resultFile=rootpath+"/github/"+GitUsername+"/"+org+"/"+proj+"/src/json/result.csv";
	    File newpath1= new File(rootpath+"/resultList/"+GitUsername+"/"+org+"/"+proj+"/");
	    System.out.println("newpath1="+newpath1);
	    if(!newpath1.exists()) {
	    	String folderName = newpath1.getParent();
	    	System.out.println("folderName="+folderName);
			File folder = new File(folderName);
			if (!folder.exists()) {
				folder.mkdirs();
			}
	    	
	    	//创建文件夹
	    	System.out.println("创建文件夹存储原始成绩数据");
	    	
	    }
	    
		String newpath=rootpath+"/resultList/"+GitUsername+"/"+org+"/"+org+"-"+proj+"Result.csv";
		utils.CopyFileUtils.copyFile(resultFile,newpath);
		//将存储原始成绩的数据的路径存入数据库
		System.out.println("将存储原始成绩的数据的路径存入数据库");
	    String onlinepath = "resultList/"+GitUsername+"/"+org+"/"+org+"-"+proj+"Result.csv";
		
		 
		 boolean bl=db.checkTrue("select id from gitrawdata where tid='"+useridd+"' and filepath='" +onlinepath+"'");
			if(bl){
				System.out.print("记录已存在，执行更新操作");
				System.out.println();
				List<Com> list=GetList.getlist(Com.class, db.executeQuery("select id from gitrawdata where tid='"+useridd+"' and filepath='" +onlinepath+"'"));
				if(list.size()>0) {
					int id=list.get(0).getId();
					int bls=db.executeUpdate("update  gitrawdata  set filepath='"+onlinepath+"'where id="+id);
					if(!(bls>0)){
						System.out.println("更新失败");
					
					}
				}
				
			}else {
				System.out.println("执行插入数据操作");
				//System.out.println();
				int bls=db.executeUpdate("insert into gitrawdata  (tid,filepath) values('"+useridd+"','"+onlinepath+"')");
				if(!(bls>0)){
					//System.out.print("插入数据失败");
					//System.out.println();
				}
			}
	    /**
	     * 在服务器上时，抓取数据后生成成绩后，应把数据删除
	     */
	   	
	    String filepath=rootpath+"/github/"+GitUsername+"/"+org+"/"+proj;
	    if( gitrepostats.DelDirfile.delAllFile(filepath)) {
	    	System.out.print("删除文件成功！");
	    	if(flag==1) {
				json.put("msg", "有数据未更新，请重新操作");
			}else{
				json.put("msg", "所有数据更新完毕");
			}
	    }	   	
	  				
		out.print(json.toString());
		out.flush();
		out.close();
	}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	

}
