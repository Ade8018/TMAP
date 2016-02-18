package me.tm.ad.pack;

import java.awt.BorderLayout;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.File;
import java.io.FileFilter;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFileChooser;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.border.EmptyBorder;

import me.tm.ad.pack.ApkUtil.OnApkProcessListener;

public class PackDlg extends JDialog {
	private static final long serialVersionUID = 1L;
	private final JPanel contentPanel = new JPanel();
	private JTextField tf_appid;
	private JTextField tf_apkdir;
	private String selectedDir = "E:\\apk";
	private JButton btnNewButton;
	private JTextArea textArea;
	private StringBuilder sb = new StringBuilder();

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		try {
			PackDlg dialog = new PackDlg();
			dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
			dialog.setVisible(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Create the dialog.
	 */
	public PackDlg() {
		setBounds(100, 100, 299, 365);
		getContentPane().setLayout(new BorderLayout());
		contentPanel.setToolTipText("");
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		contentPanel.setLayout(null);

		JLabel lblNewLabel = new JLabel("APP ID:");
		lblNewLabel.setBounds(21, 57, 49, 15);
		contentPanel.add(lblNewLabel);

		tf_appid = new JTextField();
		tf_appid.setBounds(77, 54, 194, 21);
		contentPanel.add(tf_appid);
		tf_appid.setColumns(1);

		JLabel lblApk = new JLabel("APK目录:");
		lblApk.setBounds(21, 32, 54, 15);
		contentPanel.add(lblApk);

		tf_apkdir = new JTextField();
		tf_apkdir.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				JFileChooser chooser = new JFileChooser();
				chooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);// 设置只能选择目录
				if (selectedDir.length() > 0) {
					chooser.setSelectedFile(new File(selectedDir));
				}
				int returnVal = chooser.showOpenDialog(PackDlg.this);
				if (returnVal == JFileChooser.APPROVE_OPTION) {
					selectedDir = chooser.getSelectedFile().getPath();
					chooser.hide();
					tf_apkdir.setText(selectedDir);
				}
			}
		});
		if (selectedDir.length() > 0) {
			tf_apkdir.setText(selectedDir);
		} else {
			tf_apkdir.setText("点击选择");
		}
		tf_apkdir.setEditable(false);
		tf_apkdir.setBounds(77, 29, 194, 21);
		contentPanel.add(tf_apkdir);
		tf_apkdir.setColumns(1);

		btnNewButton = new JButton("开始加入sdk");
		btnNewButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				btnNewButton.setEnabled(false);
				sb = new StringBuilder();
				textArea.setText(sb.toString());
				File dir = new File(selectedDir);
				File[] files = dir.listFiles(new FileFilter() {
					@Override
					public boolean accept(File pathname) {
						return pathname.isFile() && pathname.getName().endsWith(".apk");
					}
				});
				if (files.length == 0) {
					btnNewButton.setEnabled(true);
					JOptionPane.showMessageDialog(null, "没有要处理的文件!");
					return;
				}
				for (int i = 0; i < files.length; i++) {
					ApkUtil.onApkFile(files[i], new OnApkProcessListener() {
						@Override
						public void onResult(File file, int type, boolean result, String error) {
							switch (type) {
							case OnApkProcessListener.TYPE_START:
								String name = file.getName();
								sb.append("开始处理文件" + name).append("\n");
								break;
							case OnApkProcessListener.TYPE_UNPACK:
								if (result) {
									sb.append("解包成功。").append("\n");
								} else {
									sb.append(String.format("解包失败，原因如下：\n%s即将处理下一个文件。", error)).append("\n");
								}
								break;
							case OnApkProcessListener.TYPE_INSERT:
								sb.append("植入sdk成功。").append("\n");
								break;
							case OnApkProcessListener.TYPE_PACK:
								sb.append("打包成功。").append("\n");
								break;
							case OnApkProcessListener.TYPE_SIGN:
								sb.append("签名成功，即将执行下一个文件。").append("\n");
								break;
							}
							textArea.setText(sb.toString());
						}
					});
				}
				sb.append("所有文件已处理完毕。").append("\n");
				textArea.setText(sb.toString());
				btnNewButton.setEnabled(true);
			}
		});
		btnNewButton.setBounds(77, 298, 138, 23);
		contentPanel.add(btnNewButton);

		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(21, 82, 250, 196);
		contentPanel.add(scrollPane);

		textArea = new JTextArea();
		scrollPane.setViewportView(textArea);
		textArea.setEditable(false);
	}
}
