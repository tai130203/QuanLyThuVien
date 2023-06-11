package Vew;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JTable;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Font;
import javax.swing.JTextField;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.awt.event.ActionEvent;
import javax.swing.table.DefaultTableModel;

import Controller.QuanLiThanhVienController;
import DataAccessObject.ThanhvienDAO;
import DataAccessObject.TheTuDAO;
import Model.NhanVienModel;
import Model.ThanhVienModel;
import Model.TheTuModel;

import javax.swing.JScrollPane;
import java.awt.event.MouseAdapter;
import javax.swing.JTextArea;
import java.awt.Color;
import javax.swing.ScrollPaneConstants;
import javax.swing.SwingConstants;

public class QuanLiThanhVienView extends JFrame {

	private static final String DefaultTableModel = null;
	private JPanel contentPane;
	private JTextField txtTimKiem;
	private JTable table;
	private JTextArea txtmatv;
	private JTextArea txttentv;
	private JTextArea txtmadv;
	private JTextArea txtngaysinh;
	private JTextArea txtngaydk;
	private JTextArea txtsodt;
	private JTextArea txtemail;
	private JTextArea txtdiachi;
	private JTable table_TheTu;
	private NhanVienModel nvmodel;

	public QuanLiThanhVienView(NhanVienModel nvmd) {
		setTitle("QUẢN LÍ THÀNH VIÊN");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 846, 704);
		contentPane = new JPanel();
		contentPane.setBackground(new Color(221, 226, 156));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		this.nvmodel = new NhanVienModel();
		this.nvmodel = nvmd;
		setContentPane(contentPane);
		contentPane.setLayout(null);

		txtTimKiem = new JTextField();
		txtTimKiem.setBounds(109, 11, 294, 33);
		contentPane.add(txtTimKiem);
		txtTimKiem.setColumns(10);

		QuanLiThanhVienController acQltv = new QuanLiThanhVienController(this);

		JButton btnNewButton_1 = new JButton("Tìm kiếm");
		btnNewButton_1.setFont(new Font("Tahoma", Font.BOLD, 14));
		btnNewButton_1.setForeground(new Color(0, 128, 192));
		btnNewButton_1.setBounds(413, 11, 117, 33);
		btnNewButton_1.addActionListener(acQltv);
		contentPane.add(btnNewButton_1);

		JLabel lblNewLabel = new JLabel("Nhập mã số");
		lblNewLabel.setFont(new Font("Tahoma", Font.PLAIN, 14));
		lblNewLabel.setBounds(10, 13, 89, 24);
		contentPane.add(lblNewLabel);

