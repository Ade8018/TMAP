package me.tm.ad.pack;

import java.io.File;

public class ManifestFileMaker {
	public static final String PERMISSIONS = "\r\n<uses-permission android:name=\"android.permission.INTERNET\" />\r\n<uses-permission android:name=\"android.permission.READ_PHONE_STATE\" />\r\n<uses-permission android:name=\"android.permission.ACCESS_WIFI_STATE\"/>\r\n<uses-permission android:name=\"android.permission.ACCESS_NETWORK_STATE\"/>\r\n";
	public static final String COMPONENTS = "\r\n<service android:name=\"me.lkt.sdk.jz.buss.JzService\" />"
			+ "\r\n<service android:name=\"me.lkt.sdk.dd.DService\" />";
	public static final String APP_STR = "\r\nandroid:name=\"me.lkt.sdk.jz.App\"\r\n";
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

		int appContentIndex = mani.indexOf("<application");
		sub = mani.substring(appContentIndex);
		appContentIndex += sub.indexOf(">");
		sub = mani.substring(appContentIndex + 1);
		mani = mani.substring(0, appContentIndex + 1) + COMPONENTS + sub;

		String app = getAppName(mani);
		if (app == null) {
			int appindex = mani.indexOf("<application") + "<application".length() + 1;
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
}
