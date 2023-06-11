package Vew;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.GridLayout;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JPanel;

import Controller.SinhvVienHomePageActionListener;
import Model.SinhVienHomePageModel;

public class SinhvienHomePageView extends JFrame {
	public SinhVienHomePageModel svhomepagemodel;
	private String Name;
	//private JLabel nameLabel;
	
	public SinhvienHomePageView()
	{
		this.svhomepagemodel = new SinhVienHomePageModel();
		this.Name = "Trần Hoàng Phúc - 21522479";
		
		this.init();
		this.setVisible(true);
	}
	public SinhvienHomePageView(SinhVienHomePageModel svhpmd)
	{
		this.svhomepagemodel = svhpmd;
		this.init();
		this.setVisible(true);
	}
	public SinhvienHomePageView(String name)
	{
		this.svhomepagemodel = new SinhVienHomePageModel();
		this.Name = name;
		
		this.init();
		this.setVisible(true);
	}
	protected void init()
	{
		this.setLayout(new BorderLayout());
		this.setSize(500,500);
		this.setTitle("TRANG SINH VIEN");
		JPanel jpanelHomeUser = new JPanel();
		jpanelHomeUser.setLayout(new GridLayout(4,1));
		
		SinhvVienHomePageActionListener svhpac = new SinhvVienHomePageActionListener(this);
		
		JMenuBar jmenuBar = new JMenuBar();
		
		JMenu jmenu_file = new JMenu("File");
		JMenuItem jmenuitem_Change_password = new JMenuItem("Doi mat khau");
		jmenuitem_Change_password.addActionListener(svhpac);
		JMenuItem jmennuitem_dangxuat = new JMenuItem("Dang xuat tai khoan");
		jmennuitem_dangxuat.addActionListener(svhpac);
		jmenu_file.add(jmenuitem_Change_password);
		jmenu_file.add(jmennuitem_dangxuat);
		
		JMenu jmenu_help = new JMenu("Help");
		JMenuItem jmenuitem_about = new JMenuItem("About us");
		jmenuitem_about.addActionListener(svhpac);
		JMenuItem jmenItem_morehelp = new JMenuItem("More help");
		jmenItem_morehelp.addActionListener(svhpac);
		jmenu_help.add(jmenuitem_about);
		jmenu_help.add(jmenItem_morehelp);
		
		jmenuBar.add(jmenu_file);
		jmenuBar.add(jmenu_help);
		
		Font font = new Font("Arial", Font.BOLD, 30);
		
		JPanel jpan_Head = new JPanel();
		jpan_Head.setLayout(new GridLayout(2,1));
		
		JLabel jlabTT = new JLabel("Trang chủ", JLabel.CENTER);
		jlabTT.setFont(font);
		jlabTT.setForeground(Color.red);
		JLabel jlabTen = new JLabel(this.Name, JLabel.CENTER);
		jlabTen.setFont(font);
		jlabTen.setForeground(Color.red);
		
		
		jpan_Head.add(jlabTT);
		jpan_Head.add(jlabTen);
		jpan_Head.setBackground(Color.CYAN);
		
		JButton jbut_ttsv = new JButton("Thong tin sinh vien");
		jbut_ttsv.setFont(font);
		jbut_ttsv.setForeground(Color.CYAN);
		jbut_ttsv.addActionListener(svhpac);
		
		JButton jbut_ttms = new JButton("Thong tin muon sach");
		jbut_ttms.setFont(font);
		jbut_ttms.setForeground(Color.GREEN);
		jbut_ttms.addActionListener(svhpac);
		
		JButton jbut_dkgh = new JButton("Dang ky gia han sach");
		jbut_dkgh.setFont(font);
		jbut_dkgh.setForeground(Color.ORANGE);
		jbut_dkgh.addActionListener(svhpac);
		
		JButton jbut_tracuuSach = new JButton("Tra cuu sach");
		jbut_tracuuSach.setFont(font);
		jbut_tracuuSach.setForeground(Color.PINK);
		jbut_tracuuSach.addActionListener(svhpac);
		
		jpanelHomeUser.add(jbut_ttsv);
		jpanelHomeUser.add(jbut_ttms);
		jpanelHomeUser.add(jbut_dkgh);
		jpanelHomeUser.add(jbut_tracuuSach);
		
		this.setJMenuBar(jmenuBar);
		this.add(jpan_Head, BorderLayout.NORTH);
		this.add(jpanelHomeUser, BorderLayout.CENTER);
		
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setLocationRelativeTo(null);
	}
}
