package Vew;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import Controller.NhanVienHomePageActionListener;
import DataAccessObject.NhanvienDAO;
import Model.NhanVienModel;
import java.awt.Color;
import javax.swing.JLabel;
import java.awt.Font;
import javax.swing.JTextField;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class NhanvVIenHomePageViewDesign extends JFrame {
	public NhanVienModel nvModel;

	private JPanel contentPane;
	private JTextField txtdiachi;
	private JTextField txtusername;
	private JTextField txtmanv;
	private JTextField txthoten;
	private JTextField txtngaysinh;
	private JTextField txtngayvaolam;
	private JTextField txtsdt;
	private JTextField txtcccd;

	public NhanvVIenHomePageViewDesign(String manv) {
		setTitle("Trang Nhân Viên");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 822, 437);
		contentPane = new JPanel();
		contentPane.setBackground(new Color(230, 227, 153));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

		this.nvModel = new NhanVienModel();
		this.nvModel = NhanvienDAO.getInstance().LayThongTin(manv);
		
		JMenuBar jmenuBar = new JMenuBar();
		
		NhanVienHomePageActionListener qlhpac = new NhanVienHomePageActionListener(this);
		
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
		
		
		
		this.setJMenuBar(jmenuBar);
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JPanel panel = new JPanel();
		panel.setBackground(new Color(206, 239, 16));
		panel.setBounds(0, 0, 806, 38);
		contentPane.add(panel);
		
		JLabel lblNewLabel = new JLabel("Trang Chủ");
		lblNewLabel.setForeground(new Color(232, 65, 23));
		panel.add(lblNewLabel);
		lblNewLabel.setBackground(new Color(200, 189, 183));
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 21));
		
		JLabel lblNewLabel_1 = new JLabel("Họ tên");
		lblNewLabel_1.setFont(new Font("Tahoma", Font.BOLD, 12));
		lblNewLabel_1.setBounds(10, 85, 69, 14);
		contentPane.add(lblNewLabel_1);
		
		JLabel lblNewLabel_1_1 = new JLabel("Mã nhân viên");
		lblNewLabel_1_1.setFont(new Font("Tahoma", Font.BOLD, 12));
		lblNewLabel_1_1.setBounds(10, 143, 87, 14);
		contentPane.add(lblNewLabel_1_1);
		
		JLabel lblNewLabel_1_2 = new JLabel("Username");
		lblNewLabel_1_2.setFont(new Font("Tahoma", Font.BOLD, 12));
		lblNewLabel_1_2.setBounds(10, 196, 69, 14);
		contentPane.add(lblNewLabel_1_2);
		
		JLabel lblNewLabel_1_3 = new JLabel("Địa chỉ");
		lblNewLabel_1_3.setFont(new Font("Tahoma", Font.BOLD, 12));
		lblNewLabel_1_3.setBounds(10, 250, 69, 14);
		contentPane.add(lblNewLabel_1_3);
		
		txtdiachi = new JTextField(this.nvModel.getDiachi());
		txtdiachi.setFont(new Font("Tahoma", Font.PLAIN, 13));
		txtdiachi.setEditable(false);
		txtdiachi.setBounds(95, 243, 406, 30);
		contentPane.add(txtdiachi);
		txtdiachi.setColumns(10);
		
		txtusername = new JTextField(this.nvModel.getUsername());
		txtusername.setFont(new Font("Tahoma", Font.PLAIN, 13));
		txtusername.setEditable(false);
		txtusername.setColumns(10);
		txtusername.setBounds(95, 189, 406, 30);
		contentPane.add(txtusername);
		
		txtmanv = new JTextField(this.nvModel.getMaNV());
		txtmanv.setFont(new Font("Tahoma", Font.PLAIN, 13));
		txtmanv.setEditable(false);
		txtmanv.setColumns(10);
		txtmanv.setBounds(95, 136, 406, 30);
		contentPane.add(txtmanv);
		
		txthoten = new JTextField(this.nvModel.getTenNV());
		txthoten.setFont(new Font("Tahoma", Font.PLAIN, 13));
		txthoten.setEditable(false);
		txthoten.setColumns(10);
		txthoten.setBounds(95, 78, 406, 30);
		contentPane.add(txthoten);
		
		JLabel lblNewLabel_1_4 = new JLabel("Ngày sinh");
		lblNewLabel_1_4.setFont(new Font("Tahoma", Font.BOLD, 12));
		lblNewLabel_1_4.setBounds(520, 81, 80, 23);
		contentPane.add(lblNewLabel_1_4);
		
		JLabel lblNewLabel_1_4_1 = new JLabel("Ngày vào làm");
		lblNewLabel_1_4_1.setFont(new Font("Tahoma", Font.BOLD, 12));
		lblNewLabel_1_4_1.setBounds(520, 139, 105, 23);
		contentPane.add(lblNewLabel_1_4_1);
		
		JLabel lblNewLabel_1_4_1_1 = new JLabel("Số điện thoại");
		lblNewLabel_1_4_1_1.setFont(new Font("Tahoma", Font.BOLD, 12));
		lblNewLabel_1_4_1_1.setBounds(520, 192, 105, 23);
		contentPane.add(lblNewLabel_1_4_1_1);
		
		JLabel lblNewLabel_1_4_1_2 = new JLabel("Căn cước công dân");
		lblNewLabel_1_4_1_2.setFont(new Font("Tahoma", Font.BOLD, 12));
		lblNewLabel_1_4_1_2.setBounds(520, 246, 142, 22);
		contentPane.add(lblNewLabel_1_4_1_2);
		
		txtngaysinh = new JTextField(this.nvModel.getNgaySinh()+"");
		txtngaysinh.setFont(new Font("Tahoma", Font.PLAIN, 13));
		txtngaysinh.setEditable(false);
		txtngaysinh.setBounds(672, 78, 124, 30);
		contentPane.add(txtngaysinh);
		txtngaysinh.setColumns(10);
		
		txtngayvaolam = new JTextField(this.nvModel.getNgayVaoLam()+"");
		txtngayvaolam.setFont(new Font("Tahoma", Font.PLAIN, 13));
		txtngayvaolam.setEditable(false);
		txtngayvaolam.setColumns(10);
		txtngayvaolam.setBounds(672, 136, 124, 30);
		contentPane.add(txtngayvaolam);
		
		txtsdt = new JTextField(this.nvModel.getSodt());
		txtsdt.setFont(new Font("Tahoma", Font.PLAIN, 13));
		txtsdt.setEditable(false);
		txtsdt.setColumns(10);
		txtsdt.setBounds(672, 189, 124, 30);
		contentPane.add(txtsdt);
		
		txtcccd = new JTextField(this.nvModel.getCccd());
		txtcccd.setFont(new Font("Tahoma", Font.PLAIN, 13));
		txtcccd.setEditable(false);
		txtcccd.setColumns(10);
		txtcccd.setBounds(672, 243, 124, 30);
		contentPane.add(txtcccd);
		
		JButton jbutqlthnhvien = new JButton("Quản lí thành viên");
		jbutqlthnhvien.setForeground(new Color(102, 119, 9));
		jbutqlthnhvien.setFont(new Font("Tahoma", Font.BOLD, 18));
		jbutqlthnhvien.setBounds(48, 327, 203, 38);
		jbutqlthnhvien.addActionListener(qlhpac); 
		contentPane.add(jbutqlthnhvien);
		
		JButton jbutquanliMTS = new JButton("Quản lí mượn trả sách");
		jbutquanliMTS.setForeground(new Color(102, 119, 9));
		jbutquanliMTS.setFont(new Font("Tahoma", Font.BOLD, 18));
		jbutquanliMTS.setBounds(272, 327, 240, 38);
		jbutquanliMTS.addActionListener(qlhpac);
		contentPane.add(jbutquanliMTS);
		
		JButton jbutbctk = new JButton("Báo cáo thống kê");
		jbutbctk.setForeground(new Color(102, 119, 9));
		jbutbctk.setFont(new Font("Tahoma", Font.BOLD, 18));
		jbutbctk.setBounds(531, 326, 213, 41);
		contentPane.add(jbutbctk);
		jbutbctk.addActionListener(qlhpac);
		this.setVisible(true);
		this.setLocationRelativeTo(null);
	}
	public void chucnangDOiMK()
	{
		new DoiMKViewDesign(this.nvModel);
	}
}
