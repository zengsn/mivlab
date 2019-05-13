package gitrepostats;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import bean.Api;
import utils.JsonUtils;
public class TestStringFilename {
	//用于测试：提取filename中的学号
	/*
	public static  void testpa(){
        String line = "AndroidLabs/app/src/main/java/edu/hzuapps/androidlabs/homeworks/com1/Net1414080903124/Net1414080903124Activity.java"  ;
        String [] arr = line.split("\\/");
        for(String ss : arr){
            
            String regEx="[^0-9]";	//正则表达式,去掉文件前缀，只留下数字、也就是学号
			Pattern p= Pattern.compile(regEx);
			Matcher m=p.matcher(ss);
			String sno=m.replaceAll("").trim();
			if(sno.length()>8) {
				System.out.println(sno);
				break;
			}
			
        }
    }*/
	//测试：获取label中的所有名称
	public static void main()
	  {
		String path="E:/eclipseWorkspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/mivlab2-1/github/hzuapps/android-labs/src/json/pulls/741.json";
		File jsonFile = new File(path);
		//jsonFile = new File(rootpath+"/github"+api.getORG()+api.getPROJ()+"/src/json/pulls/" + pull.number + ".json");
		String json = readFileToString(jsonFile);

		Map<String, Object> map = JsonUtils.toMap(json);
		List<Map<String, Object>> lablelist = getList(map, "labels");
		//判断是否有标志label
		int good=0,done=0;
		if(!"[]".equals(lablelist)) {
			for (Map<String, Object> map2 : lablelist) {
				String name = getString(map2, "name");
				if("Good".equals(name)) {
					good++;
				}
				if("完成".equals(name)) {
					done++;
				}
			}
		}
		System.out.println(done);
		System.out.println(good);
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
		try { // 检查目录是否存在
			String folderName = jsonFile.getParent();
			File folder = new File(folderName);
			if (!folder.exists()) {
				folder.mkdirs();
			}
			// 保存到文件
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
			map = lastMap; // 最后一层Map
			key = keys[keys.length - 1]; // 最后一个Key
		}
		return map == null ? null : map.get(key);
	}
	
}
