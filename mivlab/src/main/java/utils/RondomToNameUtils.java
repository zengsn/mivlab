package utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class RondomToNameUtils {
	/**
	 * ��������ļ�������ǰ������ʱ����+��λ�����
	 * 
	 * @return
	 */
	public static String getRandomFileName() {
 
		SimpleDateFormat simpleDateFormat;
 
		simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
 
		Date date = new Date();
 
		String str = simpleDateFormat.format(date);
 
		Random random = new Random();
 
		int rannum = (int) (random.nextDouble() * (99999 - 10000 + 1)) + 10000;// ��ȡ5λ�����
 
		return rannum + str;// ��ǰʱ��
	}

}