		// tạo sự kiện chuột
		table = new JTable();
		table.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				// System.out.println(getMATV(table.getSelectedRow()));
//				new ThongTinSinhVienView(getMATV(table.getSelectedRow()));
//				System.out.println(getTENTV(table.getSelectedRow()));
				XuatraJtext(table.getSelectedRow());
			}
		});
		table.setBounds(0, 0, 625, 200);
		table.setModel(new DefaultTableModel(new Object[][] {},
				new String[] { "M\u00E3 th\u00E0nh vi\u00EAn", "T\u00EAn th\u00E0nh vi\u00EAn",
						"M\u00E3 \u0111\u01A1n v\u1ECB", "Ng\u00E0y sinh", "\u0110\u1ECBa ch\u1EC9",
						"S\u1ED1 \u0111i\u1EC7n tho\u1EA1i", "Email", "ngay dk" }) {
			boolean[] columnEditables = new boolean[] { false, false, false, false, false, false, false, false };

			public boolean isCellEditable(int row, int column) {
				return columnEditables[column];
			}
		});
		table.getColumnModel().getColumn(0).setResizable(false);
		table.getColumnModel().getColumn(0).setPreferredWidth(150);
		table.getColumnModel().getColumn(1).setResizable(false);
		table.getColumnModel().getColumn(1).setPreferredWidth(300);
		table.getColumnModel().getColumn(2).setResizable(false);
		table.getColumnModel().getColumn(2).setPreferredWidth(100);
		table.getColumnModel().getColumn(3).setResizable(false);
		table.getColumnModel().getColumn(3).setPreferredWidth(130);
		table.getColumnModel().getColumn(4).setResizable(false);
		table.getColumnModel().getColumn(4).setPreferredWidth(150);
		table.getColumnModel().getColumn(5).setResizable(false);
		table.getColumnModel().getColumn(5).setPreferredWidth(120);
		table.getColumnModel().getColumn(6).setResizable(false);
		table.getColumnModel().getColumn(6).setPreferredWidth(170);
		table.getColumnModel().getColumn(7).setResizable(false);
		table.getColumnModel().getColumn(7).setPreferredWidth(183);

		showTable();

		JScrollPane scrollPane = new JScrollPane(table, ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS,
				JScrollPane.HORIZONTAL_SCROLLBAR_ALWAYS);
		scrollPane.setBounds(32, 75, 768, 170);
		contentPane.add(scrollPane);

		txtmatv = new JTextArea();
		txtmatv.setBounds(59, 300, 140, 22);
		contentPane.add(txtmatv);

		txttentv = new JTextArea();
		txttentv.setBounds(59, 333, 143, 22);
		contentPane.add(txttentv);

		txtmadv = new JTextArea();
		txtmadv.setBounds(59, 366, 143, 22);
		contentPane.add(txtmadv);

		txtngaysinh = new JTextArea();
		txtngaysinh.setBounds(276, 300, 89, 22);
		contentPane.add(txtngaysinh);

		txtngaydk = new JTextArea();
		txtngaydk.setBounds(276, 333, 89, 22);
		contentPane.add(txtngaydk);

		txtsodt = new JTextArea();
		txtsodt.setBounds(273, 366, 92, 22);
		contentPane.add(txtsodt);

		txtemail = new JTextArea();
		txtemail.setBounds(434, 300, 366, 22);
		contentPane.add(txtemail);

		txtdiachi = new JTextArea();
		txtdiachi.setBounds(434, 333, 366, 22);
		contentPane.add(txtdiachi);

		JLabel lblNewLabel_1 = new JLabel("MATV");
		lblNewLabel_1.setBounds(10, 302, 54, 21);
		contentPane.add(lblNewLabel_1);

		JLabel lblNewLabel_1_1 = new JLabel("TenTV");
		lblNewLabel_1_1.setBounds(10, 333, 54, 21);
		contentPane.add(lblNewLabel_1_1);

		JButton btnNewButton_2 = new JButton("Xác Nhận Thêm Thành Viên");
		btnNewButton_2.setForeground(new Color(0, 128, 128));
		btnNewButton_2.setFont(new Font("Tahoma", Font.BOLD, 14));
		btnNewButton_2.setBounds(478, 399, 256, 23);
		btnNewButton_2.addActionListener(acQltv);
		contentPane.add(btnNewButton_2);

		JLabel lblNewLabel_2 = new JLabel("Nhập thông tin thành viên cần thêm");
		lblNewLabel_2.setFont(new Font("Tahoma", Font.BOLD, 14));
		lblNewLabel_2.setForeground(new Color(249, 74, 70));
		lblNewLabel_2.setBackground(new Color(255, 255, 255));
		lblNewLabel_2.setBounds(10, 256, 265, 33);
		contentPane.add(lblNewLabel_2);

		JLabel lblNewLabel_1_1_1 = new JLabel("MADV");
		lblNewLabel_1_1_1.setBounds(10, 368, 54, 21);
		contentPane.add(lblNewLabel_1_1_1);

		JLabel lblNewLabel_1_2 = new JLabel("NgaySinh");
		lblNewLabel_1_2.setBounds(212, 302, 54, 21);
		contentPane.add(lblNewLabel_1_2);

		JLabel lblNewLabel_1_3 = new JLabel("DiaChi");
		lblNewLabel_1_3.setBounds(386, 335, 54, 21);
		contentPane.add(lblNewLabel_1_3);

		JLabel lblNewLabel_1_4 = new JLabel("SoDT");
		lblNewLabel_1_4.setBounds(212, 368, 54, 21);
		contentPane.add(lblNewLabel_1_4);

		JLabel lblNewLabel_1_5 = new JLabel("Email");
		lblNewLabel_1_5.setBounds(386, 302, 54, 21);
		contentPane.add(lblNewLabel_1_5);

		JLabel lblNewLabel_1_6 = new JLabel("NgayDk");
		lblNewLabel_1_6.setBounds(212, 335, 54, 21);
		contentPane.add(lblNewLabel_1_6);

		JButton btnNewButton_2_1 = new JButton("Xóa thành viên");
		btnNewButton_2_1.addActionListener(acQltv);
		btnNewButton_2_1.setForeground(new Color(0, 128, 128));
		btnNewButton_2_1.setFont(new Font("Tahoma", Font.BOLD, 14));
		btnNewButton_2_1.setBounds(32, 399, 190, 23);
		contentPane.add(btnNewButton_2_1);

		JButton btnNewButton_2_2 = new JButton("Cập nhật");
		btnNewButton_2_2.setForeground(new Color(0, 128, 128));
		btnNewButton_2_2.setFont(new Font("Tahoma", Font.BOLD, 14));
		btnNewButton_2_2.setBounds(258, 399, 182, 23);
		contentPane.add(btnNewButton_2_2);
		btnNewButton_2_2.addActionListener(acQltv);

		table_TheTu = new JTable();
		table_TheTu.setModel(new DefaultTableModel(new Object[][] {},
				new String[] { "M\u00E3 th\u1EBB", "Ng\u00E0y T\u1EA1o", "Ng\u00E0y h\u1EBFt h\u1EA1n",
						"M\u00E3 nh\u00E2n vi\u00EAn", "M\u00E3 th\u00E0nh vi\u00EAn" }) {
			boolean[] columnEditables = new boolean[] { false, false, false, false, false };

			public boolean isCellEditable(int row, int column) {
				return columnEditables[column];
			}
		});
		table_TheTu.getColumnModel().getColumn(0).setPreferredWidth(76);
		table_TheTu.getColumnModel().getColumn(1).setPreferredWidth(76);
		table_TheTu.getColumnModel().getColumn(2).setPreferredWidth(76);
		table_TheTu.getColumnModel().getColumn(3).setPreferredWidth(76);
		table_TheTu.getColumnModel().getColumn(4).setPreferredWidth(76);
		table_TheTu.setBounds(32, 516, 768, 190);

		showTheTu();

		JLabel lblNewLabel_3 = new JLabel("Thẻ Từ");
		lblNewLabel_3.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_3.setFont(new Font("Tahoma", Font.BOLD, 20));
		lblNewLabel_3.setForeground(new Color(187, 98, 68));
		lblNewLabel_3.setBounds(330, 433, 143, 35);
		contentPane.add(lblNewLabel_3);

		JScrollPane scrollPane_Thetu = new JScrollPane(table_TheTu);
		scrollPane_Thetu.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
		scrollPane_Thetu.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_ALWAYS);
		scrollPane_Thetu.setBounds(32, 472, 768, 170);
		contentPane.add(scrollPane_Thetu);
		
		JButton jbutquayLaiTT = new JButton("Quay Lại Trang Chủ");
		jbutquayLaiTT.setForeground(new Color(0, 128, 192));
		jbutquayLaiTT.setFont(new Font("Tahoma", Font.BOLD, 13));
		jbutquayLaiTT.setBounds(573, 11, 247, 33);
		jbutquayLaiTT.addActionListener(acQltv);
		contentPane.add(jbutquayLaiTT);

		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setLocationRelativeTo(null);
		this.setVisible(true);
	}

	public String getMATV(int row) {
		DefaultTableModel model_table = (DefaultTableModel) table.getModel();
		String matv = String.valueOf(model_table.getValueAt(row, 0));
		return matv;
	}

	public String getTENTV(int row) {
		DefaultTableModel model_table = (DefaultTableModel) table.getModel();
		String tentv = String.valueOf(model_table.getValueAt(row, 1));
		return tentv;
	}

	public void XuatraJtext(int row) {
		DefaultTableModel model_table = (DefaultTableModel) table.getModel();
		txtmatv.setText(model_table.getValueAt(row, 0) + "");
		txttentv.setText(model_table.getValueAt(row, 1) + "");
		txtmadv.setText(model_table.getValueAt(row, 2) + "");
		txtngaysinh.setText(model_table.getValueAt(row, 3) + "");
		txtngaydk.setText(model_table.getValueAt(row, 7) + "");
		txtsodt.setText(model_table.getValueAt(row, 5) + "");
		txtemail.setText(model_table.getValueAt(row, 6) + "");
		txtdiachi.setText(model_table.getValueAt(row, 4) + "");
	}

	public void ThemThanhVienMoi() throws ParseException {
		String ngaysinh = txtngaysinh.getText();
		String ngaydk = txtngaydk.getText();
		SimpleDateFormat inputformat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date ngaysinhdate = null;
		java.util.Date ngaydangkydate = null;

		ngaysinhdate = inputformat.parse(ngaysinh);
		ngaydangkydate = inputformat.parse(ngaydk);
		
		java.sql.Date sqlDateNgaySinh = new java.sql.Date(ngaysinhdate.getTime());
		java.sql.Date sqlDateNgayDK = new java.sql.Date(ngaydangkydate.getTime());

		ThanhVienModel tvMoi = new ThanhVienModel(txtmatv.getText(), txttentv.getText(), txtmadv.getText(),
				sqlDateNgaySinh, txtdiachi.getText(), txtsodt.getText(), txtemail.getText(), 
				sqlDateNgayDK,"USER" + txtmatv.getText(), txtmatv.getText() + "TVTT" );
		ThanhvienDAO.getINstance().insert(tvMoi);
		
		TheTuModel TheMoi = new TheTuModel("TT" + txtmatv.getText(),sqlDateNgayDK, sqlDateNgayDK,this.nvmodel.getMaNV(), 
				txtmatv.getText());
		if (TheTuDAO.getInstance().insert(TheMoi) == 1)
		{
			JOptionPane.showMessageDialog(this, "Thêm mới thành viên thành công", "THÀNH CÔNG", JOptionPane.DEFAULT_OPTION);
			showTable();
			showTheTu();
		}
		else
		{
			JOptionPane.showMessageDialog(this, "Thêm không thành công", "KHÔNG THÀNH CÔNG", JOptionPane.ERROR_MESSAGE);
		}
		

	}

	public void chucnangTim() {
		DefaultTableModel model_table = (DefaultTableModel) table.getModel();
		model_table.setRowCount(0);
		try {
			ArrayList<ThanhVienModel> listThanhvien = ThanhvienDAO.getINstance()
					.selectByCondition(txtTimKiem.getText());
			for (ThanhVienModel i : listThanhvien) {
				model_table.addRow(new Object[] { i.getMatv(), i.getTentv(), i.getMadv(), i.getNgaysinh() + "",
						i.getDiachi(), "" + i.getSodt(), i.getEmail(), i.getNgayDKTV() + "", });
			}

		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void chucnangXoa() {
		String ngaysinh = txtngaysinh.getText();
		String ngaydk = txtngaydk.getText();
		SimpleDateFormat inputformat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date ngaysinhdate = null;
		java.util.Date ngaydangkydate = null;

		try {
			ngaysinhdate = inputformat.parse(ngaysinh);
			ngaydangkydate = inputformat.parse(ngaydk);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		java.sql.Date sqlDateNgaySinh = new java.sql.Date(ngaysinhdate.getTime());
		java.sql.Date sqlDateNgayDK = new java.sql.Date(ngaydangkydate.getTime());

		ThanhVienModel tv = new ThanhVienModel(txtmatv.getText(), txttentv.getText(), txtmadv.getText(),
				sqlDateNgaySinh, txtdiachi.getText(), txtsodt.getText(), txtemail.getText(), sqlDateNgayDK);
		int n = ThanhvienDAO.getINstance().delete(tv);
		if (n == 1)
		{
			JOptionPane.showMessageDialog(this, "Xóa thành viên thành công", "THÀNH CÔNG", JOptionPane.DEFAULT_OPTION);
			showTable();
			showTheTu();
		}
		else
		{
			JOptionPane.showMessageDialog(this, "Xóa không thành công", "KHÔNG THÀNH CÔNG", JOptionPane.ERROR_MESSAGE);
		}
	}

	public void chucNangCapNhat() {
		String ngaysinh = txtngaysinh.getText();
		String ngaydk = txtngaydk.getText();
		SimpleDateFormat inputformat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date ngaysinhdate = null;
		java.util.Date ngaydangkydate = null;

		try {
			ngaysinhdate = inputformat.parse(ngaysinh);
			ngaydangkydate = inputformat.parse(ngaydk);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		java.sql.Date sqlDateNgaySinh = new java.sql.Date(ngaysinhdate.getTime());
		java.sql.Date sqlDateNgayDK = new java.sql.Date(ngaydangkydate.getTime());

		ThanhVienModel tvupdate = ThanhvienDAO.getINstance().LayThongTin(txtmatv.getText());
		
		ThanhVienModel tv = new ThanhVienModel(txtmatv.getText(), txttentv.getText(), txtmadv.getText(),
				sqlDateNgaySinh, txtdiachi.getText(), txtsodt.getText(), txtemail.getText(), sqlDateNgayDK,
				tvupdate.getUsernametv(), tvupdate.getPasswordtv());
		ThanhvienDAO.getINstance().update(tv);
		if (ThanhvienDAO.getINstance().update(tv) == 1)
		{
			JOptionPane.showMessageDialog(this, "Cập nhật thành công", "THÀNH CÔNG", JOptionPane.DEFAULT_OPTION);
			showTable();
			showTheTu();
		}
		else
		{
			JOptionPane.showMessageDialog(this, "Cập nhật không thành công", "KHÔNG THÀNH CÔNG", JOptionPane.ERROR_MESSAGE);
		}
	}

	public void showTable() {
		DefaultTableModel model_table = (DefaultTableModel) table.getModel();
		model_table.setRowCount(0);
		try {
			ArrayList<ThanhVienModel> listThanhvien = ThanhvienDAO.getINstance().selectAll();
			int count = 0;
			for (ThanhVienModel i : listThanhvien) {
				model_table.addRow(new Object[] { i.getMatv(), i.getTentv(), i.getMadv(), i.getNgaysinh() + "",
						i.getDiachi(), "" + i.getSodt(), i.getEmail(), i.getNgayDKTV() + "", });
				count++;
			}

		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void chucnang_quay_ve_trang_chu()
	{
		new NhanvVIenHomePageViewDesign(this.nvmodel.getMaNV());
		this.dispose();
	}
	public void showTheTu() {
		DefaultTableModel model_theTu = (DefaultTableModel) table_TheTu.getModel();
		model_theTu.setRowCount(0);
		try {
			ArrayList<TheTuModel> listTheTu = TheTuDAO.getInstance().selectAll();
			for (TheTuModel i : listTheTu) {
				model_theTu.addRow(
						new Object[] { i.getMathe(), i.getNgaytao(), i.getNgayhethan(), i.getManv(), i.getMatv() });
				model_theTu.fireTableDataChanged();
			}

		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
}
