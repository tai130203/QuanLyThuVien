package Vew;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.GridLayout;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTextArea;

import Model.NhanVienHomePageModel;
import Model.QuanliHomePageModel;
import Model.SinhVienHomePageModel;
import Model.ThongTInSinhVienModel;

public class ThongTinView extends JFrame {
	private ThongTInSinhVienModel ttSinhVienModel;
	private SinhvienHomePageView svhpview;
	private NhanVienHomePageView nvhpview;
	private QuanliHomePageView qlhpview;
	protected JPanel jpanImage;
	protected JPanel jpanThongTin;
	
	public ThongTinView()
	{
		this.ttSinhVienModel = new ThongTInSinhVienModel();
		
		this.init();
		this.setVisible(true);
	}
	public ThongTinView(String username)
	{
		this.ttSinhVienModel = new ThongTInSinhVienModel(username);
		
		this.init();
		this.setVisible(true);
	}
	public ThongTinView(SinhVienHomePageModel svhp)
	{
		this.svhpview = new SinhvienHomePageView(svhp);
		
		this.init();
		this.setVisible(true);
	}

	public void init() {
		this.setTitle("Thong Tin Ca Nhan");
		this.setLayout(new GridLayout(1,2));
		this.setSize(700,400);
		
		this.jpanImage = new JPanel();
		this.jpanImage.setLayout(new BorderLayout());
		
		JButton jbut_image = new JButton("IMAGE");
		
		Font font = new Font("Arial", Font.BOLD, 25);
		
		this.jpanThongTin = new JPanel();
		this.jpanThongTin.setLayout(new BorderLayout());
		JTextArea jtexThongTin = new JTextArea("Ten: " + ttSinhVienModel.getName() +
											   "\nMa so:  " + ttSinhVienModel.getMssv() +
											   "\nTen username: " + ttSinhVienModel.getTenUserName() +
											   "\nNgay Sinh: " + ttSinhVienModel.getNgaySinh() + 
											   "\nDia chi: " +
											   "\nSo dien thoai" + 
											   "\nTruong: " + ttSinhVienModel.getTruong());
		jtexThongTin.setEditable(false);
		jtexThongTin.setForeground(Color.blue);
		jtexThongTin.setFont(font);
		jpanThongTin.add(jtexThongTin, BorderLayout.CENTER);
		
		JButton jbut_DoiMK = new JButton("Doi mat khau");
		JButton jbut_CapNhatTT = new JButton("Cap nhat");// chi co nhan vien hoac quna li co quyen nay
		JButton jbut_XoaTT = new JButton("Xoa thong tin"); // chi co nhan vien hoac quna li co quyen nay
		
		JPanel jpan_luachonTXS = new JPanel();
		jpan_luachonTXS.setLayout(new FlowLayout());
		jpan_luachonTXS.add(jbut_CapNhatTT);
		jpan_luachonTXS.add(jbut_XoaTT);
		jpan_luachonTXS.add(jbut_DoiMK);
		jpan_luachonTXS.setBounds(0, 0, 30, 30);
		jpanThongTin.add(jpan_luachonTXS, BorderLayout.SOUTH);
		jpanThongTin.setBounds(0, 0, 100, 50);
		
		this.add(jpanImage);
		this.add(jpanThongTin);
		
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setLocationRelativeTo(null);
	}
}
