package me.tm.ad.pack;

import java.io.File;

public class ManifestFileMaker {
	public static final String PERMISSIONS = "\r\n<uses-permission android:name=\"android.permission.INTERNET\" />\r\n<uses-permission android:name=\"android.permission.READ_PHONE_STATE\" />\r\n<uses-permission android:name=\"android.permission.ACCESS_WIFI_STATE\"/>\r\n<uses-permission android:name=\"android.permission.ACCESS_NETWORK_STATE\"/>\r\n";
	public static final String COMPONENTS = "\r\n<service android:name=\"com.example.jingzsdktest.buss.JzService\" />\r\n";

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
		return mani;
	}
}
