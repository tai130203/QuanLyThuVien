package Vew;

import java.awt.EventQueue;
import java.awt.HeadlessException;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import Controller.DoiMatKhauAcionlistener;
import Model.NhanVienModel;
import Model.ThanhVienModel;
import javax.swing.JLabel;
import java.awt.Color;
import java.awt.Font;
import javax.swing.JTextField;
import javax.swing.JPasswordField;
import javax.swing.JButton;

public class DoiMKViewDesign extends JFrame {
	public NhanVienModel nvmodel;
	public ThanhVienModel tvmodel;
	public DoiMKViewDesign(ThanhVienModel tvmodel) throws HeadlessException {
		super();
		this.tvmodel = tvmodel;
		setTitle("Đổi Mật Khẩu");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 579, 269);
		contentPane = new JPanel();
		contentPane.setBackground(new Color(198, 208, 174));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

		
		
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblNewLabel = new JLabel("Nhập mật khẩu cũ");
		lblNewLabel.setForeground(new Color(18, 55, 9));
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 14));
		lblNewLabel.setBackground(new Color(151, 232, 193));
		lblNewLabel.setBounds(10, 34, 172, 27);
		contentPane.add(lblNewLabel);
		
		JLabel lblNhpMtKhu = new JLabel("Nhập mật khẩu mới");
		lblNhpMtKhu.setForeground(new Color(18, 55, 9));
		lblNhpMtKhu.setFont(new Font("Tahoma", Font.BOLD, 14));
		lblNhpMtKhu.setBackground(new Color(151, 232, 193));
		lblNhpMtKhu.setBounds(10, 93, 172, 27);
		contentPane.add(lblNhpMtKhu);
		
		JLabel lblXcNhnMt = new JLabel("Xác nhận mật khẩu mới");
		lblXcNhnMt.setForeground(new Color(18, 55, 9));
		lblXcNhnMt.setFont(new Font("Tahoma", Font.BOLD, 14));
		lblXcNhnMt.setBackground(new Color(151, 232, 193));
		lblXcNhnMt.setBounds(10, 143, 172, 27);
		contentPane.add(lblXcNhnMt);
		
		jpasMKCu = new JTextField();
		jpasMKCu.setFont(new Font("Tahoma", Font.BOLD, 13));
		jpasMKCu.setBounds(192, 32, 361, 32);
		contentPane.add(jpasMKCu);
		jpasMKCu.setColumns(10);
		
		jpabMoi = new JPasswordField();
		jpabMoi.setBounds(192, 92, 361, 32);
		contentPane.add(jpabMoi);
		
		jpabXN = new JPasswordField();
		jpabXN.setBounds(192, 143, 361, 32);
		contentPane.add(jpabXN);
		
		DoiMatKhauAcionlistener doimkac = new DoiMatKhauAcionlistener(this);
		
		JButton btnNewButton = new JButton("Xác nhận đổi mật khẩu");
		btnNewButton.setFont(new Font("Tahoma", Font.BOLD, 14));
		btnNewButton.setBounds(192, 196, 211, 23);
		btnNewButton.addActionListener(doimkac);
		contentPane.add(btnNewButton);
		this.setLocationRelativeTo(null);
		this.setVisible(true);
	}

	public DoiMKViewDesign(NhanVienModel nvmodel) throws HeadlessException {
		super();
		this.nvmodel = nvmodel;
		setTitle("Đổi Mật Khẩu");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 579, 269);
		contentPane = new JPanel();
		contentPane.setBackground(new Color(198, 208, 174));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

		
		
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblNewLabel = new JLabel("Nhập mật khẩu cũ");
		lblNewLabel.setForeground(new Color(18, 55, 9));
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 14));
		lblNewLabel.setBackground(new Color(151, 232, 193));
		lblNewLabel.setBounds(10, 34, 172, 27);
		contentPane.add(lblNewLabel);
		
		JLabel lblNhpMtKhu = new JLabel("Nhập mật khẩu mới");
		lblNhpMtKhu.setForeground(new Color(18, 55, 9));
		lblNhpMtKhu.setFont(new Font("Tahoma", Font.BOLD, 14));
		lblNhpMtKhu.setBackground(new Color(151, 232, 193));
		lblNhpMtKhu.setBounds(10, 93, 172, 27);
		contentPane.add(lblNhpMtKhu);
		
		JLabel lblXcNhnMt = new JLabel("Xác nhận mật khẩu mới");
		lblXcNhnMt.setForeground(new Color(18, 55, 9));
		lblXcNhnMt.setFont(new Font("Tahoma", Font.BOLD, 14));
		lblXcNhnMt.setBackground(new Color(151, 232, 193));
		lblXcNhnMt.setBounds(10, 143, 172, 27);
		contentPane.add(lblXcNhnMt);
		
		jpasMKCu = new JTextField();
		jpasMKCu.setFont(new Font("Tahoma", Font.BOLD, 13));
		jpasMKCu.setBounds(192, 32, 361, 32);
		contentPane.add(jpasMKCu);
		jpasMKCu.setColumns(10);
		
		jpabMoi = new JPasswordField();
		jpabMoi.setBounds(192, 92, 361, 32);
		contentPane.add(jpabMoi);
		
		jpabXN = new JPasswordField();
		jpabXN.setBounds(192, 143, 361, 32);
		contentPane.add(jpabXN);
		
		DoiMatKhauAcionlistener doimkac = new DoiMatKhauAcionlistener(this);
		
		JButton btnNewButton = new JButton("Xác nhận đổi mật khẩu");
		btnNewButton.setFont(new Font("Tahoma", Font.BOLD, 14));
		btnNewButton.setBounds(192, 196, 211, 23);
		btnNewButton.addActionListener(doimkac);
		contentPane.add(btnNewButton);
		this.setLocationRelativeTo(null);
		this.setVisible(true);
	}

	private JPanel contentPane;
	public JTextField jpasMKCu;
	public JPasswordField jpabMoi;
	public JPasswordField jpabXN;

	public DoiMKViewDesign() {
		setTitle("Đổi Mật Khẩu");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 579, 269);
		contentPane = new JPanel();
		contentPane.setBackground(new Color(198, 208, 174));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

		
		
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblNewLabel = new JLabel("Nhập mật khẩu cũ");
		lblNewLabel.setForeground(new Color(18, 55, 9));
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 14));
		lblNewLabel.setBackground(new Color(151, 232, 193));
		lblNewLabel.setBounds(10, 34, 172, 27);
		contentPane.add(lblNewLabel);
		
		JLabel lblNhpMtKhu = new JLabel("Nhập mật khẩu mới");
		lblNhpMtKhu.setForeground(new Color(18, 55, 9));
		lblNhpMtKhu.setFont(new Font("Tahoma", Font.BOLD, 14));
		lblNhpMtKhu.setBackground(new Color(151, 232, 193));
		lblNhpMtKhu.setBounds(10, 93, 172, 27);
		contentPane.add(lblNhpMtKhu);
		
		JLabel lblXcNhnMt = new JLabel("Xác nhận mật khẩu mới");
		lblXcNhnMt.setForeground(new Color(18, 55, 9));
		lblXcNhnMt.setFont(new Font("Tahoma", Font.BOLD, 14));
		lblXcNhnMt.setBackground(new Color(151, 232, 193));
		lblXcNhnMt.setBounds(10, 143, 172, 27);
		contentPane.add(lblXcNhnMt);
		
		jpasMKCu = new JTextField();
		jpasMKCu.setFont(new Font("Tahoma", Font.BOLD, 13));
		jpasMKCu.setBounds(192, 32, 361, 32);
		contentPane.add(jpasMKCu);
		jpasMKCu.setColumns(10);
		
		jpabMoi = new JPasswordField();
		jpabMoi.setBounds(192, 92, 361, 32);
		contentPane.add(jpabMoi);
		
		jpabXN = new JPasswordField();
		jpabXN.setBounds(192, 143, 361, 32);
		contentPane.add(jpabXN);
		
		DoiMatKhauAcionlistener doimkac = new DoiMatKhauAcionlistener(this);
		
		JButton btnNewButton = new JButton("Xác nhận đổi mật khẩu");
		btnNewButton.setFont(new Font("Tahoma", Font.BOLD, 14));
		btnNewButton.setBounds(192, 196, 211, 23);
		btnNewButton.addActionListener(doimkac);
		contentPane.add(btnNewButton);
		this.setLocationRelativeTo(null);
		this.setVisible(true);
	}
}
