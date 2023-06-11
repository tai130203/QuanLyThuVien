package Vew;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import Controller.QuanLiHomePageActionListener;
import DataAccessObject.NhanvienDAO;
import Model.NhanVienModel;

import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.SwingConstants;
import javax.swing.JTextField;
import java.awt.Color;
import java.awt.Font;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class QuanLiHomePageViewDesign extends JFrame {
	public NhanVienModel qlmodel;
	private JPanel contentPane;
	private JTextField tstusername;
	private JTextField txtdiachi;
	private JTextField txtmanv;
	private JTextField txthoten;
	private JTextField txtCCCD;
	private JTextField txtsdt;
	private JTextField txtngayvaolam;
	private JTextField txtNgaySinh;

	public QuanLiHomePageViewDesign(String mangql) {
		setTitle("Trang Quản Lý");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 917, 415);
		contentPane = new JPanel();
		contentPane.setBackground(new Color(227, 211, 155));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		this.qlmodel = new NhanVienModel();
		this.qlmodel = NhanvienDAO.getInstance().LayThongTin(mangql);
		
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
		
		
		
		
		this.setLocationRelativeTo(null);
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel jlabTent = new JLabel("Họ tên");
		jlabTent.setFont(new Font("Tahoma", Font.BOLD, 13));
		jlabTent.setBounds(10, 85, 83, 14);
		contentPane.add(jlabTent);
		
		JButton jbutQuanLyNV = new JButton("Quản lý nhân viên");
		jbutQuanLyNV.setForeground(new Color(119, 53, 9));
		jbutQuanLyNV.setFont(new Font("Tahoma", Font.BOLD, 18));
		jbutQuanLyNV.setBackground(new Color(213, 231, 152));
		jbutQuanLyNV.setBounds(166, 294, 218, 49);
		jbutQuanLyNV.addActionListener(qlhpac);
		contentPane.add(jbutQuanLyNV);
		
		JButton jbutQLSach = new JButton("Quản lý sách");
		jbutQLSach.setFont(new Font("Tahoma", Font.BOLD, 18));
		jbutQLSach.setForeground(new Color(119, 53, 9));
		jbutQLSach.setBackground(new Color(213, 231, 152));
		jbutQLSach.setBounds(458, 294, 233, 49);
		jbutQLSach.addActionListener(qlhpac);
		contentPane.add(jbutQLSach);
		
		JPanel panel = new JPanel();
		panel.setBackground(new Color(220, 216, 165));
		panel.setBounds(0, 0, 901, 49);
		contentPane.add(panel);
		
		JLabel jlabTrangChu = new JLabel("Trang chủ");
		panel.add(jlabTrangChu);
		jlabTrangChu.setForeground(new Color(234, 69, 21));
		jlabTrangChu.setFont(new Font("Times New Roman", Font.BOLD, 26));
		jlabTrangChu.setBackground(new Color(163, 215, 220));
		jlabTrangChu.setHorizontalAlignment(SwingConstants.CENTER);
		
		JLabel jlabMANV = new JLabel("Mã nhân viên");
		jlabMANV.setFont(new Font("Tahoma", Font.BOLD, 13));
		jlabMANV.setBounds(10, 131, 106, 14);
		contentPane.add(jlabMANV);
		
		JLabel lblUsername = new JLabel("Username");
		lblUsername.setFont(new Font("Tahoma", Font.BOLD, 13));
		lblUsername.setBounds(10, 174, 83, 14);
		contentPane.add(lblUsername);
		
		JLabel lblaCh = new JLabel("Địa chỉ");
		lblaCh.setFont(new Font("Tahoma", Font.BOLD, 13));
		lblaCh.setBounds(10, 227, 73, 14);
		contentPane.add(lblaCh);
		
		JLabel lblNgySinh = new JLabel("Ngày sinh");
		lblNgySinh.setFont(new Font("Tahoma", Font.BOLD, 13));
		lblNgySinh.setBounds(580, 81, 106, 22);
		contentPane.add(lblNgySinh);
		
		JLabel lblNgyVoLm = new JLabel("Ngày vào làm");
		lblNgyVoLm.setFont(new Font("Tahoma", Font.BOLD, 13));
		lblNgyVoLm.setBounds(580, 127, 130, 22);
		contentPane.add(lblNgyVoLm);
		
		tstusername = new JTextField(this.qlmodel.getUsername());
		tstusername.setEditable(false);
		tstusername.setColumns(10);
		tstusername.setBounds(103, 167, 440, 29);
		contentPane.add(tstusername);
		
		txtdiachi = new JTextField(this.qlmodel.getDiachi());
		txtdiachi.setEditable(false);
		txtdiachi.setColumns(10);
		txtdiachi.setBounds(103, 220, 440, 29);
		contentPane.add(txtdiachi);
		
		JLabel lblSinThoi = new JLabel("Số điện thoại");
		lblSinThoi.setFont(new Font("Tahoma", Font.BOLD, 13));
		lblSinThoi.setBounds(580, 174, 130, 14);
		contentPane.add(lblSinThoi);
		
		JLabel lblCnCcCng = new JLabel("Căn cước công dân");
		lblCnCcCng.setFont(new Font("Tahoma", Font.BOLD, 13));
		lblCnCcCng.setBounds(580, 223, 157, 22);
		contentPane.add(lblCnCcCng);
		
		txtmanv = new JTextField(this.qlmodel.getMaNV());
		txtmanv.setEditable(false);
		txtmanv.setColumns(10);
		txtmanv.setBounds(103, 124, 440, 29);
		contentPane.add(txtmanv);
		
		txthoten = new JTextField(this.qlmodel.getTenNV());
		txthoten.setEditable(false);
		txthoten.setColumns(10);
		txthoten.setBounds(103, 78, 440, 29);
		contentPane.add(txthoten);
		
		txtCCCD = new JTextField(this.qlmodel.getCccd());
		txtCCCD.setEditable(false);
		txtCCCD.setColumns(10);
		txtCCCD.setBounds(710, 221, 181, 29);
		contentPane.add(txtCCCD);
		
		txtsdt = new JTextField(this.qlmodel.getSodt());
		txtsdt.setEditable(false);
		txtsdt.setColumns(10);
		txtsdt.setBounds(710, 168, 181, 29);
		contentPane.add(txtsdt);
		
		txtngayvaolam = new JTextField(this.qlmodel.getNgayVaoLam() + "");
		txtngayvaolam.setEditable(false);
		txtngayvaolam.setColumns(10);
		txtngayvaolam.setBounds(710, 125, 181, 29);
		contentPane.add(txtngayvaolam);
		
		txtNgaySinh = new JTextField(this.qlmodel.getNgaySinh()+"");
		txtNgaySinh.setEditable(false);
		txtNgaySinh.setColumns(10);
		txtNgaySinh.setBounds(710, 79, 181, 29);
		contentPane.add(txtNgaySinh);
		
		this.setJMenuBar(jmenuBar);
		this.setVisible(true);
	}
	public void chucnangDOiMK()
	{
		new DoiMKViewDesign(this.qlmodel);
		this.dispose();
	}
}
