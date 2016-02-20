package me.tm.ad.pack;

import java.io.File;
import java.io.IOException;

public class ApkFile {
	private String absoluteFilePath;
	private String absoluteDirPath;
	private String fileName;
	private String error;
	private String appid;

	public ApkFile(File file, String appid) {
		this.appid = appid;
		absoluteFilePath = file.getAbsolutePath();
		absoluteDirPath = absoluteFilePath.substring(0, absoluteFilePath.lastIndexOf('\\'));
		fileName = file.getName().substring(0, file.getName().lastIndexOf('.'));
	}

	/**
	 * 反编译apk
	 * 
	 * @return 如果接收到apktool返回的异常或者反编译后smali文件夹不存在，则返回false。否则返回true
	 */
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
		if (!ManifestFileMaker.make(new File(absoluteDirPath + "\\" + fileName + "\\AndroidManifest.xml"))) {
			error = "修改AndroidManifest文件失败";
			return false;
		}
		// copy smali文件
		error = FileUtils.copyHoleDirInto(new File("ad"), new File(absoluteDirPath + "\\" + fileName + "\\smali"));
		if (error != null) {
			return false;
		}
		error = FileUtils.copyHoleDirInto(new File("assets"), new File(absoluteDirPath + "\\" + fileName + "\\assets"));
		if (error != null) {
			return false;
		}
		// 如果有需要，则修改application文件
		if (ManifestFileMaker.app_name != null) {
			if (!FileUtils.modifyAppFile(new File(absoluteDirPath + "\\" + fileName + "\\smali\\"
					+ ManifestFileMaker.app_name.replace(".", "\\") + ".smali"))) {
				error = "修改application文件失败";
				return false;
			}
			ManifestFileMaker.app_name = null;
		}
		// 修改app id
		if (!FileUtils.modifyAppId(
				new File(absoluteDirPath + "\\" + fileName + "\\smali\\me\\lkt\\sdk\\jz\\buss\\AdHelper.smali"),
				appid)) {
			error = "修改app id失败";
			return false;
		}
		return true;
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
