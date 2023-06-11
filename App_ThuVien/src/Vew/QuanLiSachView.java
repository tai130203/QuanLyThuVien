package Vew;

import java.awt.EventQueue;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.ArrayList;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.JButton;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

import Controller.QLSachController;
import DB_util.connect_db;
import DataAccessObject.NhanvienDAO;
import DataAccessObject.SachDAO;
import Model.NhanVienModel;
import Model.SachModel;
import javax.swing.JScrollPane;
import javax.swing.ScrollPaneConstants;
import java.awt.Font;
import java.awt.Color;

public class QuanLiSachView extends JFrame {

	private JPanel contentPane;
	private JTextField txtTimKiem;
	private JTextField txtMaSach;
	private JTextField txtTenSach;
	private JTextField txtNXB;
	private JTextField txtNamXb;
	private JTextField txtatcgia;
	private JTextField txtSoLuong;
	private JTextField txtTinhTrang;
	private JTextField txtgia;
	private JTable table;
	private String maql;

	public QuanLiSachView(String mangql) {
		setTitle("QUẢN LÍ SÁCH");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 1000, 560);
		contentPane = new JPanel();
		contentPane.setBackground(new Color(227, 211, 155));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		this.maql = mangql;
		JLabel lblNewLabel = new JLabel("Nhập tên sách/mã sách");
		lblNewLabel.setBounds(20, 27, 134, 14);
		contentPane.add(lblNewLabel);
		
		txtTimKiem = new JTextField();
		txtTimKiem.setBounds(175, 24, 380, 20);
		contentPane.add(txtTimKiem);
		txtTimKiem.setColumns(10);
		
		QLSachController sqlac = new QLSachController(this);
		
		JButton btnNewButton = new JButton("Tìm kiếm");
		btnNewButton.setFont(new Font("Tahoma", Font.BOLD, 11));
		btnNewButton.setBounds(593, 23, 104, 23);
		contentPane.add(btnNewButton);
		btnNewButton.addActionListener(sqlac);
		
		JLabel lblNewLabel_1 = new JLabel("Mã Sách");
		lblNewLabel_1.setBounds(20, 337, 70, 14);
		contentPane.add(lblNewLabel_1);
		
		JLabel lblNewLabel_2 = new JLabel("Tên sách");
		lblNewLabel_2.setBounds(20, 362, 70, 14);
		contentPane.add(lblNewLabel_2);
		
		JLabel lblNewLabel_3 = new JLabel("Nhà xuất bản");
		lblNewLabel_3.setBounds(20, 387, 80, 14);
		contentPane.add(lblNewLabel_3);
		
		JLabel lblNewLabel_3_1 = new JLabel("Năm xuất bản");
		lblNewLabel_3_1.setBounds(20, 412, 80, 14);
		contentPane.add(lblNewLabel_3_1);
		
		JLabel lblNewLabel_3_2 = new JLabel("Tác giả");
		lblNewLabel_3_2.setBounds(558, 337, 46, 14);
		contentPane.add(lblNewLabel_3_2);
		
		JLabel lblNewLabel_3_3 = new JLabel("Số lượng");
		lblNewLabel_3_3.setBounds(558, 362, 89, 14);
		contentPane.add(lblNewLabel_3_3);
		
		JLabel lblNewLabel_3_4 = new JLabel("Tình trạng");
		lblNewLabel_3_4.setBounds(558, 387, 89, 14);
		contentPane.add(lblNewLabel_3_4);
		
		JLabel lblNewLabel_3_5 = new JLabel("Giá");
		lblNewLabel_3_5.setBounds(558, 413, 71, 14);
		contentPane.add(lblNewLabel_3_5);
		
		
		txtMaSach = new JTextField();
		txtMaSach.setBounds(105, 334, 400, 20);
		contentPane.add(txtMaSach);
		txtMaSach.setColumns(10);
		
		txtTenSach = new JTextField();
		txtTenSach.setColumns(10);
		txtTenSach.setBounds(105, 359, 400, 20);
		contentPane.add(txtTenSach);
		
		txtNXB = new JTextField();
		txtNXB.setColumns(10);
		txtNXB.setBounds(105, 384, 400, 20);
		contentPane.add(txtNXB);
		
