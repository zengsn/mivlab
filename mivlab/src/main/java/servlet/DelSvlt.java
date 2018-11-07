package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wm.utils.DbConn;

import net.sf.json.JSONObject;
import utils.Dbhelper;

/**
 * Servlet implementation class DelSvlt
 */
@WebServlet("/DelSvlt")
public class DelSvlt extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelSvlt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//���ô������ݱ��뷽ʽ
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		//��ȡsession����
		HttpSession session=request.getSession();
		//��ȡ��ǰ��¼�û���Ϣ
		Object userid=session.getAttribute("userid");
		//����json����
		JSONObject json=new JSONObject();
		if(userid==null){
			PrintWriter out=response.getWriter();
			out.print("�����µ�¼");
			out.flush();
			out.close();
			return;
		}else{
			//�������ݿ��������
			DbConn db=Dbhelper.getDb();
			//��ȡ������ʶ
			String tbname=request.getParameter("tbname");
			//��ȡ��Ϣid����
			String ids=request.getParameter("ids");
			int i=0;
			json.put("msg", 0);
			//������Ҫɾ����id�ַ���
			if(ids.endsWith(",")){	
				ids=ids.substring(0, ids.length()-1);
			}
			if("fnav".equals(tbname)){	//һ��������
				if(ids.length()>0){
					//ɾ����Ҫɾ������Ϣ���
					String sql="delete from fnav where id in("+ids+")";
					//ɾ������
					i=db.executeUpdate(sql);
				}
				//���i>0 ˵��ɾ��������Ҫɾ��������
				if(i>0){
					json.put("msg", "ɾ���ɹ�");
				}else{
					json.put("msg", "ɾ��ʧ��");
				}
			}
			if("snav".equals(tbname)){	//����������
				if(ids.length()>0){
					//ɾ����Ҫɾ������Ϣ���
					String sql="delete from snav where id in("+ids+")";
					//ɾ������
					i=db.executeUpdate(sql);
				}
				//���i>0 ˵��ɾ��������Ҫɾ��������
				if(i>0){
					json.put("msg", "ɾ���ɹ�");
				}else{
					json.put("msg", "ɾ��ʧ��");
				}
			}
			if("terms".equals(tbname)){	//����������
				if(ids.length()>0){
					//ɾ����Ҫɾ������Ϣ���
					String sql="delete from terms where id in("+ids+")";
					//ɾ������
					i=db.executeUpdate(sql);
				}
				//���i>0 ˵��ɾ��������Ҫɾ��������
				if(i>0){
					json.put("msg", "ɾ���ɹ�");
				}else{
					json.put("msg", "ɾ��ʧ��");
				}
			}
			if("teacher".equals(tbname)){	//��ʦ��Ϣ
				if(ids.length()>0){
					//ɾ����Ҫɾ������Ϣ���
					String sql="delete from teacher where id in("+ids+")";
					//ɾ������
					i=db.executeUpdate(sql);
				}
				//���i>0 ˵��ɾ��������Ҫɾ��������
				if(i>0){
					json.put("msg", "ɾ���ɹ�");
				}else{
					json.put("msg", "ɾ��ʧ��");
				}
			}
			if("classinfo".equals(tbname)){	//�༶��Ϣ
				if(ids.length()>0){
					//ɾ����Ҫɾ������Ϣ���
					String sql="delete from classinfo where id in("+ids+")";
					//ɾ������
					i=db.executeUpdate(sql);
				}
				//���i>0 ˵��ɾ��������Ҫɾ��������
				if(i>0){
					json.put("msg", "ɾ���ɹ�");
				}else{
					json.put("msg", "ɾ��ʧ��");
				}
			}
			if("students".equals(tbname)){	//ѧ����Ϣ
				if(ids.length()>0){
					//ɾ����Ҫɾ������Ϣ���
					String sql="delete from students where id in("+ids+")";
					//ɾ������
					i=db.executeUpdate(sql);
				}
				//���i>0 ˵��ɾ��������Ҫɾ��������
				if(i>0){
					json.put("msg", "ɾ���ɹ�");
				}else{
					json.put("msg", "ɾ��ʧ��");
				}
			}
			if("course".equals(tbname)){
				if(ids.length()>0){
					//ɾ����Ҫɾ������Ϣ���
					String sql="delete from course where id in("+ids+")";
					//ɾ������
					i=db.executeUpdate(sql);
				}
				//���i>0 ˵��ɾ��������Ҫɾ��������
				if(i>0){
					json.put("msg", "ɾ���ɹ�");
				}else{
					json.put("msg", "ɾ��ʧ��");
				}
			}
			if("courseplan".equals(tbname)){	//�γ̰���
				if(ids.length()>0){
					//ɾ����Ҫɾ������Ϣ���
					String sql="delete from courseplan where id in("+ids+")";
					//ɾ������
					i=db.executeUpdate(sql);
				}
				//���i>0 ˵��ɾ��������Ҫɾ��������
				if(i>0){
					json.put("msg", "ɾ���ɹ�");
				}else{
					json.put("msg", "ɾ��ʧ��");
				}
			}
			int i2=0;
			if("tshiyan".equals(tbname)){	//�γ�ʵ�鰲��
				if(ids.length()>0){
					//ɾ����Ҫɾ������Ϣ���
					String sql="delete from stutask where teatask_id in("+ids+")";
					String sql2="delete from teatask where id in("+ids+")";
					//ɾ������
					i=db.executeUpdate(sql);
					
					i2=db.executeUpdate(sql2);
				}
				//���i>0 ˵��ɾ��������Ҫɾ��������
				if(i>0 && i2>0){
					json.put("msg", "ɾ��ʧ��");
				}else{
					json.put("msg", "ɾ���ɹ�");
				}
			}
			if("reposdate".equals(tbname)){	//GitHubʵ��ɼ�
				if(ids.length()>0){
					//ɾ����Ҫɾ������Ϣ���
					String sql="delete from reposdate where id in("+ids+")";
					//ɾ������
					i=db.executeUpdate(sql);
				}
				//���i>0 ˵��ɾ��������Ҫɾ��������
				if(i>0){
					json.put("msg", "ɾ���ɹ�");
				}else{
					json.put("msg", "ɾ��ʧ��");
				}
			}
			
			PrintWriter out=response.getWriter();
			out.print(json.toString());
			out.flush();
			out.close();
		}
	}

}