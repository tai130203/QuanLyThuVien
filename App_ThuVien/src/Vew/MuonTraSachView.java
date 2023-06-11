package Vew;

import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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

import DataAccessObject.MuonTraSachDAO;
import DataAccessObject.ThanhvienDAO;
import Model.MuonTraSachModel;
import Model.SachModel;
import Model.ThanhVienModel;

import javax.swing.JScrollPane;
import javax.swing.ScrollPaneConstants;
import java.awt.Color;
import java.awt.Font;

public class MuonTraSachView extends JFrame {

	private JPanel contentPane;
	private JTextField txtTimKiem;
	private JTable table;
	private JTextField txtmatv;
	private JTextField txtmanv;
	private JTextField txtMASACH;
	private JTextField txtngmuon;
	private JTextField txtngtra;
	private JTextField txtghichu;
	private String maql;


	public MuonTraSachView(String mangql) {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 811, 486);
		contentPane = new JPanel();
		contentPane.setBackground(new Color(221, 226, 156));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		this.setTitle("MƯỢN TRẢ SÁCH");
		
		setContentPane(contentPane);
		contentPane.setLayout(null);
		this.maql = mangql;
		
		JLabel jlabTimKiem = new JLabel("Nhập mã thành viên");
		jlabTimKiem.setBounds(10, 21, 134, 14);
		contentPane.add(jlabTimKiem);
		
		txtTimKiem = new JTextField();
		txtTimKiem.setBounds(154, 18, 299, 20);
		contentPane.add(txtTimKiem);
		txtTimKiem.setColumns(10);
		