		txtNamXb = new JTextField();
		txtNamXb.setColumns(10);
		txtNamXb.setBounds(105, 409, 400, 20);
		contentPane.add(txtNamXb);
		
		txtatcgia = new JTextField();
		txtatcgia.setColumns(10);
		txtatcgia.setBounds(633, 334, 300, 20);
		contentPane.add(txtatcgia);
		
		txtSoLuong = new JTextField();
		txtSoLuong.setColumns(10);
		txtSoLuong.setBounds(633, 362, 300, 20);
		contentPane.add(txtSoLuong);
		
		txtTinhTrang = new JTextField();
		txtTinhTrang.setColumns(10);
		txtTinhTrang.setBounds(633, 384, 300, 20);
		contentPane.add(txtTinhTrang);
		
		txtgia = new JTextField();
		txtgia.setColumns(10);
		txtgia.setBounds(633, 409, 300, 20);
		contentPane.add(txtgia);
		
		table = new JTable();
		table.setModel(new DefaultTableModel(
			new Object[][] {
			},
			new String[] {
				"M\u00E3 S\u00E1ch", "T\u00EAn s\u00E1ch", "Nh\u00E0 Xu\u1EA5t B\u1EA3n", "N\u0103m xu\u1EA5t b\u1EA3n", "T\u00E1c gi\u1EA3", "S\u00F4 l\u01B0\u1EE3ng", "T\u00ECnh tr\u1EA1ng", "Gi\u00E1"
			}
		) {
			boolean[] columnEditables = new boolean[] {
				false, false, false, false, false, false, false, false
			};
			public boolean isCellEditable(int row, int column) {
				return columnEditables[column];
			}
		});
		table.getColumnModel().getColumn(0).setPreferredWidth(50);
		table.getColumnModel().getColumn(1).setPreferredWidth(170);
		table.getColumnModel().getColumn(2).setPreferredWidth(118);
		table.getColumnModel().getColumn(3).setPreferredWidth(90);
		table.getColumnModel().getColumn(4).setPreferredWidth(73);
		table.getColumnModel().getColumn(5).setPreferredWidth(15);
		table.getColumnModel().getColumn(6).setPreferredWidth(30);
		table.getColumnModel().getColumn(7).setPreferredWidth(30);
		
// add mouse listener
		table.addMouseListener( new MouseAdapter(){
			@Override
			public void mouseClicked(MouseEvent e) {
				xuatRajText(table.getSelectedRow());
			}
		});
		
