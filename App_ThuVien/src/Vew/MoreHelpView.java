package Vew;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;

import javax.swing.JFrame;
import javax.swing.JTextArea;

public class MoreHelpView extends JFrame {
	public MoreHelpView()
	{
		this.init();
		this.setVisible(true);
	}
	private void init()
	{
		this.setLayout(new BorderLayout());
		this.setSize(700, 450);
		this.setTitle("MORE HELP");
		
		JTextArea jtexHelp = new JTextArea("Website THU VIEN"
				+ "\r\n" + "\nThu vien trung tam: vnulib.edu.vn"
				+ "\r\n" + "\nThu vien Dai hoc bach khoa: lib.hcmut.edu.vn"
				+ "\r\n" + "\nThu vien Dai hoc khoa hoc tu nhien: glib.hcmus.edu.vn"
				+ "\r\n" + "\nThu vien Dai hoc Quoc te: hcmiu.edu.vn"
				+ "\r\n" + "\nThu vien Dai hoc khoa hoc xa hoi va nhan van: elib.hcmussh.edu.vn"
				+ "\r\n" + "\nThu vien Dai hoc Cong nghe Thong tin: thuvien.uit.edu.vn"
				+ "\r\n" + "\nThu vien Dai hoc kinh te luat: lib.uel.edu.vn");
		jtexHelp.setEditable(false);
		jtexHelp.setForeground(Color.blue);
		jtexHelp.setFont(new Font("Arial", Font.BOLD, 20));
		jtexHelp.setBackground(new Color(210, 230, 153));
		
		this.add(jtexHelp, BorderLayout.CENTER);
		this.setForeground(Color.blue);
		
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setLocationRelativeTo(null);
	}
}
