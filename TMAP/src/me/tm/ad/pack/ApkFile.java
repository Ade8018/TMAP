package me.tm.ad.pack;

import java.io.File;
import java.io.IOException;

public class ApkFile {
	private String absoluteFilePath;
	private String absoluteDirPath;
	private String fileName;
	private String error;

	public ApkFile(File file) {
		absoluteFilePath = file.getAbsolutePath();
		absoluteDirPath = absoluteFilePath.substring(0, absoluteFilePath.lastIndexOf('\\'));
		fileName = file.getName().substring(0, file.getName().lastIndexOf('.'));
	}

	public boolean unpack() {
		StringBuilder sb = new StringBuilder();
		try {
			Process process = Runtime.getRuntime().exec(String.format("java -jar apktool.jar d -f %s -o %s",
					absoluteFilePath, absoluteDirPath + "\\" + fileName));
			byte[] buf = new byte[512];
			int len = -1;
			while ((len = process.getErrorStream().read(buf)) >= 0) {
				sb.append(new String(buf, 0, len));
			}
			process.destroy();
		} catch (IOException e) {
			e.printStackTrace();
		}
		error = sb.toString();
		if (error.length() > 0)
			return false;
		return determindIfSmaliDirExists();
	}

	private boolean determindIfSmaliDirExists() {
		File smali = new File(absoluteDirPath + "\\" + fileName + "\\smali");
		boolean result = smali.exists();
		if (!result)
			error = "smali文件夹不存在";
		return result;
	}

	public boolean insertCode() {
		return false;
	}

	public boolean pack() {
		StringBuilder sb = new StringBuilder();
		try {
			Process process = Runtime.getRuntime()
					.exec(String.format("java -jar apktool.jar b %s", absoluteDirPath + "\\" + fileName));
			byte[] buf = new byte[512];
			int len = -1;
			while ((len = process.getErrorStream().read(buf)) >= 0) {
				sb.append(new String(buf, 0, len));
			}
			process.destroy();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sb.toString().length() == 0;
	}

	public boolean sign() {
		return false;
	}

	public String getError() {
		return error;
	}
}
