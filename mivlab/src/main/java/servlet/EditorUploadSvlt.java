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

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import net.sf.json.JSONObject;
import utils.RondomToNameUtils;

/**
 * Servlet implementation class EditorUploadSvlt
 */
@WebServlet("/EditorUploadSvlt")
public class EditorUploadSvlt extends HttpServlet {
private static final long serialVersionUID = 1L;
	
    // �ϴ��ļ��洢Ŀ¼
    //private static final String UPLOAD_DIRECTORY = "/customizableSys/editorUploadImage";
	private static final String UPLOAD_DIRECTORY = "editorUploadImage";
    // �ϴ�����
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
 
    /**
     * �ϴ����ݼ������ļ�
     */
    protected void doPost(HttpServletRequest request,
        HttpServletResponse response) throws ServletException, IOException {
    	response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
	 	//����json����
			JSONObject json=new JSONObject();
		HttpSession session=request.getSession();    	
        // ����Ƿ�Ϊ��ý���ϴ�
        if (!ServletFileUpload.isMultipartContent(request)) {
            // ���������ֹͣ
           PrintWriter writer = response.getWriter();
            writer.println("Error: ��������� enctype=multipart/form-data");
            writer.flush();
            return;
        	
        }
        
        // �����ϴ�����
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // �����ڴ��ٽ�ֵ - �����󽫲�����ʱ�ļ����洢����ʱĿ¼��
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // ������ʱ�洢Ŀ¼
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
 
        ServletFileUpload upload = new ServletFileUpload(factory);
         
        // ��������ļ��ϴ�ֵ
        upload.setFileSizeMax(MAX_FILE_SIZE);
         
        // �����������ֵ (�����ļ��ͱ�����)
        upload.setSizeMax(MAX_REQUEST_SIZE);

        // ���Ĵ���
        upload.setHeaderEncoding("UTF-8"); 

        // ������ʱ·�����洢�ϴ����ļ�
        // ���·����Ե�ǰӦ�õ�Ŀ¼
        //String basePath ="E:/eclipseWorkspace/.metadata/allProjUpload";
        String basePath=request.getServletContext().getRealPath("./") + File.separator;
      String uploadPath = basePath+UPLOAD_DIRECTORY;
            		   		  	     
        // ���Ŀ¼�������򴴽�
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
 
        try {
            // ���������������ȡ�ļ�����
            //@SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
 
            if (formItems != null && formItems.size() > 0) {
                // ����������
                for (FileItem item : formItems) {
                    // �����ڱ��е��ֶ�
                    if (!item.isFormField()) {
                        String fileName1 = new File(item.getName()).getName();
                    	String fileName = RondomToNameUtils.getRandomFileName();
                    	 fileName=fileName+fileName1;
                  		//System.out.println("rondom="+fileName);//8835920140307
                        String filePath = uploadPath + "/" + fileName;
                        
                        File storeFile = new File(filePath);
                        // �ڿ���̨����ļ����ϴ�·��
                        //System.out.println("����CKeditor��ͼƬ�ϴ���filename="+fileName);
                        System.out.println(filePath);
                        //String showpath="/allProjUpload/customizableSys/editorUploadImage/"+fileName;
                        String showpath=UPLOAD_DIRECTORY+"/"+fileName;
                        // �����ļ���Ӳ��
                        item.write(storeFile);
                        request.setAttribute("message",
                           "�ļ��ϴ��ɹ�!");
                       
                       json.put("res", "1");
                       json.put("url", showpath);
                    }
                }
            }
        } catch (Exception ex) {
            request.setAttribute("message",
                    "������Ϣ: " + ex.getMessage());
        	
        }
       
        PrintWriter out=response.getWriter();
		out.print(json.toString());
		out.flush();
		out.close();
    }
}
