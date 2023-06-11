package Vew;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.GridLayout;
import java.util.ArrayList;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

import Controller.LoginActionListener;
import DataAccessObject.NhanvienDAO;
import DataAccessObject.ThanhvienDAO;
import Model.LoginModel;
import Model.NhanVienModel;
import Model.ThanhVienModel;

public class LoginView extends JFrame {
	private LoginModel loginModel;
	private SinhvienHomePageView svHomepageView;
	private JTextField jtxtUser = new JTextField();
	private JPasswordField jtxtPass = new JPasswordField();

	public LoginView() {
		this.loginModel = new LoginModel();
		this.init();
		this.setVisible(true);
	}

	protected void init() {
		this.setLayout(new BorderLayout());
		this.setSize(700, 200);
		this.setTitle("Thư viện trung tâm DHQG-TPHCM");
		this.setForeground(Color.BLUE);

		Font font_panel = new Font("Arial", Font.BOLD, 25);

		JLabel jlabDangNhap = new JLabel("Nhập thông tin tài khoản", JLabel.CENTER);
		jlabDangNhap.setFont(font_panel);
		jlabDangNhap.setForeground(Color.BLUE);

		JPanel jpanLogin = new JPanel();
		jpanLogin.setLayout(new GridLayout(2, 2, 20, 10));
		jpanLogin.setForeground(Color.BLACK);
		jpanLogin.setFont(font_panel);

		JLabel jlab_User = new JLabel("Tên đăng nhập");
		jlab_User.setFont(font_panel);
		JLabel jlab_Pass = new JLabel("Mật khẩu");
		jlab_Pass.setFont(font_panel);

		jtxtUser.setFont(font_panel);
		jtxtPass.setFont(font_panel);

		jpanLogin.add(jlab_User);
		jpanLogin.add(jtxtUser);
		jpanLogin.add(jlab_Pass);
		jpanLogin.add(jtxtPass);

		LoginActionListener loginAc = new LoginActionListener(this);
		JButton jbutXacNhan = new JButton("Xác nhận");
		jbutXacNhan.addActionListener(loginAc);

		this.add(jlabDangNhap, BorderLayout.NORTH);
		this.add(jpanLogin, BorderLayout.CENTER);
		this.add(jbutXacNhan, BorderLayout.SOUTH);

		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setLocationRelativeTo(null);
	}

	@SuppressWarnings("deprecation")
	public boolean KiemTraThongTin() {

		System.out.println("Dang kiem tra thong tin dang nhap");
		if (this.loginModel.CheckInfor(jtxtUser.getText(), jtxtPass.getText())) {
			return true;
		} else {
			return false;
		}
	}

	@SuppressWarnings("deprecation")
	public String LayThongTin() {
		ArrayList<ThanhVienModel> listTV = new ArrayList<ThanhVienModel>();
		ArrayList<NhanVienModel> listNV = new ArrayList<NhanVienModel>();
		listTV = ThanhvienDAO.getINstance().selectAll();
		listNV = NhanvienDAO.getInstance().selectAll();
		System.out.println(jtxtUser.getText());
		System.out.println(jtxtPass.getText());

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
		System.out.println(NhanDienUSEr);
		if (NhanDienUSEr.equals("SV") || NhanDienUSEr.equals("GV") || NhanDienUSEr.equals("HV")) {
			JOptionPane.showMessageDialog(this, "Đăng nhập thành công",
					"Thành công", JOptionPane.DEFAULT_OPTION);
			new ThanhVienView(maUSer);
			this.dispose();
		}
		if (NhanDienUSEr.equals("NV")) {
			new NhanVienHomePageView(maUSer);
			this.dispose();
		}
		if (NhanDienUSEr.equals("QL")) {
			new QuanliHomePageView(maUSer);
			this.dispose();
		}
		if (maUSer.equals("KHONGTONTAITRONGHETHONG%$#@@")) {
			JOptionPane.showMessageDialog(this, "Username hoặc mật khẩu không đúng\n Vui lòng nhập lại",
					"Đăng nhập không thành công", JOptionPane.ERROR_MESSAGE);
		}
	}
}
