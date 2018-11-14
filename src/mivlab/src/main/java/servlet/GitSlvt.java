package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.List;

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
import bean.Teacher;
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
		Teacher userinfo=(Teacher)session.getAttribute("userinfo");
		String GitUsername=userinfo.getGitUsername();
		String TOKEN=userinfo.getTOKEN();
		String CLIENT_ID=userinfo.getCLIENT_ID();
		String CLIENT_SECRET=userinfo.getCLIENT_SECRET();
		System.out.print("gitname="+GitUsername);
		
		//获取用户指定的实验库信息
		String org=request.getParameter("org");
		String proj=request.getParameter("proj");
		String flgs=request.getParameter("flgs");
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
	    }
	    else {
	    
	   
	    
	    int tid=userinfo.getId();
	    
	    
	    

	    
	    //统计成绩
	    //pull占比，满分次数
	    String pulls=request.getParameter("pulls");
		String pullsFull=request.getParameter("pullsFull");
		//commits占比，满分次数
	    String commits=request.getParameter("commits");
		String commitsFull=request.getParameter("commitsFull");			
		//pull占比，满分次数
	    String files=request.getParameter("files");
		String filesFull=request.getParameter("filesFull");			
		//pull占比，满分次数
	    String comments=request.getParameter("comments");
		String commentsFull=request.getParameter("commentsFull");
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
	    
	    if("in".equals(flgs)) {
	    	//获得系内学生的实验数据及成绩
	    	//将数据写到数据库
	    	int terms_id=Integer.parseInt(request.getParameter("cktermsid"));
			int course_id=Integer.parseInt(request.getParameter("ccoursesid"));
		    gitrepostats.ReadCSV.main(tid,org,proj,course_id,terms_id,rootpath);
			    
			    //读取查询库的实验数据，实例化
			    String tablename="reposdate";
			    String sql="select id,Pulls,Commits,ChangedFiles,Comments from "+tablename+" where org='"+org+"' and proj='"+proj+"' and terms_id="+terms_id+" and course_id="+course_id+" and tid="+tid;
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
			    
			    //以下为删除Git原文件
			    /*
			    String filepath=rootpath+"/github/";
			    if( gitrepostats.DelDirfile.delAllFile(filepath)) {
			    	System.out.print("删除文件成功！");
			    	if(flag==1) {
						json.put("msg", "有数据未更新，请重新操作");
					}else{
						json.put("msg", "所有数据更新完毕");
					}
			    }*/
			  //以下为删除Git原文件
			     if(flag==1) {
					json.put("msg", "有数据未更新，请重新操作");
				}else{
					json.put("msg", "所有数据更新完毕");
				}
			    out.print(json.toString());
				out.flush();
				out.close();
	    }
	    else if("out".equals(flgs)){
	    	//获得系外学生的实验数据及成绩
	 	   
		    //将数据写到数据库		    		    
		    gitrepostats.ReadCSV2.main(tid,org,proj,rootpath);	//读取实验数据
		    		    		    
		   
		    
		    //读取查询库的实验数据，实例化
		    String tablename="outreposdate";
		    String sql="select id,Pulls,Commits,ChangedFiles,Comments from "+tablename+" where org='"+org+"' and proj='"+proj+"' and tid="+tid;
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
		    if(flag==1) {
				json.put("msg", "有数据未更新，请重新操作");
			}else{
				json.put("msg", "所有数据更新完毕");
			}
		    out.print(json.toString());
			out.flush();
			out.close();
	    }
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
