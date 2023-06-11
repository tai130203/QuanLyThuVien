package Vew;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JTextField;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Color;
import javax.swing.JButton;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

import Controller.QuanliNhanVienController;
import DataAccessObject.NhanvienDAO;
import DataAccessObject.ThanhvienDAO;
import Model.NhanVienModel;
import Model.ThanhVienModel;

import javax.swing.JScrollPane;
import javax.swing.ScrollPaneConstants;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.sql.Date;
import java.util.ArrayList;
import java.awt.event.ActionEvent;
import java.awt.Font;

public class QuanLiNhanVienView extends JFrame {

	private JPanel contentPane;
	private JTextField txtTimKiem;
	private JTable table;
	private JButton btnNewButton_1;
	private JButton btnNewButton_2;
	private JButton btnNewButton_3;
	private JTextField txtManv;
	private JTextField txtTenNV;
	private JTextField txtNgayVL;
	private JTextField txtSDT;
	private JTextField txtNGSinh;
	private JTextField txtEmail;
	private JTextField txtDC;
	private JTextField txtcccd;
	private String maql;


	public QuanLiNhanVienView(String manguoiql) {
		setTitle("QUẢN LÍ NHÂN VIÊN");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 902, 556);
		contentPane = new JPanel();
		contentPane.setBackground(new Color(227, 211, 155));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		this.maql = manguoiql;
		JLabel lblNewLabel_1 = new JLabel("Nhập Mã Nhân Viên");
		lblNewLabel_1.setBounds(11, 37, 118, 23);
		contentPane.add(lblNewLabel_1);
		
		QuanliNhanVienController qlnvAc = new QuanliNhanVienController(this);

		JButton jbutTimKiem = new JButton("Tìm kiếm");
		jbutTimKiem.setFont(new Font("Tahoma", Font.BOLD, 11));
		jbutTimKiem.setBounds(402, 37, 103, 23);
		contentPane.add(jbutTimKiem);
		jbutTimKiem.addActionListener(qlnvAc);
		
		txtTimKiem = new JTextField();
		txtTimKiem.setBounds(157, 38, 235, 21);
		contentPane.add(txtTimKiem);
		txtTimKiem.setColumns(10);
		
