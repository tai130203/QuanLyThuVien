package Vew;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import Controller.LoginActionListener;
import DataAccessObject.NhanvienDAO;
import DataAccessObject.ThanhvienDAO;
import Model.NhanVienModel;
import Model.ThanhVienModel;

import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.ImageIcon;
import java.awt.Font;
import java.util.ArrayList;
import java.awt.Color;
import javax.swing.JTextField;
import javax.swing.JPasswordField;
import javax.swing.JButton;
import javax.swing.SwingConstants;
import java.awt.Graphics;


public class LoginViewDesign extends JFrame {

	private JPanel contentPane;
	private JTextField jtxtUser;
	private JPasswordField jtxtPass;

	public LoginViewDesign() {
		setTitle("Thư Viện Trung Tâm ĐHQG-TPHCM");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 935, 406);
		contentPane = new JPanel();
		contentPane.setBackground(new Color(210, 230, 153));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		LoginActionListener logiac = new LoginActionListener(this);
		
		JLabel lblNewLabel_1 = new JLabel("Nhập Thông Tin Đăng nhập");
		lblNewLabel_1.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_1.setForeground(new Color(174, 81, 81));
		lblNewLabel_1.setFont(new Font("Tahoma", Font.BOLD, 18));
		lblNewLabel_1.setBounds(571, 53, 338, 26);
		contentPane.add(lblNewLabel_1);
		
		JLabel lblNewLabel_2 = new JLabel("Username");
		lblNewLabel_2.setFont(new Font("Tahoma", Font.BOLD, 15));
		lblNewLabel_2.setBounds(549, 121, 99, 26);
		contentPane.add(lblNewLabel_2);
		
		JLabel lblNewLabel_2_1 = new JLabel("Password");
		lblNewLabel_2_1.setFont(new Font("Tahoma", Font.BOLD, 15));
		lblNewLabel_2_1.setBounds(549, 196, 110, 27);
		contentPane.add(lblNewLabel_2_1);
		
		jtxtUser = new JTextField();
		jtxtUser.setFont(new Font("Tahoma", Font.BOLD, 13));
		jtxtUser.setBounds(644, 117, 265, 37);
		contentPane.add(jtxtUser);
		jtxtUser.setColumns(10);
		
		jtxtPass = new JPasswordField();
		jtxtPass.setFont(new Font("Tahoma", Font.BOLD, 13));
		jtxtPass.setBounds(644, 192, 265, 37);
		contentPane.add(jtxtPass);
		
		JButton btnNewButton = new JButton("Xác nhận");
		btnNewButton.setBackground(new Color(181, 217, 166));
		btnNewButton.setFont(new Font("Tahoma", Font.BOLD, 15));
		btnNewButton.setForeground(new Color(102, 78, 26));
		btnNewButton.setBounds(659, 283, 160, 37);
		btnNewButton.addActionListener(logiac);
		contentPane.add(btnNewButton);
		
		JLabel lblNewLabel = new JLabel("");
		lblNewLabel.setIcon(new ImageIcon(LoginViewDesign.class.getResource("/icon/Picture5.jpg")));
		lblNewLabel.setBounds(0, 0, 919, 368);
		contentPane.add(lblNewLabel);
		
		this.setVisible(true);
		this.setLocationRelativeTo(null);
	}


	@SuppressWarnings("deprecation")
	public String LayThongTin() {
		ArrayList<ThanhVienModel> listTV = new ArrayList<ThanhVienModel>();
		ArrayList<NhanVienModel> listNV = new ArrayList<NhanVienModel>();
		listTV = ThanhvienDAO.getINstance().selectAll();
		listNV = NhanvienDAO.getInstance().selectAll();

		for (ThanhVienModel i : listTV) {
			if (i.getUsernametv().equals(jtxtUser.getText()) && i.getPasswordtv().equals(jtxtPass.getText())) {
				return i.getMatv();
			}
		}
		for (NhanVienModel j : listNV) {
			if (j.getUsername().equals(jtxtUser.getText()) && j.getPassword().equals(jtxtPass.getText())) {
				return j.getMaNV();
			}
		}
		return "KHONGTONTAITRONGHETHONG%$#@@";
	}

	public void XuLiDangNhap() {
		String maUSer = LayThongTin();
		String NhanDienUSEr = maUSer.substring(0, 2);
		//System.out.println(NhanDienUSEr);
		if (NhanDienUSEr.equals("SV") || NhanDienUSEr.equals("GV") || NhanDienUSEr.equals("HV")) {
			JOptionPane.showMessageDialog(this, "Đăng nhập thành công",
					"Thành công", JOptionPane.DEFAULT_OPTION);
			new ThanhVienView(maUSer);
			this.dispose();
		}
		if (NhanDienUSEr.equals("NV")) {
			new NhanvVIenHomePageViewDesign(maUSer);
			this.dispose();
		}
		if (NhanDienUSEr.equals("QL")) {
			new QuanLiHomePageViewDesign(maUSer);
			this.dispose();
		}
		if (maUSer.equals("KHONGTONTAITRONGHETHONG%$#@@")) {
			JOptionPane.showMessageDialog(this, "Username hoặc mật khẩu không đúng\n Vui lòng nhập lại",
					"Đăng nhập không thành công", JOptionPane.ERROR_MESSAGE);
		}
	}
}
