package me.tm.ad.pack;

import java.io.File;
import java.util.Random;

public class ManifestFileMaker {
	public static String PACKAGE_NAME = "aaaaaa";
	public static String DEST_PN = "";
	// public static String SERVICE_NAME = "MyService";

	public static final String PERMISSIONS = "\r\n<uses-permission android:name=\"android.permission.INTERNET\" />"
			+ "\r\n<uses-permission android:name=\"android.permission.READ_PHONE_STATE\" />"
			+ "\r\n<uses-permission android:name=\"android.permission.ACCESS_WIFI_STATE\"/>"
			+ "\r\n<uses-permission android:name=\"android.permission.ACCESS_NETWORK_STATE\"/>\r\n";
	// public static final String COMPONENTS = "\r\n<service android:name=\"" +
	// PN_FIRST + "." + PN_SECOND + "."
	// + SERVICE_NAME + "\" />\r\n";
//	public static final String APP_STR = "\r\nandroid:name=\"" + DEST_PN + ".App\"\r\n";
	public static String app_name;

	/**
	 * 在AndroidManifest.xml加入必要的信息
	 * 
	 * @param mani
	 *            AndroidManifest.xml文件
	 * @return 操作成功返回true，否则返回false
	 */
	public static boolean make(File mani) {
		String str = FileUtils.getFileAsStr(mani);
		if (str == null || str.length() < 1) {
			return false;
		}
		try {
			str = appendInfosToManifestStr(str);
			String path = mani.getAbsolutePath();
			path = path.substring(0, path.lastIndexOf('\\') + 1);
			File out = new File(path + "\\AndroidManifest_out.xml");
			FileUtils.writeStrToFile(str, out);
			mani.delete();
			out.renameTo(mani);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	private static String appendInfosToManifestStr(String mani) {
		int manifestContentIndex = mani.indexOf("<manifest");
		String sub = mani.substring(manifestContentIndex);
		manifestContentIndex += sub.indexOf(">");
		sub = mani.substring(manifestContentIndex + 1);
		mani = mani.substring(0, manifestContentIndex + 1) + PERMISSIONS + sub;

		// int appContentIndex = mani.indexOf("<application");
		// sub = mani.substring(appContentIndex);
		// appContentIndex += sub.indexOf(">");
		// sub = mani.substring(appContentIndex + 1);
		// mani = mani.substring(0, appContentIndex + 1) + COMPONENTS + sub;

		String app = getAppName(mani);
		if (app == null) {
			int appindex = mani.indexOf("<application") + "<application".length() + 1;
			String APP_STR = "\r\nandroid:name=\"" + DEST_PN + ".App\"\r\n";
			mani = mani.substring(0, appindex) + APP_STR + mani.substring(appindex);
		}
		return mani;
	}

	private static String getAppName(String mani) {
		String appHead = mani.substring(mani.indexOf("<application"));
		appHead = appHead.substring(0, appHead.indexOf(">"));
		if (!appHead.contains("android:name")) {
			return null;
		}
		String name = appHead.substring(appHead.indexOf("android:name"));
		name = name.substring(name.indexOf("\"") + 1);
		name = name.substring(0, name.indexOf("\""));
		app_name = name;
		return name;
	}

	public static Random sRandom = new Random();
	public static void genNewDestPn() {//生成随机的新包名
		char basec = 'a';
		int pnlen = sRandom.nextInt(4) + 3;// 包名长度3-6
		String pn = "";
		for (int i = 0; i < pnlen; i++) {
			pn+= (char)(basec+sRandom.nextInt(25));
		}
		DEST_PN = pn;
	}
}