		table = new JTable();
		
// add mouse listener
		table.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				XuatraJtext(table.getSelectedRow());
			}
		});

		table.setModel(new DefaultTableModel(
			new Object[][] {
			},
			new String[] {
				"M\u00E3 Nh\u00E2n Vi\u00EAn", "T\u00EAn Nh\u00E2n Vi\u00EAn", "Ng\u00E0y Sinh", "Ng\u00E0y v\u00E0o l\u00E0m", "\u0110\u1ECBa Ch\u1EC9", "S\u1ED1 \u0111i\u1EC7n tho\u1EA1i", "CCCD", "Email"
			}
		) {
			boolean[] columnEditables = new boolean[] {
				false, false, false, false, false, false, false, false
			};
			public boolean isCellEditable(int row, int column) {
				return columnEditables[column];
			}
		});
		table.getColumnModel().getColumn(7).setPreferredWidth(97);
		table.setBounds(78, 313, 582, 300);
		
		DefaultTableModel model_table = (DefaultTableModel) table.getModel();
		
		try {
			ArrayList<NhanVienModel> lisstNHanVien = NhanvienDAO.getInstance().selectAll();
			for(NhanVienModel i:lisstNHanVien)
			{
//				System.out.println(i.toString());
			model_table.addRow(new Object[] { i.getMaNV(), i.getTenNV(), i.getNgaySinh(),
					i.getNgayVaoLam(), i.getDiachi(), i.getSodt(),i.getCccd(), i.getEmail()});
			}
			
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		JScrollPane scrollPane = new JScrollPane(table);
		scrollPane.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
		scrollPane.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_ALWAYS);
		scrollPane.setBounds(21, 71, 846, 237);
		contentPane.add(scrollPane);
				
		btnNewButton_1 = new JButton("Thêm Mới Nhân Viên");
		btnNewButton_1.setFont(new Font("Tahoma", Font.BOLD, 14));
		btnNewButton_1.setForeground(new Color(40, 87, 80));
		btnNewButton_1.setBounds(678, 435, 189, 23);
		contentPane.add(btnNewButton_1);
		btnNewButton_1.addActionListener(qlnvAc);
		
		btnNewButton_2 = new JButton("Cập Nhật Nhân Viên");
		btnNewButton_2.setForeground(new Color(40, 87, 80));
		btnNewButton_2.setFont(new Font("Tahoma", Font.BOLD, 14));
		btnNewButton_2.setBounds(678, 401, 189, 23);
		contentPane.add(btnNewButton_2);
		btnNewButton_2.addActionListener(qlnvAc);
		
		btnNewButton_3 = new JButton("Xóa nhân viên");
		btnNewButton_3.setForeground(new Color(40, 87, 80));
		btnNewButton_3.setFont(new Font("Tahoma", Font.BOLD, 14));
		btnNewButton_3.setBounds(678, 367, 189, 23);
		contentPane.add(btnNewButton_3);
		btnNewButton_3.addActionListener(qlnvAc);
		
		txtManv = new JTextField();
		txtManv.setBounds(128, 336, 212, 20);
		contentPane.add(txtManv);
		txtManv.setColumns(10);
		
		txtTenNV = new JTextField();
		txtTenNV.setColumns(10);
		txtTenNV.setBounds(128, 367, 212, 20);
		contentPane.add(txtTenNV);
		
		txtNgayVL = new JTextField();
		txtNgayVL.setColumns(10);
		txtNgayVL.setBounds(128, 429, 212, 20);
		contentPane.add(txtNgayVL);
		
		txtSDT = new JTextField();
		txtSDT.setColumns(10);
		txtSDT.setBounds(474, 367, 189, 20);
		contentPane.add(txtSDT);
		
		txtNGSinh = new JTextField();
		txtNGSinh.setColumns(10);
		txtNGSinh.setBounds(128, 398, 212, 20);
		contentPane.add(txtNGSinh);
		
		txtEmail = new JTextField();
		txtEmail.setColumns(10);
		txtEmail.setBounds(474, 429, 189, 20);
		contentPane.add(txtEmail);
		
		txtDC = new JTextField();
		txtDC.setColumns(10);
		txtDC.setBounds(474, 336, 358, 20);
		contentPane.add(txtDC);
		
		txtcccd = new JTextField();
		txtcccd.setColumns(10);
		txtcccd.setBounds(474, 402, 189, 20);
		contentPane.add(txtcccd);
		
		JLabel lblNewLabel = new JLabel("MaNV");
		lblNewLabel.setBounds(63, 339, 46, 14);
		contentPane.add(lblNewLabel);
		
		JLabel lblNewLabel_2 = new JLabel("TenNV");
		lblNewLabel_2.setBounds(63, 370, 46, 14);
		contentPane.add(lblNewLabel_2);
		
		JLabel lblNewLabel_2_1 = new JLabel("NgSinh");
		lblNewLabel_2_1.setBounds(63, 401, 46, 14);
		contentPane.add(lblNewLabel_2_1);
		
		JLabel lblNewLabel_2_2 = new JLabel("NgayVL");
		lblNewLabel_2_2.setBounds(63, 432, 46, 14);
		contentPane.add(lblNewLabel_2_2);
		
		JLabel lblNewLabel_3 = new JLabel("DiaChi");
		lblNewLabel_3.setBounds(400, 339, 46, 14);
		contentPane.add(lblNewLabel_3);
		
		JLabel lblNewLabel_2_3 = new JLabel("SoDt");
		lblNewLabel_2_3.setBounds(400, 370, 71, 14);
		contentPane.add(lblNewLabel_2_3);
		
		JLabel lblNewLabel_2_4 = new JLabel("CCCD");
		lblNewLabel_2_4.setBounds(400, 404, 105, 14);
		contentPane.add(lblNewLabel_2_4);
		
		JLabel lblNewLabel_2_5 = new JLabel("Email");
		lblNewLabel_2_5.setBounds(400, 432, 46, 14);
		contentPane.add(lblNewLabel_2_5);
		
		JButton jbutLamMoi = new JButton("Làm mới bảng");
		jbutLamMoi.setForeground(new Color(40, 87, 80));
		jbutLamMoi.setFont(new Font("Tahoma", Font.BOLD, 14));
		jbutLamMoi.setBounds(678, 469, 189, 23);
		contentPane.add(jbutLamMoi);
		
		JButton jbutQuayLaiTT = new JButton("Trở lại trang chủ");
		jbutQuayLaiTT.setFont(new Font("Tahoma", Font.BOLD, 11));
		jbutQuayLaiTT.setBounds(697, 37, 170, 23);
		contentPane.add(jbutQuayLaiTT);
		jbutQuayLaiTT.addActionListener(qlnvAc);
		
		jbutLamMoi.addActionListener(qlnvAc);
		this.setVisible(true);
	}
	public void XuatraJtext(int row)
	{
		DefaultTableModel model_table = (DefaultTableModel) table.getModel();
		txtManv.setText(model_table.getValueAt(row, 0)+"");
		txtTenNV.setText(model_table.getValueAt(row, 1)+"");
		txtNgayVL.setText( model_table.getValueAt(row, 3)+"");
		txtSDT.setText("0"+model_table.getValueAt(row, 5));
		txtNGSinh.setText(model_table.getValueAt(row, 2) +"");
		txtEmail.setText(model_table.getValueAt(row, 7)+"");
		txtDC.setText(model_table.getValueAt(row, 4)+"");
		txtcccd.setText(model_table.getValueAt(row, 6)+"");
	}
	public void ChucNangTIm()
	{
		DefaultTableModel model_table= (DefaultTableModel) table.getModel();
		model_table.setRowCount(0);
		for (NhanVienModel i : NhanvienDAO.getInstance().selectByCondition(txtTimKiem.getText())) {
			model_table.addRow(new Object[] {i.getMaNV(), i.getTenNV(), i.getNgaySinh(), i.getNgayVaoLam(), 
					i.getDiachi(), i.getSodt(), i.getCccd(), i.getEmail()});
		}
		model_table.fireTableDataChanged();
	}
	public void ChucNangCapNhat()
	{
		NhanVienModel nvupdate = new NhanVienModel(txtManv.getText(), txtTenNV.getText(), Date.valueOf(txtNGSinh.getText()),
				Date.valueOf(txtNgayVL.getText()), txtDC.getText(), txtSDT.getText(), txtcccd.getText(), txtEmail.getText());
		NhanvienDAO.getInstance().update(nvupdate);
		ShowTable();
	}
	public void ChucNangThem()
	{
		NhanVienModel nvupdate = new NhanVienModel(txtManv.getText(), txtTenNV.getText(), Date.valueOf(txtNGSinh.getText()),
				Date.valueOf(txtNgayVL.getText()), txtDC.getText(), txtSDT.getText(), txtcccd.getText(), txtEmail.getText());
		NhanvienDAO.getInstance().insert(nvupdate);
		ShowTable();
	}
	public void ChucNangXoa()
	{
		NhanVienModel nvupdate = new NhanVienModel(txtManv.getText(), txtTenNV.getText(), Date.valueOf(txtNGSinh.getText()),
				Date.valueOf(txtNgayVL.getText()), txtDC.getText(), txtSDT.getText(), txtcccd.getText(), txtEmail.getText());
		if ( NhanvienDAO.getInstance().delete(nvupdate) == 1)
		{
			JOptionPane.showMessageDialog(this, "Xóa thành công");
		}
		else
		{
			JOptionPane.showMessageDialog(this, "Cần xóa khóa ngoại tham chiếu đến nhân viên này", "Lỗi SQL", JOptionPane.ERROR_MESSAGE);
		}
		ShowTable();
	}
	public void chucnang_quay_ve_trang_chu()
	{
		new QuanLiHomePageViewDesign(this.maql);
		this.dispose();
	}
	public void ShowTable()
	{
		DefaultTableModel model_table= (DefaultTableModel) table.getModel();
		model_table.setRowCount(0);
		for (NhanVienModel i : NhanvienDAO.getInstance().selectAll()) {
			model_table.addRow(new Object[] {i.getMaNV(), i.getTenNV(), i.getNgaySinh(), i.getNgayVaoLam(), 
					i.getDiachi(), i.getSodt(), i.getCccd(), i.getEmail()});
		}
		model_table.fireTableDataChanged();
	}
}