		JButton jbutTimKiem = new JButton("Tìm");
		jbutTimKiem.setFont(new Font("Tahoma", Font.BOLD, 13));
		jbutTimKiem.setForeground(new Color(43, 85, 61));
		jbutTimKiem.setBounds(474, 17, 89, 23);
		contentPane.add(jbutTimKiem);
		jbutTimKiem.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
					ChucNangTim(txtTimKiem.getText());
			}
		});
		
		table = new JTable();
		table.setModel(new DefaultTableModel(
			new Object[][] {
			},
			new String[] {
				"M\u00E3 th\u00E0nh vi\u00EAn", "M\u00E3 nh\u00E2n vi\u00EAn", "M\u00E3 s\u00E1ch", "Ng\u00E0y m\u01B0\u1EE3n", "Ng\u00E0y tr\u1EA3", "Ghi ch\u00FA"
			}
		) {
			boolean[] columnEditables = new boolean[] {
				false, false, false, false, false, false
			};
			public boolean isCellEditable(int row, int column) {
				return columnEditables[column];
			}
		});
		table.getColumnModel().getColumn(0).setResizable(false);
		table.getColumnModel().getColumn(0).setPreferredWidth(76);
		table.getColumnModel().getColumn(1).setResizable(false);
		table.getColumnModel().getColumn(1).setPreferredWidth(76);
		table.getColumnModel().getColumn(2).setResizable(false);
		table.getColumnModel().getColumn(2).setPreferredWidth(76);
		table.getColumnModel().getColumn(3).setResizable(false);
		table.getColumnModel().getColumn(3).setPreferredWidth(76);
		table.getColumnModel().getColumn(4).setResizable(false);
		table.getColumnModel().getColumn(4).setPreferredWidth(76);
		table.getColumnModel().getColumn(5).setResizable(false);
		table.getColumnModel().getColumn(5).setPreferredWidth(76);
		table.setBounds(24, 64, 750, 256);
		
		showtable(MuonTraSachDAO.getInstance().selectAll());
		table.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e)
			{
				xuatRaJtext(table.getSelectedRow());
			}
		});
		
		
		JButton jbutThem = new JButton("Thêm");
		jbutThem.setFont(new Font("Tahoma", Font.BOLD, 11));
		jbutThem.setForeground(new Color(43, 85, 61));
		jbutThem.setBounds(624, 343, 107, 23);
		contentPane.add(jbutThem);
		jbutThem.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				chucnangThem();
			}
		});
		
		JButton jbutCapNhat = new JButton("Cập nhật");
		jbutCapNhat.setForeground(new Color(43, 85, 61));
		jbutCapNhat.setFont(new Font("Tahoma", Font.BOLD, 11));
		jbutCapNhat.setBounds(624, 377, 107, 23);
		contentPane.add(jbutCapNhat);
		jbutCapNhat.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				chucnangCapNhat();
			}
		});
		
		JButton jbutLamMoi = new JButton("Làm mới");
		jbutLamMoi.setForeground(new Color(43, 85, 61));
		jbutLamMoi.setFont(new Font("Tahoma", Font.BOLD, 11));
		jbutLamMoi.setBounds(624, 411, 107, 23);
		contentPane.add(jbutLamMoi);
		jbutLamMoi.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				showtable(MuonTraSachDAO.getInstance().selectAll());
			}
		});
		
		JScrollPane scrollPane = new JScrollPane(table);
		scrollPane.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
		scrollPane.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_ALWAYS);
		scrollPane.setBounds(24, 64, 750, 256);
		contentPane.add(scrollPane);
		
		JLabel jlabMATV = new JLabel("Mã thành viên");
		jlabMATV.setBounds(10, 347, 89, 14);
		contentPane.add(jlabMATV);
		
		JLabel jlabMANV = new JLabel("Mã nhân viên");
		jlabMANV.setBounds(10, 381, 82, 14);
		contentPane.add(jlabMANV);
		
		JLabel jlabMASACH = new JLabel("Mã sách");
		jlabMASACH.setBounds(10, 415, 82, 14);
		contentPane.add(jlabMASACH);
		
		JLabel jlabNgayMuon = new JLabel("Ngày mượn");
		jlabNgayMuon.setBounds(293, 347, 93, 14);
		contentPane.add(jlabNgayMuon);
		
		JLabel jlabNgayTra = new JLabel("Ngày trả");
		jlabNgayTra.setBounds(293, 381, 66, 14);
		contentPane.add(jlabNgayTra);
		
		JLabel jlabGhiChu = new JLabel("Ghi chú");
		jlabGhiChu.setBounds(293, 415, 66, 14);
		contentPane.add(jlabGhiChu);
		
		txtmatv = new JTextField();
		txtmatv.setBounds(100, 344, 140, 20);
		contentPane.add(txtmatv);
		txtmatv.setColumns(10);
		
		txtmanv = new JTextField();
		txtmanv.setColumns(10);
		txtmanv.setBounds(102, 378, 140, 20);
		contentPane.add(txtmanv);
		
		txtMASACH = new JTextField();
		txtMASACH.setColumns(10);
		txtMASACH.setBounds(100, 412, 140, 20);
		contentPane.add(txtMASACH);
		
		txtngmuon = new JTextField();
		txtngmuon.setColumns(10);
		txtngmuon.setBounds(396, 344, 140, 20);
		contentPane.add(txtngmuon);
		
		txtngtra = new JTextField();
		txtngtra.setColumns(10);
		txtngtra.setBounds(396, 378, 140, 20);
		contentPane.add(txtngtra);
		
		txtghichu = new JTextField();
		txtghichu.setFont(new Font("Tahoma", Font.BOLD, 11));
		txtghichu.setForeground(new Color(255, 0, 0));
		txtghichu.setColumns(10);
		txtghichu.setBounds(396, 412, 140, 20);
		contentPane.add(txtghichu);
		
		JButton btnQuayLiTrang = new JButton("Quay Lại Trang Chủ");
		btnQuayLiTrang.setForeground(new Color(43, 85, 61));
		btnQuayLiTrang.setFont(new Font("Tahoma", Font.BOLD, 13));
		btnQuayLiTrang.setBounds(597, 17, 177, 23);
		btnQuayLiTrang.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				chucnang_quay_ve_trang_chu();
			}
		});
		contentPane.add(btnQuayLiTrang);
		
		
		this.setVisible(true);
		this.setLocationRelativeTo(null);
	}
	public void xuatRaJtext(int row)
	{
		DefaultTableModel model_table = (DefaultTableModel) table.getModel();
		
		txtmatv.setText(model_table.getValueAt(row, 0)+"");
		txtmanv.setText(model_table.getValueAt(row, 1)+"");
		txtMASACH.setText(model_table.getValueAt(row, 2)+"");
		txtngmuon.setText(model_table.getValueAt(row, 3)+"");
		txtngtra.setText(model_table.getValueAt(row, 4)+"");
		txtghichu.setText(model_table.getValueAt(row, 5)+"");
	}
	public void ChucNangTim(String matv)
	{
		if(matv.equals(""))
		{
			JOptionPane.showMessageDialog(this, "Vui lòng nhập mã thành viên, không được để trống");
		}
		else
		{
			showtable(MuonTraSachDAO.getInstance().selectByCondition(matv));
		}
	}
	public void chucnang_quay_ve_trang_chu()
	{
		new NhanvVIenHomePageViewDesign(this.maql);
		this.dispose();
	}
	public void chucnangThem()
	{
		String ngaymuon = txtngmuon.getText();
		String ngaytra = txtngtra.getText();
		SimpleDateFormat inputformat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date  ngaymuondate = null;
		java.util.Date ngaytradate = null;

		try {
			ngaymuondate = inputformat.parse(ngaymuon);
			ngaytradate = inputformat.parse(ngaytra);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		java.sql.Date sqlDateNgaymuon = new java.sql.Date(ngaymuondate.getTime());
		java.sql.Date sqlDateNgaytra = new java.sql.Date(ngaytradate.getTime());

		MuonTraSachModel mts = new MuonTraSachModel(txtmatv.getText(), this.maql, txtMASACH.getText(), sqlDateNgaymuon,
				sqlDateNgaytra, txtghichu.getText());
		MuonTraSachDAO.getInstance().insert(mts);
		showtable(MuonTraSachDAO.getInstance().selectAll());
	}
	public void chucnangCapNhat()
	{
		String ngaymuon = txtngmuon.getText();
		String ngaytra = txtngtra.getText();
		SimpleDateFormat inputformat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date  ngaymuondate = null;
		java.util.Date ngaytradate = null;

		try {
			ngaymuondate = inputformat.parse(ngaymuon);
			ngaytradate = inputformat.parse(ngaytra);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		java.sql.Date sqlDateNgaymuon = new java.sql.Date(ngaymuondate.getTime());
		java.sql.Date sqlDateNgaytra = new java.sql.Date(ngaytradate.getTime());

		MuonTraSachModel mts = new MuonTraSachModel(txtmatv.getText(), txtmanv.getText(), txtMASACH.getText(), sqlDateNgaymuon,
				sqlDateNgaytra, txtghichu.getText());
		MuonTraSachDAO.getInstance().update(mts);
		showtable(MuonTraSachDAO.getInstance().selectAll());
	}
	public void showtable(ArrayList<MuonTraSachModel> listMTS)
	{
		DefaultTableModel model_table = (DefaultTableModel) table.getModel();
		model_table.setRowCount(0);
		
		for(MuonTraSachModel i:listMTS)
		{
			model_table.addRow(new Object[] {i.getMaTv(), i.getMaNv(), i.getMaSach(), i.getNgayMuon(), i.getNgayTra(),
					i.getGhiChu()});
		}
		model_table.fireTableDataChanged();
	}
}
