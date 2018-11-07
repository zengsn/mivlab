/** 
 * ����GitHub��ʵ���ѧ���롣<br />
 * By ����ѧԺ ������
 */
package gitrepostats;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.commons.lang3.math.NumberUtils;
import utils.JsonUtils;
import bean.Api;

/**
 * ͳ��һ��Repo�¹����ߵ����ݡ�
 */
public class App3 implements Api3 {
	
	static boolean hasCommitsDir = false;
	static boolean hasPullsDir = false;
	static boolean hasCommentsDir = false;
	static boolean hasIssuesDir = false;
	
	 public static int main2(String username,String token,String id,String secret ,String org,String proj,String rootpath) {
		    Api api=new Api();
	    	api.setHTTPS("https://");
	    	api.setGIT("api.github.com");
	    	api.setLOGIN("https://api.github.com/user");
	    	api.setREPO("/repos");
	    	api.setORG("/"+org);
	    	api.setPROJ("/"+proj);
	    	api.setUSERNAME(username);
	    	api.setTOKEN(token);
	    	api.setCLIENT_ID("client_id="+id);
	    	api.setCLIENT_SECRET("client_secret="+secret);
	    	api.setCLIENT_ID_SECRET("client_id="+id + "&" + "client_secret="+secret);
	    	api.setCONTRIBUTORS("https://"+ "api.github.com" + "/repos" + "/" +org + "/"+ proj + "/contributors");
	    	api.setCOMMITS("https://"+ "api.github.com" + "/repos" + "/" +org + "/"+ proj + "/commits");
	    	api.setPULLS("https://"+ "api.github.com" + "/repos" + "/" +org + "/"+ proj +  "/pulls");
	    	api.setISSUES("https://"+ "api.github.com" + "/repos"+ "/" +org + "/"+ proj +  "/issues");
	    	api.setSTATE("state=");
	    	api.setSTATE_CLOSED("state=" + "closed");
	    	api.setPER_PAGE("per_page=");
	    	api.setPAGE("page=");
	    	api.setLOGIN_TEACHER(username);
	    	/*
	    	 * ����String����
	    	String flag="true";
	    	flag=main(api);
	    	if(flag=="error") {
	    		return "error";
	    	}
	    	return "true";   */
	    	int flag=0;
	    	flag=main(api,rootpath);
	    	if(flag>=400 && flag<=600) {
	    		return flag;
	    	}
	    	return 0;
	}
	 /*����String����	 
	public static String  main(Api api) {
		String flag="null";
		flag=runAndRun(api);
		if(flag=="error") {
			return "error";
		}
		return "true";
	}

	public static String runAndRun(Api api) {
		String flag="true";
		try {
			System.out.println("Run at " + new Date());
			 flag=run(api);
			if(flag=="error") {
				return "error";
			}
			
		} catch (RuntimeException e) {
			e.printStackTrace();
			try {
				System.out.println("Sleep at " + new Date());
				Thread.sleep(61 * 60 * 1000);
				runAndRun(api); // run again
				
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
		}
		return "true";
	} 
	*/
	 public static int  main(Api api,String rootpath) {
			int flag=0;
			flag=runAndRun(api, rootpath);
			if(flag>=400 && flag<=600) {
				return flag;
			}
			return 0;
		}
	public static int runAndRun(Api api,String rootpath) {
		int flag=0;
		try {
			System.out.println("Run at " + new Date());
			 flag=run(api, rootpath);
			if(flag>=400 && 600>=flag) {
				return flag;
			}
			
		} catch (RuntimeException e) {
			e.printStackTrace();
			try {
				System.out.println("Sleep at " + new Date());
				Thread.sleep(61 * 60 * 1000);
				runAndRun(api, rootpath); // run again
				
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
		}
		return 0;
	} 
	@SuppressWarnings("unchecked")
	public static int run(Api api,String rootpath) {
		
		
		// ���й����ߵ�����
		Map<String, Stats> allData = new HashMap<String, Stats>();
		// ��ȡ������ Contributors
		/**�����ļ��洢·��
		 
		  File file = new File("./");
		  File jsonFile = new File(file.getAbsolutePath() + "/src/json/contributors.json");*/
		File jsonFile= new File(rootpath+"/github"+api.getORG()+api.getPROJ()+"/src/json/contributors.json");

		   

		
		//File jsonFile = new File("E:/eclipseWorkspace/.metadata/allProjUpload/customizableSys/git/src/json/contributors.json");
		List<Map<String, Object>> contributors = new ArrayList<Map<String, Object>>();
		if (!jsonFile.exists()) { // ��ȡ�����еĳ�Ա�б�
			String url = api.getCONTRIBUTORS() + "?" + api.getCLIENT_ID_SECRET() + "&" + api.getPER_PAGE() + "100&" + api.getPAGE();
			int total = 0;
			int pages = 1;
			String resp = Http3.get(url + pages,api);
			if (resp == null) { // ���Ƶ��ˣ�Ӧ��ͣһ��Сʱ
				
				throw new RuntimeException("Take a rest for one hour!");
			}
			
			/*����ӵĴ��룬�ж������Ƿ����*/
			if(resp.length()==3) {
				int f=Integer.parseInt(resp);
				if(f >=400 && f<=600) {
					return f;
				}
			}
			
			while (resp != null && resp.startsWith("[")) {
				List<Map<String, Object>> list = JsonUtils.toList(resp);
				System.out.println(list.size());
				if (list.size() > 0) {
					total += list.size();
					contributors.addAll(list);
					resp = Http3.get(url + ++pages,api);
				} else {
					break;
				}
			}
			System.out.println(total);
			writeToFile(jsonFile, JsonUtils.toString(contributors));
		} else { // ֱ�Ӷ�ȡ�ļ�
			String json = readFileToString(jsonFile);
			contributors = JsonUtils.toList(json);
		}
		// ȡ���������ʺ�
		for (Map<String, Object> contributorMap : contributors) {
			String login = getString(contributorMap, "login");
			Stats stats = allData.get(login);
			if (stats == null) {
				stats = new Stats();
				stats.login = login;
				allData.put(login, stats);
				System.out.println("���û���" + login);
			}
		}

		// ��ȡ�ύ��¼ Commits
		//jsonFile = new File(file.getAbsolutePath() + "/src/json/commits.json");
		//jsonFile = new File("E:/eclipseWorkspace/.metadata/allProjUpload/customizableSys/git/src/json/commits.json");
		 jsonFile= new File(rootpath+"/github"+api.getORG()+api.getPROJ()+"/src/json/commits.json");
		List<Map<String, Object>> commitList = new ArrayList<Map<String, Object>>();
		if (!jsonFile.exists()) { // ��GitHubȡ����
			String url = api.getCOMMITS() + "?" + api.getCLIENT_ID_SECRET() + "&" + api.getPER_PAGE() + "100&" + api.getPAGE();
			int total = 0;
			int pages = 1;
			String resp = Http3.get(url + pages,api);
			if (resp == null) { // ���Ƶ��ˣ�Ӧ��ͣһ��Сʱ
				throw new RuntimeException("Take a rest for one hour!");
			}
			/*����ӵĴ��룬�ж������Ƿ����*/
			if(resp.length()==3) {
				int f=Integer.parseInt(resp);
				if(f >=400 && f<=600) {
					return f;
				}
			}
			while (resp != null && resp.startsWith("[")) {
				List<Map<String, Object>> list = JsonUtils.toList(resp);
				System.out.println("ȡ��Commit����" + list.size());
				if (list.size() > 0) {
					total += list.size();
					commitList.addAll(list);
					resp = Http3.get(url + ++pages,api);
				} else {
					break;
				}
			}
			System.out.println("Commit������" + total);
			writeToFile(jsonFile, JsonUtils.toString(commitList));
		} else { // ֱ�Ӷ�ȡ�ļ�
			String json = readFileToString(jsonFile);
			commitList = JsonUtils.toList(json.toString());
		}

		// ץȡCOMMITS
		int commitCount = 1;
		for (Map<String, Object> commitMap : commitList) {
			String sha = getString(commitMap, "sha");
			System.out.println("Commit:" + (commitCount++) + " - " + sha);
			Map<String, Object> authorMap = getMap(commitMap, "author");
			// System.out.println(commit);
			// System.out.println(author);
			if (authorMap == null) {
				authorMap = getMap(commitMap, "commit.author");
				// author = (Map<String, Object>) commit.get("commit");
				// author = (Map<String, Object>) author.get("author");
			}
			String login = getString(authorMap, "login");
			if (login == null) {
				login = getString(authorMap, "name");
			}
			String login_teacher=api.getLOGIN_TEACHER();
			if (login_teacher.equals(login)) {
				continue; // ������ʦ�ύ�Ĵ���
			}
			Stats stats = allData.get(login);
			if (stats == null) { // ����û���ύ����
				stats = new Stats();
				stats.login = login;
				allData.put(login, stats);
				System.out.println("���û���" + login);
			}
			// ȡ��һ��COMMIT������
			//jsonFile = new File(file.getAbsolutePath() + "/src/json/commits/" + sha + ".json");
			
			//jsonFile = new File("E:/eclipseWorkspace/.metadata/allProjUpload/customizableSys/git/src/json/commits/" + sha + ".json");
			jsonFile= new File(rootpath+"/github"+api.getORG()+api.getPROJ()+"/src/json/commits/" + sha + ".json");
			Map<String, Object> oneCommitMap = null;
			if (!jsonFile.exists()) { // �ӷ�����ȡ����
				String url = api.getCOMMITS() + "/" + sha + "?" + api.getCLIENT_ID_SECRET();
				String resp = Http3.get(url,api);
				if (resp == null) { // ���Ƶ��ˣ�Ӧ��ͣһ��Сʱ
					throw new RuntimeException("Take a rest for one hour!");
				}
				/*����ӵĴ��룬�ж������Ƿ����*/
				if(resp.length()==3) {
					int f=Integer.parseInt(resp);
					if(f >=400 && f<=600) {
						return f;
					}
				}
				oneCommitMap = JsonUtils.toMap(resp);
				writeToFile(jsonFile, JsonUtils.toString(oneCommitMap));
			} else { // ֱ�Ӷ�ȡ�ļ�
				String json = readFileToString(jsonFile);
				oneCommitMap = JsonUtils.toMap(json);
			}
			// ����Commit��ͳ������
			Commit commit = new Commit();
			commit.sha = sha;
			commit.time = getString(oneCommitMap, "created_at");
			commit.commentCount = getInt(oneCommitMap, "commit.comment_count");
			if (stats.commits == null) {
				stats.commits = new ArrayList<Commit>();
			}
			stats.commits.add(commit);
			// ������
			if (commit.commentCount > 0) {
				//jsonFile = new File(file, "/src/json/comments/" + sha + ".json");
				//jsonFile = new File("E:/eclipseWorkspace/.metadata/allProjUpload/customizableSys/git/src/json/comments/" + sha + ".json");
				jsonFile= new File(rootpath+"/github"+api.getORG()+api.getPROJ()+"/src/json/comments/" + sha + ".json");
				List<Map<String, Object>> commentsOfCommit = null;
				if (!jsonFile.exists()) {
					String url = (String) oneCommitMap.get("comments_url") + "?" + api.getCLIENT_ID_SECRET();
					String resp = Http3.get(url,api);
					if (resp == null) { // ���Ƶ��ˣ�Ӧ��ͣһ��Сʱ
						throw new RuntimeException("Take a rest for one hour!");
					}
					/*����ӵĴ��룬�ж������Ƿ����*/
					if(resp.length()==3) {
						int f=Integer.parseInt(resp);
						if(f >=400 && f<=600) {
							return f;
						}
					}
					commentsOfCommit = JsonUtils.toList(resp);
					writeToFile(jsonFile, JsonUtils.toString(commentsOfCommit));
				} else { // ֱ�Ӷ�ȡ�ļ�
					String json = readFileToString(jsonFile);
					commentsOfCommit = JsonUtils.toList(json);
				}
			}
			// ƥ���ʺ���ѧ��
			// String homeworkMark = "/androidlabs/homeworks/"; // ��ҵĿ¼
			// String homeworkMark = "labs/"; // ��ҵĿ¼
			String homeworkMark = "/"; // ��ҵĿ¼
			if (stats.number == null) { // ��ѧ��
				List<Map<String, Object>> fileList = (List<Map<String, Object>>) get(oneCommitMap, "files");
				for (Map<String, Object> fileMap : fileList) {
					String filename = getString(fileMap, "filename");
					if ("/".equals(homeworkMark)) { // ֱ���ڸ�Ŀ¼	
						int pos = filename.indexOf(homeworkMark);	
						if (pos > 8) { // ����ѧ��Ŀ¼
							filename = filename.substring(0, pos);
						}
						stats.number = filename;
					} else { // ��ĳһ����Ŀ¼
						// int pos = filename.indexOf("works/");
						int pos = filename.indexOf(homeworkMark);
						if (pos > -1) { // ����ѧ��Ŀ¼
							filename = filename.substring(pos + homeworkMark.length());
							// ��3����ĸ��רҵ���� com-������࣬net-�����
							// String className = filename.substring(0, 3);
							// if ("com".equals(className.toLowerCase()) // �������
							// || "net".equals(className.toLowerCase())) // �����
							// { // com1314080903223/ �� net1314080903223/
							// filename = filename.substring(3);
							pos = filename.indexOf("/");
							if (pos > -1) { // �ҵ�ѧ��
								stats.number = filename.substring(0, pos) //
										// .replace("se", "").replace("Se", "");
										.replace("Net", "").replace("net", "");
								break;
							}
							// }
						}
					}
				}
			}
		}

		// ��ȡPulls
		jsonFile = getJsonFile("pulls",rootpath,api);
		List<Map<String, Object>> pullList = new ArrayList<Map<String, Object>>();
		if (jsonFile == null // ��û���ļ�������δ��ȡ��
				|| !jsonFile.getName().equals("pulls.json")) {
			int total = 0;
			// ����ҳ��
			int pages = 1;
			if (jsonFile != null) { // ҳ�����ļ�����
				// ��ʽΪ��pulls-{δ��ȡҳ��}.json
				String filename = jsonFile.getName();
				String pageStr = filename.replace("pulls-", "");
				pageStr = filename.replace(".json", "");
				pages = NumberUtils.toInt(pageStr, 1);
				// ��ȡԭ������
				String json = readFileToString(jsonFile);
				if (json != null) {
					pullList = JsonUtils.toList(json);
				}
			}
			// ��GitHubȡ����
			String url = api.getPULLS() + "?" + api.getCLIENT_ID_SECRET() + "&" + api.getSTATE_CLOSED() + "&" + api.getPER_PAGE() + "100&" + api.getPAGE();
			String resp = Http3.get(url + pages,api);
			if (resp == null) { // ���Ƶ��ˣ�Ӧ��ͣһ��Сʱ
				throw new RuntimeException("Take a rest for one hour!");
			}
			/*����ӵĴ��룬�ж������Ƿ����*/
			if(resp.length()==3) {
				int f=Integer.parseInt(resp);
				if(f >=400 && f<=600) {
					return f;
				}
			}
			boolean end = false;
			while (resp != null && resp.startsWith("[")) {
				List<Map<String, Object>> list = JsonUtils.toList(resp);
				System.out.println("�ҵ�Pulls��" + list.size());
				if (list.size() > 0) {
					total += list.size();
					pullList.addAll(list);
					resp = Http3.get(url + ++pages,api);
				} else {
					end = true;
					break;
				}
			}
			System.out.println("Pulls������" + total);
			// �޸��ļ���
			String filename = "pulls-" + pages + ".json";
			if (end) {
				filename = "pulls.json";
			}
			//File newFile = new File(file.getAbsolutePath() //
			//		+ "/src/json/" + filename); // ���ļ�
			//File newFile = new File("E:/eclipseWorkspace/.metadata/allProjUpload/customizableSys/git/src/json/" + filename);
			File newFile= new File(rootpath+"/github"+api.getORG()+api.getPROJ()+"/src/json/" + filename);
			if (jsonFile == null) {
				jsonFile = newFile;
			} else if (!filename.equals(jsonFile.getName())) {
				jsonFile.renameTo(newFile);
			}
			if (pullList.size() > 0) {
				writeToFile(jsonFile, JsonUtils.toString(pullList));
			}
		} else { // ֱ�Ӷ�ȡ�ļ�
			String json = readFileToString(jsonFile);
			pullList = JsonUtils.toList(json);
		}
		// ��ȡÿһ��Pull������
		System.out.println(pullList.size());
		for (Map<String, Object> pullMap : pullList) {
			Map<String, Object> onePullMap = null;
			int number = (Integer) pullMap.get("number");
			// ����ļ�
			//jsonFile = new File(file, "/src/json/pulls/" + number + ".json");
			//jsonFile = new File("E:/eclipseWorkspace/.metadata/allProjUpload/customizableSys/git/src/json/pulls/" + number + ".json");
			jsonFile = new File(rootpath+"/github"+api.getORG()+api.getPROJ()+"/src/json/pulls/" + number + ".json");
			if (!jsonFile.exists()) { // �����ڣ���GitHubץȡ
				String url = api.getPULLS() + "/" + number + "?" + api.getCLIENT_ID_SECRET();
				String resp = Http3.get(url,api);
				if (resp == null) { // ���Ƶ��ˣ�Ӧ��ͣһ��Сʱ
					throw new RuntimeException("Take a rest for one hour!");
				}
				/*����ӵĴ��룬�ж������Ƿ����*/
				if(resp.length()==3) {
					int f=Integer.parseInt(resp);
					if(f >=400 && f<=600) {
						return f;
					}
				}
				onePullMap = JsonUtils.toMap(resp);
				writeToFile(jsonFile, JsonUtils.toString(onePullMap));
			} else { // ֱ�Ӷ�ȡ�ļ�
				String json = readFileToString(jsonFile);
				onePullMap = JsonUtils.toMap(json);
			}
			// ��ݱ�ʶ
			Map<String, Object> userMap = getMap(onePullMap, "user");
			String login = (String) userMap.get("login");
			Stats stats = allData.get(login);
			if (stats == null) { // ����û���ύ����
				stats = new Stats();
				stats.login = login;
				allData.put(login, stats);
				System.out.println("���û���" + login);
			}
			// ��¼����
			Pull pull = new Pull();
			pull.number = number;
			pull.time = getString(onePullMap, "created_at");
			pull.commentCount = getInt(onePullMap, "comments");
			pull.commitCount = getInt(onePullMap, "commits");
			if (stats.pulls == null) {
				stats.pulls = new ArrayList<Pull>();
			}
			stats.pulls.add(pull);
			// ȡ��������Ϣ
			if (pull.commentCount > 0) {
				System.out.println("Comments = " + pull.commentCount);
				// �ȼ���ļ�
				//jsonFile = new File(file, "/src/json/comments/" + number + ".json");
				//jsonFile = new File("E:/eclipseWorkspace/.metadata/allProjUpload/customizableSys/git/src/json/comments/" + number + ".json");
				jsonFile = new File(rootpath+"/github"+api.getORG()+api.getPROJ()+"/src/json/comments/" + number + ".json");
				List<Map<String, Object>> commentsOfPull = null;
				if (!jsonFile.exists()) {
					String url = (String) onePullMap.get("comments_url") + "?" + api.getCLIENT_ID_SECRET();
					String resp = Http3.get(url,api);
					if (resp == null) { // ���Ƶ��ˣ�Ӧ��ͣһ��Сʱ
						throw new RuntimeException("Take a rest for one hour!");
					}
					/*����ӵĴ��룬�ж������Ƿ����*/
					if(resp.length()==3) {
						int f=Integer.parseInt(resp);
						if(f >=400 && f<=600) {
							return f;
						}
					}
					commentsOfPull = JsonUtils.toList(resp);
					writeToFile(jsonFile, JsonUtils.toString(commentsOfPull));
				} else { // ֱ�Ӷ�ȡ�ļ�
					String json = readFileToString(jsonFile);
					commentsOfPull = JsonUtils.toList(json);
				}
			}
			// ȡ��Commits��Ϣ
			if (pull.commitCount > 0) {
				// �ȼ���ļ�
				List<Map<String, Object>> list = null;
				//jsonFile = new File(file, "/src/json/pulls/" + number + "_commits.json");
				//jsonFile = new File("E:/eclipseWorkspace/.metadata/allProjUpload/customizableSys/git/src/json/pulls/" + number + "_commits.json");
				jsonFile = new File(rootpath+"/github"+api.getORG()+api.getPROJ()+"/src/json/pulls/" + number + "_commits.json");
				if (!jsonFile.exists()) {
					String url = api.getPULLS() + "/" + number + "/commits" + "?" + api.getCLIENT_ID_SECRET();
					String resp = Http3.get(url,api);
					if (resp == null) { // ���Ƶ��ˣ�Ӧ��ͣһ��Сʱ
						throw new RuntimeException("Take a rest for one hour!");
					}
					/*����ӵĴ��룬�ж������Ƿ����*/
					if(resp.length()==3) {
						int f=Integer.parseInt(resp);
						if(f >=400 && f<=600) {
							return f;
						}
					}
					list = JsonUtils.toList(resp);
					writeToFile(jsonFile, JsonUtils.toString(list));
				} else { // ֱ�Ӷ�ȡ�ļ�
					String json = readFileToString(jsonFile);
					list = JsonUtils.toList(json);
				}
				// ���Commit�Ƿ���ץ����֧���ظ�ץȡ��
				for (Map<String, Object> map2 : list) {
					String sha = (String) map2.get("sha");
					Map<String, Object> commitMap = null;
					//jsonFile = new File(file, "/src/json/commits/" + sha + ".json");
					//jsonFile = new File("E:/eclipseWorkspace/.metadata/allProjUpload/customizableSys/git/src/json/commits/" + sha + ".json");
					jsonFile = new File(rootpath+"/github"+api.getORG()+api.getPROJ()+"/src/json/commits/" + sha + ".json");
					if (!jsonFile.exists()) {
						String url = api.getCOMMITS() + "/" + sha + "?" + api.getCLIENT_ID_SECRET();
						String resp = Http3.get(url,api);
						if (resp == null) { // ���Ƶ��ˣ�Ӧ��ͣһ��Сʱ
							throw new RuntimeException("Take a rest for one hour!");
						}
						/*����ӵĴ��룬�ж������Ƿ����*/
						if(resp.length()==3) {
							int f=Integer.parseInt(resp);
							if(f >=400 && f<=600) {
								return f;
							}
						}
						commitMap = JsonUtils.toMap(resp);
						writeToFile(jsonFile, JsonUtils.toString(commitMap));
					} else { // ֱ�Ӷ�ȡ�ļ�
						String json = readFileToString(jsonFile);
						commitMap = JsonUtils.toMap(json);
					}
				}
			}
		}

		// ȡ��Issue�б�
		jsonFile = getJsonFile("issues",rootpath,api);
		List<Map<String, Object>> issues = new ArrayList<Map<String, Object>>();
		if (jsonFile == null // ��û���ļ�������δ��ȡ��
				|| !jsonFile.getName().equals("issues.json")) {
			int total = 0;
			// ����ҳ��
			int pages = 1;
			if (jsonFile != null) { // ҳ�����ļ�����
				// ��ʽΪ��issues-{δ��ȡҳ��}.json
				String filename = jsonFile.getName();
				String pageStr = filename.replace("issues-", "");
				pageStr = filename.replace(".json", "");
				pages = NumberUtils.toInt(pageStr, 1);
				// ��ȡԭ������
				String json = readFileToString(jsonFile);
				if (json != null) {
					issues = JsonUtils.toList(json);
				}
			}
			// ��GitHubȡ����
			String url = api.getISSUES() + "?" + api.getCLIENT_ID_SECRET() + "&" + api.getPER_PAGE() + "100&" + api.getPAGE();
			String resp = Http3.get(url + pages,api);
			if (resp == null) { // ���Ƶ��ˣ�Ӧ��ͣһ��Сʱ
				throw new RuntimeException("Take a rest for one hour!");
			}
			/*����ӵĴ��룬�ж������Ƿ����*/
			if(resp.length()==3) {
				int f=Integer.parseInt(resp);
				if(f >=400 && f<=600) {
					return f;
				}
			}
			boolean end = false;
			while (resp != null && resp.startsWith("[")) {
				List<Map<String, Object>> list = JsonUtils.toList(resp);
				System.out.println("ȡ��Issues����" + list.size());
				if (list.size() > 0) {
					total += list.size();
					issues.addAll(list);
					resp = Http3.get(url + ++pages,api);
				} else {
					end = true;
					break;
				}
			}
			System.out.println("Issues������" + total);
			// �޸��ļ���
			String filename = "issues-" + pages + ".json";
			if (end) {
				filename = "issues.json";
			}
			//File newFile = new File(file.getAbsolutePath() //
			//		+ "/src/json/" + filename); // ���ļ�
			//File newFile = new File("E:/eclipseWorkspace/.metadata/allProjUpload/customizableSys/git/src/json/" + filename);
			File newFile = new File(rootpath //
					+"/github"+api.getORG()+api.getPROJ()+"/src/json/" + filename);
			if (jsonFile == null) {
				jsonFile = newFile;
			} else if (!filename.equals(jsonFile.getName())) {
				jsonFile.renameTo(newFile);
			}
			if (issues.size() > 0) {
				writeToFile(jsonFile, JsonUtils.toString(issues));
			}
		} else { // ֱ�Ӷ�ȡ�ļ�
			String json = readFileToString(jsonFile);
			issues = JsonUtils.toList(json);
		}
		// ��ȡÿһ��Issue������
		System.out.println("����������⣺" + issues.size());
		for (Map<String, Object> issueMap : issues) {
			Map<String, Object> oneIssueMap = null;
			int number = (Integer) issueMap.get("number");
			// ����ļ�
			//jsonFile = new File(file, "/src/json/issues/" + number + ".json");
			//jsonFile = new File("E:/eclipseWorkspace/.metadata/allProjUpload/customizableSys/git/src/json/issues/" + number + ".json");
			jsonFile = new File(rootpath+ "/github"+api.getORG()+api.getPROJ()+"/src/json/issues/" + number + ".json");
			if (!jsonFile.exists()) { // �����ڣ���GitHubץȡ
				String url = api.getISSUES() + "/" + number + "?" + api.getCLIENT_ID_SECRET();
				String resp = Http3.get(url,api);
				if (resp == null) { // ���Ƶ��ˣ�Ӧ��ͣһ��Сʱ
					throw new RuntimeException("Take a rest for one hour!");
				}
				/*����ӵĴ��룬�ж������Ƿ����*/
				if(resp.length()==3) {
					int f=Integer.parseInt(resp);
					if(f >=400 && f<=600) {
						return f;
					}
				}
				oneIssueMap = JsonUtils.toMap(resp);
				// �ж��ǲ���Issue html_url
				String htmlUrl = (String) oneIssueMap.get("html_url");
				if (htmlUrl.contains("/issues/")) { // ��
					writeToFile(jsonFile, JsonUtils.toString(oneIssueMap));
				}
			} else { // ֱ�Ӷ�ȡ�ļ�
				String json = readFileToString(jsonFile);
				oneIssueMap = JsonUtils.toMap(json);
			}
			// ��¼����ż���Ŀ��˵�� user.login
			String login = getString(oneIssueMap, "user.login");
			Stats stats = allData.get(login); // ͳ����Ϣ
			if (stats == null) { // ����û���ύ����
				stats = new Stats();
				stats.login = login;
				allData.put(login, stats);
				System.out.println("���û���" + login);
			}
			Issue issue = new Issue();
			issue.number = number;
			issue.time = getString(oneIssueMap, "created_at");
			if (stats.issues == null) {
				stats.issues = new ArrayList<Issue>();
			}
			stats.issues.add(issue);
			// ����¼��ļ�
			//File eventsFile = new File(file, "/src/json/issues/" + number + "_events.json");
			//File eventsFile = new File("E:/eclipseWorkspace/.metadata/allProjUpload/customizableSys/git/src/json/issues/" + number + "_events.json");
			File eventsFile = new File(rootpath+"/github"+api.getORG()+api.getPROJ()+"/src/json/issues/" + number + "_events.json");
			List<Map<String, Object>> events = new ArrayList<Map<String, Object>>();
			if (!eventsFile.exists()) { // �ļ������ڣ���ȥGitHub��ѯ
				String url = (String) oneIssueMap.get("events_url");
				String resp = url != null ? Http3.get(url + "?" + api.getCLIENT_ID_SECRET(),api) : null;
				if (resp == null) { // ���Ƶ��ˣ�Ӧ��ͣһ��Сʱ
					throw new RuntimeException("Take a rest for one hour!");
				}
				/*����ӵĴ��룬�ж������Ƿ����*/
				if(resp.length()==3) {
					int f=Integer.parseInt(resp);
					if(f >=400 && f<=600) {
						return f;
					}
				}
				events = JsonUtils.toList(resp);
				writeToFile(eventsFile, JsonUtils.toString(events));
			} else { // ֱ�Ӷ�ȡ�ļ�
				String json = readFileToString(eventsFile);
				events = JsonUtils.toList(json);
			}
			// ��¼�¼��� - ����ҵ���
			issue.eventCount = events.size();
		}

		// ����ץȡ�������ʼ����ͳ������
		String line = "Login,Number,IssueNumber,IssueCount,IssueLabels,Events,FirstTime,Pulls,Commits,Additions,Deletions,ChangedFiles,Comments,ReviewComments";
		StringBuilder sb = new StringBuilder(line + "\n"); // CSV
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		List<String> issueTitleList = new ArrayList<String>();
		for (String login : allData.keySet()) {
			Stats stats = allData.get(login);
			Map<String, Object> stuMap = new HashMap<String, Object>();
			stuMap.put("login", stats.login);
			stuMap.put("number", stats.number);
			result.add(stuMap); // ����ѧ����ͳ�Ƽ�¼
			sb.append(stats.login + ","); // CSV
			sb.append(stats.number + ","); // CSV
			int issueNumber = 0;
			int issueCount = 0;
			String issueTitle = "";
			String issueLabels = "";
			int events = 0;
			String firstTime = "";
			if (stats.issues != null) { // �������
				issueCount = stats.issues.size();
				// �����ж�����⣬
				stuMap.put("issueCount", issueCount);
				// ����ֻȡ����һ����Ϊ�ɼ�
				Map<String, Object> issueMap = new HashMap<String, Object>();
				// ��ȡIssue��Ϣ - ʵ����Ŀ��Ϣ
				for (Issue issue : stats.issues) {
					//jsonFile = new File(file, "/src/json/issues/" + issue.number + ".json");
					//jsonFile = new File("E:/eclipseWorkspace/.metadata/allProjUpload/customizableSys/git/src/json/issues/" + issue.number + ".json");
					jsonFile = new File(rootpath+"/github"+api.getORG()+api.getPROJ()+"/src/json/issues/" + issue.number + ".json");
					String json = readFileToString(jsonFile);
					if (json == null) {
						continue;
					}
					Map<String, Object> map = JsonUtils.toMap(json);
					// ������Ϣ
					String title = getString(map, "title");
					String body = getString(map, "body");
					issueMap.put("title", title);
					issueMap.put("body", body);
					issueMap.put("number", issue.number);
					issueNumber = issue.number;
					issueTitle = title;

					// ��ǩ
					boolean hasFinished = false; // ��������
					List<String> labels = new ArrayList<String>();
					List<Map<String, Object>> list = getList(map, "labels");
					for (Map<String, Object> map2 : list) {
						String name = getString(map2, "name");
						labels.add(name);
						if ("���".equals(name)) {
							hasFinished = true;
						}
						name = name.replace("���", "Done");
						name = name.replace("��", "Com");
						name = name.replace("��", "Net");
						name = name.replace("��", "Late");
						issueLabels += name + " "; // CSV
					}
					issueMap.put("labels", labels);
					// �¼�
					//jsonFile = new File(file, "/src/json/issues/" + issue.number + "_events.json");
					//jsonFile = new File("E:/eclipseWorkspace/.metadata/allProjUpload/customizableSys/git/src/json/issues/" + issue.number + "_events.json");
					jsonFile = new File(rootpath+"/github"+api.getORG()+api.getPROJ()+"/src/json/issues/" + issue.number + "_events.json");
					json = readFileToString(jsonFile);
					list = JsonUtils.toList(json);
					int references = 0;
					List<Map<String, Object>> eventList = new ArrayList<Map<String, Object>>();
					for (Map<String, Object> map2 : list) {
						String name = getString(map2, "event");
						String time = getString(map2, "created_at");
						if ("referenced".equals(name)) {
							references++; // ��¼�ύ�������
							Map<String, Object> eventMap = new HashMap<String, Object>();
							eventMap.put("name", name);
							eventMap.put("time", time);
							eventMap.put("actor", getString(map2, "actor.login"));
							eventList.add(eventMap);
							if (references == 1) {
								firstTime = time; // CSV
							}
						}
					}
					issueMap.put("events", eventList);
					events = references; // CSV
					// ����
					if (hasFinished) {
						break; // ������
					} else if (references > 1) {
						break; // ������
					}
				}
				stuMap.put("issue", issueMap);
			} else { // ��ѧ��û�а�Ҫ�󴴽�����
				stuMap.put("issueCount", 0);
			}
			sb.append(issueNumber + ","); // CSV
			sb.append(issueCount + ","); // CSV
			// sb.append(issueTitle + ","); // CSV
			issueTitleList.add(issueTitle);
			sb.append(issueLabels.trim() + ",");// CSV
			sb.append(events + ","); // CSV
			sb.append(firstTime + ","); // CSV
			// ͳ��Pulls
			if (stats.pulls != null) {
				int pullCount = stats.pulls.size();
				stuMap.put("pullCount", pullCount);
				// ͳ�����
				int totalCommits = 0;
				int totalComments = 0;
				int totalAdditions = 0;
				int totalDeletions = 0;
				int totalChangedFiles = 0;
				int totalReviewComments = 0;
				pullList = new ArrayList<Map<String, Object>>();
				for (Pull pull : stats.pulls) {
					//jsonFile = new File(file, "/src/json/pulls/" + pull.number + ".json");
					//jsonFile = new File("E:/eclipseWorkspace/.metadata/allProjUpload/customizableSys/git/src/json/pulls/" + pull.number + ".json");
					jsonFile = new File(rootpath+"/github"+api.getORG()+api.getPROJ()+"/src/json/pulls/" + pull.number + ".json");
					String json = readFileToString(jsonFile);
					Map<String, Object> map = JsonUtils.toMap(json);
					boolean merged = getBoolean(map, "merged");
					if (merged) { // ֻͳ�ƺϲ���
						Map<String, Object> pullMap = new HashMap<String, Object>();
						String title = getString(map, "title");
						String time = getString(map, "created_at");
						int commentCount = getInt(map, "comments");
						int reviewCommentCount = getInt(map, "review_comments");
						int additionsCount = getInt(map, "additions");
						int deletionsCount = getInt(map, "deletions");
						int commitsCount = getInt(map, "commits");
						int changedFilesCount = getInt(map, "changed_files");
						pullMap.put("number", pull.number);
						pullMap.put("title", title);
						pullMap.put("time", time);
						pullMap.put("commitCount", commitsCount);
						pullMap.put("commentCount", commentCount);
						pullMap.put("additionCount", additionsCount);
						pullMap.put("deletionCount", deletionsCount);
						pullMap.put("changedFileCount", changedFilesCount);
						pullMap.put("reviewCommentCount", reviewCommentCount);
						pullList.add(pullMap);
						totalCommits += commitsCount;
						totalComments += commentCount;
						totalAdditions += additionsCount;
						totalDeletions += deletionsCount;
						totalChangedFiles += changedFilesCount;
						totalReviewComments += reviewCommentCount;
					}
				}
				stuMap.put("pulls", pullList);
				sb.append(pullCount + ","); // CSV
				// ��������
				stuMap.put("commitCount", totalCommits);
				stuMap.put("additionCount", totalAdditions);
				stuMap.put("deletionCount", totalDeletions);
				stuMap.put("changedFileCount", totalChangedFiles);
				stuMap.put("commentCount", totalComments);
				stuMap.put("reviewCommentCount", totalReviewComments);
				sb.append(totalCommits + ","); // CSV
				sb.append(totalAdditions + ","); // CSV
				sb.append(totalDeletions + ","); // CSV
				sb.append(totalChangedFiles + ","); // CSV
				sb.append(totalComments + ","); // CSV
				sb.append(totalReviewComments + "\n"); // CSV
			} else { // ��ѧ��û���ύ������
				stuMap.put("pullCount", 0);
				sb.append("0,0,0,0,0,0,0\n"); // CSV
			}
		}

		// ���������ΪJSON
		//jsonFile = new File(file, "/src/json/result.json");
		//jsonFile = new File("E:/eclipseWorkspace/.metadata/allProjUpload/customizableSys/git/src/json/result.json");
		jsonFile = new File(rootpath+"/github"+api.getORG()+api.getPROJ()+"/src/json/result.json");
		writeToFile(jsonFile, JsonUtils.toString(result));
		//��ӡresult
		//System.out.print(JsonUtils.toString(result));
		//System.out.println();
		
		// ���������ΪCSV
		//File csvFile = new File(file, "/src/json/result.csv");
		//File csvFile = new File("E:/eclipseWorkspace/.metadata/allProjUpload/customizableSys/git/src/json/result.csv");
		File csvFile = new File(rootpath+ "/github"+api.getORG()+api.getPROJ()+"/src/json/result.csv");
		writeToFile(csvFile, sb.toString());
		//��ӡsb
		//System.out.print(sb.toString());
		//System.out.println();
		// ��ӡIssue����
		for (String title : issueTitleList) {
			System.out.println(title);
		}

		// ��ӡͳ���б�
		System.out.println(
				"Login\t\t\t\tNumber\t\t\tIssue\t\tEvents\t\tPulls\t\tCommits\t\tAdditions\tDeletions\tChanged Files\tComments\tReview Comments");
		for (String key : allData.keySet()) {
			Stats stats = allData.get(key);
			String showKey = key;
			// System.out.print(key);
			if (key.contains("1") && key.length() >= 18) {
				showKey = key.length() >= 18 ? key.substring(0, 18) + "... " : key;
				showKey += "\t\t";
			} else if (key.length() >= 20) {
				showKey = key.length() >= 20 ? key.substring(0, 20) + "... " : key;
				showKey += "\t";
			} else if (key.length() >= 8) {
				showKey += "\t\t\t";
			} else {
				showKey += "\t\t\t\t";
			}
			//number
			System.out.print(showKey);
			if (stats.number == null) {
				stats.number = "0000000000000";
			}
			System.out.print(stats.number + "\t\t");
			//Issue  ��  Events
			if (stats.issues != null && stats.issues.size() > 0) {
				System.out.print(stats.issues.get(0).number + "\t\t");
				System.out.print(stats.issues.get(0).eventCount + "\t\t");
			} else {
				System.out.print("0\t\t");
				System.out.print("0\t\t");
			}
			//Pulls
			if (stats.pulls != null && stats.pulls.size() > 0) {
				System.out.print(stats.pulls.size() + "\t\t");
			} else {
				System.out.print("0\t\t");
			}
			//Commits
			if (stats.commits != null && stats.commits.size() > 0) {
				System.out.print(stats.commits.size() + "\t\t");
			} else {
				System.out.print("0\t\t");
			}
			
			System.out.println();
		}
		System.out.println("ѧ��������" + allData.keySet().size());
		//return "true";
		return 0;
	}

	
	private static File getJsonFile(final String prefix,String rootpath,Api api) {
		//File root = new File("./");
		//File dir = new File(root.getAbsolutePath(), "/src/json/");
		File dir = new File(rootpath+"/github"+api.getORG()+api.getPROJ()+ "/src/json/");
		File[] files = dir.listFiles(new FilenameFilter() {
			public boolean accept(File dir, String name) {
				File file = new File(dir, name);
				return file.isFile() && name.startsWith(prefix) && name.endsWith(".json");
			}
		});
		return files != null && files.length > 0 ? files[0] : null;
	}

	private static String readFileToString(File jsonFile) {
		try {
			System.out.println("Read from " + jsonFile.getAbsolutePath());
			BufferedReader reader = new BufferedReader( //
					new FileReader(jsonFile));
			StringBuilder json = new StringBuilder();
			String line = reader.readLine();
			while (line != null) {
				json.append(line + "\n");
				line = reader.readLine();
			}
			reader.close();
			return json.toString();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	private static void writeToFile(File jsonFile, String json) {
		try { // ���Ŀ¼�Ƿ����
			String folderName = jsonFile.getParent();
			File folder = new File(folderName);
			if (!folder.exists()) {
				folder.mkdirs();
			}
			// ���浽�ļ�
			System.out.println("Write to " + jsonFile.getAbsolutePath());
			FileWriter fileWriter = new FileWriter(jsonFile);
			fileWriter.write(json);
			fileWriter.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	private static Map<String, Object> getMap(Map<String, Object> map, String key) {
		return (Map<String, Object>) get(map, key);
	}

	@SuppressWarnings("unchecked")
	private static List<Map<String, Object>> getList(Map<String, Object> map, String key) {
		return (List<Map<String, Object>>) get(map, key);
	}

	private static String getString(Map<String, Object> map, String key) {
		return (String) get(map, key);
	}

	private static int getInt(Map<String, Object> map, String key) {
		return (Integer) get(map, key);
	}

	private static boolean getBoolean(Map<String, Object> map, String key) {
		return (Boolean) get(map, key);
	}

	private static Object get(Map<String, Object> map, String key) {
		if (key.contains(".")) {
			String[] keys = key.split("\\.");
			Map<String, Object> lastMap = map;
			for (int i = 0; i < keys.length - 1; i++) {
				lastMap = getMap(lastMap, keys[i]);
			}
			map = lastMap; // ���һ��Map
			key = keys[keys.length - 1]; // ���һ��Key
		}
		return map == null ? null : map.get(key);
	}
	
}


class Stats {
	String number;
	String login;
	List<Pull> pulls;
	List<Commit> commits;
	List<Issue> issues;
	List<Event> events;
}

class Pull {
	int number;
	String time;
	int commentCount;
	int commitCount;
}

class Comment {
	int number;
	String time;
}

class Commit {
	String sha;
	String time;
	int commentCount;
}

class Issue {
	int number;
	String time;
	int eventCount;
}

class Event {
	String name;
	String actor;
	String time;
}
