package me.tm.ad.pack;

import java.io.File;

public class ApkUtil {
	public interface OnApkProcessListener {
		int TYPE_START = -1;
		int TYPE_UNPACK = 0;
		int TYPE_INSERT = 1;
		int TYPE_PACK = 2;
		int TYPE_SIGN = 3;

		void onResult(File file, int type, boolean result, String error);
	}

	public static void onApkFile(File file, OnApkProcessListener lis) {
		ApkFile apk = new ApkFile(file);
		lis.onResult(file, OnApkProcessListener.TYPE_START, true, apk.getError());
		boolean result = apk.unpack();
		lis.onResult(file, OnApkProcessListener.TYPE_UNPACK, result, apk.getError());
		if (result) {
			lis.onResult(file, OnApkProcessListener.TYPE_INSERT, apk.insertCode(), apk.getError());
			lis.onResult(file, OnApkProcessListener.TYPE_PACK, apk.pack(), apk.getError());
			lis.onResult(file, OnApkProcessListener.TYPE_SIGN, apk.sign(), apk.getError());
		}
	}
}
