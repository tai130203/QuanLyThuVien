package Vew;

import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.awt.HeadlessException;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

import Controller.DoiMatKhauAcionlistener;
import Controller.LoginActionListener;
import Model.NhanVienModel;
import Model.ThanhVienModel;

public class DoiMatKhauView extends JFrame {
	public NhanVienModel nvmodel;
	public ThanhVienModel tvmodel;
	public JPasswordField jpabMoi;
	public JPasswordField jpabXN;
	public JTextField jpasMKCu;
	public DoiMatKhauView()
	{
		this.init();
	}
	
	public DoiMatKhauView(ThanhVienModel tvmodel) throws HeadlessException {
		super();
		this.tvmodel = tvmodel;
		this.init();
	}
	public DoiMatKhauView(NhanVienModel nvmodel) throws HeadlessException {
		super();
		this.nvmodel = nvmodel;
		this.init();
	}
	private void init()
	{
		this.setLayout(new BorderLayout());
		this.setSize(500,200);
		this.setTitle("DOI MAT KHAU");;
		
		JPanel jpancenter = new JPanel();
		jpancenter.setLayout(new GridLayout(3,2));
		
		JLabel jlabNhapMKCu = new JLabel("Nhập mật khẩu cũ");
		JLabel jlabNhapMKMoi = new JLabel("Nhập mật khẩu mới");
		JLabel jlabXNMKMoi = new JLabel("Xác nhận mật khẩu mới");
		
		jpasMKCu = new JTextField();
		jpabMoi = new JPasswordField();
		jpabXN = new JPasswordField();
		
		jpancenter.add(jlabNhapMKCu);
		jpancenter.add(jpasMKCu);
		jpancenter.add(jlabNhapMKMoi);
		jpancenter.add(jpabMoi);
		jpancenter.add(jlabXNMKMoi);
		jpancenter.add(jpabXN);
		
		DoiMatKhauAcionlistener doimkac = new DoiMatKhauAcionlistener(this);
		JButton jbutXN = new JButton("Xác nhận đổi mật khẩu");
		jbutXN.addActionListener(doimkac);
		
		this.add(jpancenter, BorderLayout.CENTER);
		this.add(jbutXN, BorderLayout.SOUTH);
		
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setLocationRelativeTo(null);
		this.setVisible(true);
	}
}
