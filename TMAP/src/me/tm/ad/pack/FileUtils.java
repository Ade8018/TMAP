package me.tm.ad.pack;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

public class FileUtils {
	public static String getFileAsStr(File fileSrc) {
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(fileSrc);
			BufferedReader br = new BufferedReader(new InputStreamReader(fis));
			StringBuilder sb = new StringBuilder();
			String line = null;
			while ((line = br.readLine()) != null) {
				sb.append(line + "\r\n");
			}
			br.close();
			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		throw new RuntimeException("获取不到文件" + fileSrc.getName() + "的内容");
	}

	public static void writeStrToFile(String str, File file) {
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream(file);
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(fos));
			bw.write(str);
			bw.flush();
			bw.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fos != null) {
				try {
					fos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * 拷贝文件夹scr内所有内容到dst目录下,不包括scr文件夹本身
	 * 
	 * @param scr
	 * @param dst
	 * @return 返回null或者错误信息
	 */
	public static String copyHoleDirInto(File scr, File dst) {
		String scrPath = scr.getAbsolutePath();
		String dstPath = dst.getAbsolutePath();
		try {
			Process p = Runtime.getRuntime().exec(String.format("xcopy %s %s /e", scrPath, dstPath));
			StringBuilder sb = new StringBuilder();
			byte[] buf = new byte[512];
			int len = -1;
			while ((len = p.getErrorStream().read(buf)) >= 0) {
				sb.append(new String(buf, 0, len));
			}
			p.destroy();
			if (sb.toString().length() > 0) {
				return sb.toString();
			}
		} catch (IOException e) {
			e.printStackTrace();
			return e.getMessage();
		}
		return null;
	}
}
