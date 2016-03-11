package me.tm.ad.pack;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.nio.channels.FileChannel;
import java.util.Random;

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

	public static boolean modifyAppFile(File file) {
		try {
			String str = getFileAsStr(file);
			int index = str.indexOf(".method public onCreate()V");
			if (index > 0) {
				String sub = str.substring(index);
				index += sub.indexOf(".prologue") + ".prologue".length() + 1;
				String INIT_STATEMENT = "\r\n invoke-static {p0}, L" + ManifestFileMaker.DEST_PN
						+ "/App;->init(Landroid/content/Context;)V";
				str = str.substring(0, index) + INIT_STATEMENT + str.substring(index);
			} else {
				String ONCREATE_METHOD = "\r\n# virtual methods" + "\r\n.method public onCreate()V" + "\r\n.locals 0"
						+ "\r\n.prologue" + "\r\n invoke-super {p0}, Landroid/app/Application;->onCreate()V"
						+ "\r\n invoke-static {p0}, L" + ManifestFileMaker.DEST_PN
						+ "/App;->init(Landroid/content/Context;)V" + "\r\n  return-void" + "\r\n.end method";
				str += ONCREATE_METHOD;
			}
			writeStrToFile(str, file);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	// 01hbPe10
	public static boolean modifyAppId(File file, String appid) {
		try {
			String fileStr = getFileAsStr(file);
			if (fileStr == null || fileStr.length() == 0) {
				return false;
			}
			fileStr = fileStr.replace("01hbPe10", appid);
			writeStrToFile(fileStr, file);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public static void copy(String source, String dest) {
		if (source == null || dest == null) {
			throw new NullPointerException();
		}
		File sourceFile = new File(source);
		if (!sourceFile.exists()) {
			throw new RuntimeException("源文件不存在");
		}
		makeDestFileDir(dest);
		channelCopy(sourceFile, new File(dest));
	}

	private static void makeDestFileDir(String dest) {
		File destDir = new File(dest.substring(0, dest.lastIndexOf("\\")));
		if (!destDir.exists()) {
			destDir.mkdirs();
		} else {
			if (!destDir.isDirectory())
				throw new RuntimeException("请输入正确的目的文件路径");
		}
	}

	private static void channelCopy(File s, File t) {
		FileInputStream fi = null;
		FileOutputStream fo = null;
		FileChannel in = null;
		FileChannel out = null;
		try {
			fi = new FileInputStream(s);
			fo = new FileOutputStream(t);
			in = fi.getChannel();// 得到对应的文件通道
			out = fo.getChannel();// 得到对应的文件通道
			in.transferTo(0, in.size(), out);// 连接两个通道，并且从in通道读取，然后写入out通道
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fi.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			try {
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			try {
				fo.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			try {
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public static String modifyPackageName(String filePath, String srcPn, String dstPn) {
		try {
			File file = new File(filePath);
			String fileStr = getFileAsStr(file);
			if (fileStr == null || fileStr.length() == 0) {
				return "获取不到App文件的内容";
			}
			fileStr = fileStr.replace(srcPn, dstPn);
			writeStrToFile(fileStr, file);
		} catch (Exception e) {
			return "" + e.getMessage();
		}
		return null;
	}

	public static Random sRandom = new Random();

	public static String modifyConstant(String filePath, String encodeInt, String... params) {
		try {
			File file = new File(filePath);
			String fileStr = getFileAsStr(file);
			if (fileStr == null || fileStr.length() == 0) {
				return "获取不到App文件的内容";
			}
			int newInt = sRandom.nextInt(127) + 1;
			fileStr = fileStr.replace(encodeInt, String.valueOf(newInt));
			for (int i = 0; i < params.length; i++) {
				byte buf[] = params[i].getBytes();
				for (int j = 0; j < buf.length; j++) {
					buf[j] ^= newInt;
				}
				String result = new String(buf);
				result.replace("\\", "\\\\");
				fileStr = fileStr.replace("\"" + params[i] + "\"", "\"" + result + "\"");
			}
			writeStrToFile(fileStr, file);
		} catch (Exception e) {
			return "" + e.getMessage();
		}
		return null;
	}

}
