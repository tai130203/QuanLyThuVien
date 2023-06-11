package Vew;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.GridLayout;
import java.util.ArrayList;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.plaf.basic.DefaultMenuLayout;

import Controller.LoginActionListener;
import Controller.SinhvVienHomePageActionListener;
import DataAccessObject.ThanhvienDAO;
import Model.ThanhVienModel;
import Model.ThongTInSinhVienModel;

public class ThongTinSinhVienView extends JFrame {
	private ThongTInSinhVienModel ttSinhVienModel;
	private ThanhVienModel thanhvienmodel;
	protected JPanel jpanImage;
	protected JPanel jpanThongTin;
	
	public ThongTinSinhVienView()
	{
		//this.ttSinhVienModel = new ThongTInSinhVienModel();
		
		this.init();
		this.setVisible(true);
	}
	public ThongTinSinhVienView(String username)
	{
		try {
			ArrayList<ThanhVienModel> listThanhvien = ThanhvienDAO.getINstance().selectAll();
			for(ThanhVienModel i:listThanhvien)
			{
				if (i.getMatv().equals(username))
				{
					this.thanhvienmodel = i;
				}
			}
			this.init();
			this.setVisible(true);
			
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	public void init() {
		this.setTitle("Thong Tin Ca Nhan");
		this.setLayout(new GridLayout(1,2));
		this.setSize(900,500);
		
		JMenuBar jmenubar = new JMenuBar();
		JMenu jmenHelp = new JMenu("Help");
		JMenuItem jmenuIteamTrangChu = new JMenuItem("Trang chu");
		jmenHelp.add(jmenuIteamTrangChu);
		jmenubar.add(jmenHelp);
		this.jpanImage = new JPanel();
		this.jpanImage.setLayout(new BorderLayout());
		
		JLabel jlabImage = new JLabel("IMAGE", JLabel.CENTER);
		jpanImage.add(jlabImage, BorderLayout.CENTER);
		
		Font font = new Font("Arial", Font.BOLD, 25);
		
		this.jpanThongTin = new JPanel();
		this.jpanThongTin.setLayout(new BorderLayout());
		JTextArea jtexThongTin = new JTextArea("Mã thành viên: " + thanhvienmodel.getMatv() +
											   "\nTên thành viên: " + thanhvienmodel.getTentv() +
											   "\nNgay Sinh: " + thanhvienmodel.getNgaysinh() + 
											   "\nDia chi: " + thanhvienmodel.getDiachi()+
											   "\nSo dien thoai: " +thanhvienmodel.getSodt()+ 
											   "\nEmail: " + thanhvienmodel.getEmail()+
											   "\nNgay đăng ký: " + thanhvienmodel.getNgayDKTV()+
											   "\nTruong: " + thanhvienmodel.getMadv());
		jtexThongTin.setEditable(false);
		jtexThongTin.setForeground(Color.blue);
		jtexThongTin.setFont(font);
		jpanThongTin.add(jtexThongTin, BorderLayout.CENTER);
		
		JButton jbut_CapNhatTT = new JButton("Cap nhat");// chi co nhan vien hoac quna li co quyen nay
		JButton jbut_XoaTT = new JButton("Xoa thong tin"); // chi co nhan vien hoac quna li co quyen nay
		
		JPanel jpan_luachonTXS = new JPanel();
		jpan_luachonTXS.setLayout(new FlowLayout());
		jpan_luachonTXS.add(jbut_CapNhatTT);
		jpan_luachonTXS.add(jbut_XoaTT);
		jpanThongTin.add(jpan_luachonTXS, BorderLayout.SOUTH);
		
		this.setJMenuBar(jmenubar);
		this.add(jpanImage);
		this.add(jpanThongTin);
		
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setLocationRelativeTo(null);
	}
}
