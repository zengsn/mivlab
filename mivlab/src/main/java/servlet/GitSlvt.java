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
		
		
		//���ô������ݱ��뷽ʽ
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		//����json����
		JSONObject json=new JSONObject();
		//�������ݿ��������
		DbConn db=Dbhelper.getDb();
		//��ȡsession����
		HttpSession session=request.getSession();
		//��ȡ��ǰ��¼�û���Ϣ
		Teacher userinfo=(Teacher)session.getAttribute("userinfo");
		String GitUsername=userinfo.getGitUsername();
		String TOKEN=userinfo.getTOKEN();
		String CLIENT_ID=userinfo.getCLIENT_ID();
		String CLIENT_SECRET=userinfo.getCLIENT_SECRET();
		System.out.print("gitname="+GitUsername);
		
		//��ȡ�û�ָ����ʵ�����Ϣ
		String org=request.getParameter("org");
		String proj=request.getParameter("proj");
		//��ʼ����������
			    //API
	   /* String[] a= {};
	    gitrepostats.App.main(a);
	    System.out.print("ִ��APP");*/
		int flagg;
	    //flagg=gitrepostats.App3.main2(GitUsername,TOKEN,CLIENT_ID,CLIENT_SECRET,org,proj);
		String rootpath=getServletContext().getRealPath("/");//��Ŀ����·��
		flagg=gitrepostats.App3.main2(GitUsername,TOKEN,CLIENT_ID,CLIENT_SECRET,org,proj,rootpath);
	    if(flagg==404) {
	    	json.put("msg", "�����ʵ���Դ�����ڣ�����GitHub��Ϣ����֯����Ϣ��ʵ�����Ϣ�Ƿ���ȷ");
	    }else if(flagg>=500 & flagg<=600) {
	    	json.put("msg","����������������");
	    }else {
	    	json.put("msg","��������������");
	    }
	    
	    //������д�����ݿ�
	    int tid=userinfo.getId();
	    int terms_id=Integer.parseInt(request.getParameter("cktermsid"));
		int course_id=Integer.parseInt(request.getParameter("ccoursesid"));
	    gitrepostats.ReadCSV.main(tid,org,proj,course_id,terms_id,rootpath);
	    
	    

	    
	    //ͳ�Ƴɼ�
	    //pullռ�ȣ����ִ���
	    String pulls=request.getParameter("pulls");
		String pullsFull=request.getParameter("pullsFull");
		//commitsռ�ȣ����ִ���
	    String commits=request.getParameter("commits");
		String commitsFull=request.getParameter("commitsFull");			
		//pullռ�ȣ����ִ���
	    String files=request.getParameter("files");
		String filesFull=request.getParameter("filesFull");			
		//pullռ�ȣ����ִ���
	    String comments=request.getParameter("comments");
		String commentsFull=request.getParameter("commentsFull");
	    PrintWriter out=response.getWriter();
		
	    //ʵ������ֵ����
	   
	    ScoreProportion sp=new ScoreProportion();
	    sp.setPulls(Double.parseDouble(pulls));
	    sp.setCommits(Double.parseDouble(commits));
	    sp.setComments(Double.parseDouble(comments));
	    sp.setFile(Double.parseDouble(files));
	    sp.setPullsFull(Integer.parseInt(pullsFull));
	    sp.setCommitsFull(Integer.parseInt(commitsFull));
	    sp.setFileFull(Integer.parseInt(filesFull));
	    sp.setCommentsFull(Integer.parseInt(commentsFull));
	    
	    //��ȡ��ѯ���ʵ�����ݣ�ʵ����
	    String tablename="reposdate";
	    String sql="select id,Pulls,Commits,ChangedFiles,Comments from "+tablename+" where org='"+org+"' and proj='"+proj+"' and terms_id="+terms_id+" and course_id="+course_id;
	    List<GitDate> gitdatelist=GetList.getlist(GitDate.class, db.executeQuery(sql));
	    System.out.print("��ѯ���="+sql);
	    System.out.println();
	    System.out.print("���ݳ���"+gitdatelist.size());
	    int flag=0;  //���Գɼ����������
	    for(int i=0;i<gitdatelist.size();i++) {
	    	double sum=0;
	    	int p=gitdatelist.get(i).getPulls();
	    	int co=gitdatelist.get(i).getComments();
	    	int ci=gitdatelist.get(i).getCommits();
	    	int f=gitdatelist.get(i).getChangedFiles();
	    	
	    	//���ִ���
	    	int pf=sp.getPullsFull();
	    	int cif=sp.getCommitsFull();
	    	int cof=sp.getCommentsFull();
	    	int ff=sp.getFileFull();
	    	
	    	//��ֵ����
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
	    
	    //String filepath="E:/eclipseWorkspace/.metadata/allProjUpload/customizableSys/git/src/json/" ;
	    /*	File file = new File("./");
		 file.getCanonicalPath();
		 String filepath= file.getCanonicalPath();
		 filepath=filepath+"/src/json/";*/
	    String filepath=rootpath+"/github/";
	    if( gitrepostats.DelDirfile.delAllFile(filepath)) {
	    	System.out.print("ɾ���ļ��ɹ���");
	    	if(flag==1) {
				json.put("msg", "������δ���£������²���");
			}else{
				json.put("msg", "�������ݸ������");
			}
	    }
	    /* if(flag==1) {
			json.put("msg", "������δ���£������²���");
		}else{
			json.put("msg", "�������ݸ������");
		}*/
				
		
		out.print(json.toString());
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	

}
