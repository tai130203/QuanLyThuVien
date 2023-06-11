package Vew;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.GridLayout;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JPanel;
import javax.swing.JTextArea;

import Controller.QuanLiHomePageActionListener;
import DataAccessObject.NhanvienDAO;
import Model.NhanVienModel;
import Model.QuanliHomePageModel;

public class QuanliHomePageView extends JFrame{
	private QuanliHomePageModel qlhpmd;
	public NhanVienModel qlmodel;
	public QuanliHomePageView()
	{
		this.init();
		this.setVisible(true);
	}
	public QuanliHomePageView(String maql )
	{
		this.qlmodel = new NhanVienModel();
		this.qlmodel = NhanvienDAO.getInstance().LayThongTin(maql);
		this.init();
		this.setVisible(true);
	}
	private void init()
	{
		this.setLayout(new BorderLayout());
		this.setTitle("TRANG QUAN LY");
		this.setSize(900,600);
		
		QuanLiHomePageActionListener qlhpac = new QuanLiHomePageActionListener(this);

		JMenuBar jmenuBar = new JMenuBar();
		
		JMenu jmenu_file = new JMenu("File");
		JMenuItem jmenuitem_Change_password = new JMenuItem("Doi mat khau");
		jmenuitem_Change_password.addActionListener(qlhpac);
		JMenuItem jmennuitem_dangxuat = new JMenuItem("Dang xuat tai khoan");
		jmennuitem_dangxuat.addActionListener(qlhpac);
		jmenu_file.add(jmenuitem_Change_password);
		jmenu_file.add(jmennuitem_dangxuat);
		
		JMenu jmenu_help = new JMenu("Help");
		JMenuItem jmenuitem_about = new JMenuItem("About us");
		jmenuitem_about.addActionListener(qlhpac);
		JMenuItem jmenItem_morehelp = new JMenuItem("More help");
		jmenItem_morehelp.addActionListener(qlhpac);
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
		
		JLabel jlabTen = new JLabel(this.qlmodel.getTenNV(), JLabel.CENTER);
		jlabTen.setFont(font);
		jlabTen.setForeground(Color.red);
		
		jpan_Head.add(jlabTT);
		jpan_Head.add(jlabTen);
		jpan_Head.setBackground(Color.CYAN);
		
		JPanel jpan_Center = new JPanel();
		jpan_Center.setLayout(new GridLayout(2,1));
		
		JPanel jpanThongTin = new JPanel();
		jpanThongTin.setLayout(new BorderLayout());
		JPanel jpanQL = new JPanel();
		jpanQL.setLayout(new GridLayout(2,1));
		
		JTextArea jtexThongTin = new JTextArea("Tên: " + this.qlmodel.getTenNV() +
				   "\nMã nhân viên:  " + this.qlmodel.getMaNV() +
				   "\nUser name: " + this.qlmodel.getUsername()+
				   "\nNgày Sinh: " + this.qlmodel.getNgaySinh() + 
				   "\nNgày vào làm: " + this.qlmodel.getNgayVaoLam()+
				   "\nĐịa chỉ: " + this.qlmodel.getDiachi()+
				   "\nSố điện thoại: 0" + this.qlmodel.getSodt() +
				   "\nCăn cước công dân: " + this.qlmodel.getCccd()+
				   "\nEmail: " + this.qlmodel.getTenNV());
		jtexThongTin.setFont(new Font("Arial", Font.BOLD, 25));
		//jtexThongTin.setBackground(new Color(0, 128, 192));
		jtexThongTin.setForeground(new Color(197, 150, 122));
		
		jpanThongTin.add(jtexThongTin, BorderLayout.CENTER);
				
		JButton jbutQLSACH = new JButton("Quản lý sách");
		jbutQLSACH.setFont(font);
		jbutQLSACH.addActionListener(qlhpac);
		JButton jbutQLNhanVien = new JButton("Quản lý nhân viên");
		jbutQLNhanVien.addActionListener(qlhpac);
		jbutQLNhanVien.setFont(font);
		jpanQL.add(jbutQLNhanVien);
		jpanQL.add(jbutQLSACH);
				
		jpan_Center.add(jpanThongTin);
		jpan_Center.add(jpanQL);
		this.setJMenuBar(jmenuBar);
		
		this.add(jpan_Head, BorderLayout.NORTH);
		this.add(jpan_Center, BorderLayout.CENTER);
		this.setLocationRelativeTo(null);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	public void chucnangDOiMK()
	{
		new DoiMatKhauView(this.qlmodel);
		this.dispose();
	}
}