		DefaultTableModel table_model = (DefaultTableModel)table.getModel();
		try {
			ArrayList<SachModel> listSach = SachDAO.getinstance().selectAll();
			
			for(SachModel i:listSach)
			{
				table_model.addRow(new Object[] {i.getMASACH(), i.getTENSACH(), i.getNXB(), 
						i.getNAMXB(), i.getTACGIA(),  i.getSOLUONG(), i.getTINHTRANG(), i.getGIA()});
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		table.setBounds(27, 52, 919, 241);
		//contentPane.add(table);
		
		JScrollPane scrollPane = new JScrollPane(table);
		scrollPane.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
		scrollPane.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_ALWAYS);
		scrollPane.setBounds(30, 52, 919, 241);
		contentPane.add(scrollPane);
		
		JButton jbutThemSach = new JButton("Thêm sách");
		jbutThemSach.setFont(new Font("Tahoma", Font.BOLD, 11));
		jbutThemSach.setBounds(135, 468, 152, 23);
		contentPane.add(jbutThemSach);
		jbutThemSach.addActionListener(sqlac);

		
		JButton jbutXoaSach = new JButton("Xóa sách");
		jbutXoaSach.setFont(new Font("Tahoma", Font.BOLD, 11));
		jbutXoaSach.setBounds(346, 468, 152, 23);
		contentPane.add(jbutXoaSach);
		jbutXoaSach.addActionListener(sqlac);

		
		JButton jbutCapNhatSach = new JButton("Cập nhật sách");
		jbutCapNhatSach.setFont(new Font("Tahoma", Font.BOLD, 11));
		jbutCapNhatSach.setBounds(536, 468, 152, 23);
		contentPane.add(jbutCapNhatSach);
		jbutCapNhatSach.addActionListener(sqlac);
		
		JButton jbutLamMoi = new JButton("Làm mới bảng");
		jbutLamMoi.setFont(new Font("Tahoma", Font.BOLD, 11));
		jbutLamMoi.setBounds(723, 468, 152, 23);
		contentPane.add(jbutLamMoi);
		
		JButton jbutQuayLai = new JButton("Trở lại trang chủ");
		jbutQuayLai.setFont(new Font("Tahoma", Font.BOLD, 11));
		jbutQuayLai.setBounds(816, 24, 158, 20);
		contentPane.add(jbutQuayLai);
		jbutQuayLai.addActionListener(sqlac);
		jbutLamMoi.addActionListener(sqlac);

		this.setLocationRelativeTo(null);
		this.setVisible(true);
	}
	public void xuatRajText(int row)
	{
		DefaultTableModel table_model = (DefaultTableModel) table.getModel();
		txtMaSach.setText(table_model.getValueAt(row, 0)+"");
		txtTenSach.setText(table_model.getValueAt(row, 1)+"");
		txtNXB.setText(table_model.getValueAt(row, 2)+"");
		txtNamXb.setText(table_model.getValueAt(row, 3)+"");
		txtatcgia.setText(table_model.getValueAt(row, 4)+"");
		txtSoLuong.setText(table_model.getValueAt(row, 5)+"");
		txtTinhTrang.setText(table_model.getValueAt(row, 6)+"");
		txtgia.setText(table_model.getValueAt(row, 7)+"");
	}
	public void ChucNangThem()
	{
		SachModel sachmoi = new SachModel(txtMaSach.getText(), txtTenSach.getText(), txtNXB.getText(), 
				txtNamXb.getText(), txtatcgia.getText(), Integer.valueOf(txtSoLuong.getText()),
				txtTinhTrang.getText(),txtgia.getText());
		SachDAO.getinstance().insert(sachmoi);
		showtable();
	}
	public void ChucNangXoa() {
		SachModel sach = new SachModel(txtMaSach.getText(), txtTenSach.getText(), txtNXB.getText(), 
				txtNamXb.getText(), txtatcgia.getText(), Integer.valueOf(txtSoLuong.getText()),
				txtTinhTrang.getText(),txtgia.getText());
		SachDAO.getinstance().delete(sach);
		showtable();
	}
	public void ChucNangCapNhat()
	{
		SachModel sach = new SachModel(txtMaSach.getText(), txtTenSach.getText(), txtNXB.getText(), 
				txtNamXb.getText(), txtatcgia.getText(), Integer.valueOf(txtSoLuong.getText()),
				txtTinhTrang.getText(),txtgia.getText());
		SachDAO.getinstance().update(sach);
		showtable();
	}
	public void ChucNangTimSach()
	{
		DefaultTableModel model_table=  (DefaultTableModel) table.getModel();
		model_table.setRowCount(0);
		for(SachModel i: SachDAO.getinstance().selectByCondition(txtTimKiem.getText()))
		{
			model_table.addRow(new Object [] {i.getMASACH(), i.getTENSACH(), i.getNXB(), i.getNAMXB(), i.getTACGIA(),
					i.getSOLUONG(), i.getTINHTRANG(), i.getGIA()});
		}
		model_table.fireTableDataChanged();
	}
	public void chucnang_Quay_Lai_Trang_Chu()
	{
		new QuanLiHomePageViewDesign(maql);
		this.dispose();
	}
	public void showtable()
	{
		DefaultTableModel model_table=  (DefaultTableModel) table.getModel();
		model_table.setRowCount(0);
		for(SachModel i: SachDAO.getinstance().selectAll())
		{
			model_table.addRow(new Object [] {i.getMASACH(), i.getTENSACH(), i.getNXB(), i.getNAMXB(), i.getTACGIA(),
					i.getSOLUONG(), i.getTINHTRANG(), i.getGIA()});
		}
		model_table.fireTableDataChanged();
	}
}
