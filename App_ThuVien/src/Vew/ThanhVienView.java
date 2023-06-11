package Vew;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.JButton;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

import Controller.ThanVienActionListener;
import DataAccessObject.MuonTraSachDAO;
import DataAccessObject.SachDAO;
import DataAccessObject.ThanhvienDAO;
import Model.MuonTraSachModel;
import Model.SachModel;
import Model.ThanhVienModel;

import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.swing.JScrollPane;
import javax.swing.ScrollPaneConstants;
import javax.swing.DropMode;
import java.awt.Color;
import javax.swing.SwingConstants;
import javax.swing.JTextArea;

public class ThanhVienView extends JFrame {

	private JPanel contentPane;
	private JTable tableSach;
	private JTable tableMuonSach;
	private JTextField txtMaTv;
	private JTextField txtnhanvien;
	private JTextField txtMaSach;
	private ThanhVienModel tvModel;
	private JTextField txtTimKiem;
	private JTextField txtngaymuon;
	private JTextField txtngaytra;
	private JTextField txtghichu;

	public ThanhVienView(String matv) {

		this.tvModel = new ThanhVienModel();
		this.tvModel = ThanhvienDAO.getINstance().LayThongTin(matv);
		this.setTitle("Trang thành viên");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 906, 793);
		contentPane = new JPanel();
		contentPane.setBackground(new Color(223, 222, 159));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

		setContentPane(contentPane);
		contentPane.setLayout(null);

		ThanVienActionListener tvac = new ThanVienActionListener(this);
		JMenuBar jmenuBar = new JMenuBar();

		JMenu jmenu_file = new JMenu("File");
		JMenuItem jmenuitem_Change_password = new JMenuItem("Doi mat khau");
		jmenuitem_Change_password.addActionListener(tvac);
		JMenuItem jmennuitem_dangxuat = new JMenuItem("Dang xuat tai khoan");
		jmennuitem_dangxuat.addActionListener(tvac);
		jmenu_file.add(jmenuitem_Change_password);
		jmenu_file.add(jmennuitem_dangxuat);

		JMenu jmenu_help = new JMenu("Help");
		JMenuItem jmenuitem_about = new JMenuItem("About us");
		jmenuitem_about.addActionListener(tvac);
		JMenuItem jmenItem_morehelp = new JMenuItem("More help");
		jmenItem_morehelp.addActionListener(tvac);
		jmenu_help.add(jmenuitem_about);
		jmenu_help.add(jmenItem_morehelp);

		jmenuBar.add(jmenu_file);
		jmenuBar.add(jmenu_help);

		JLabel jlabTen = new JLabel(this.tvModel.getTentv());
		jlabTen.setBackground(new Color(213, 214, 169));
		jlabTen.setHorizontalAlignment(SwingConstants.CENTER);
		jlabTen.setForeground(new Color(203, 126, 116));
		jlabTen.setFont(new Font("Tahoma", Font.BOLD, 20));
		jlabTen.setBounds(221, 11, 469, 41);
		contentPane.add(jlabTen);

		JLabel jlabTimKiem = new JLabel("Nhập mã sách");
		jlabTimKiem.setFont(new Font("Tahoma", Font.PLAIN, 13));
		jlabTimKiem.setBounds(10, 192, 98, 14);
		contentPane.add(jlabTimKiem);

		JButton jbutTimKiem = new JButton("Tìm kiếm");
		jbutTimKiem.setBounds(480, 189, 89, 23);
		contentPane.add(jbutTimKiem);
		jbutTimKiem.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				ChucNangTimSach();
			}
		});

		txtMaTv = new JTextField();
		txtMaTv.setBounds(27, 663, 138, 20);
		contentPane.add(txtMaTv);
		txtMaTv.setColumns(10);

		txtnhanvien = new JTextField();
		txtnhanvien.setFont(new Font("Tahoma", Font.PLAIN, 11));
		txtnhanvien.setForeground(new Color(0, 0, 0));
		txtnhanvien.setBounds(27, 694, 138, 20);
		contentPane.add(txtnhanvien);
		txtnhanvien.setColumns(10);

		txtMaSach = new JTextField();
		txtMaSach.setBounds(221, 694, 138, 20);
		contentPane.add(txtMaSach);
		txtMaSach.setColumns(10);

		JButton jbutGiahan = new JButton("Gia Hạn");
		jbutGiahan.setForeground(new Color(119, 53, 9));
		jbutGiahan.setFont(new Font("Tahoma", Font.BOLD, 13));
		jbutGiahan.setBounds(581, 689, 89, 27);
		contentPane.add(jbutGiahan);
		jbutGiahan.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				chucnangGiaHan();
			}
		});

		txtTimKiem = new JTextField();
		txtTimKiem.setBounds(123, 187, 337, 27);
		contentPane.add(txtTimKiem);
		txtTimKiem.setColumns(10);

		tableSach = new JTable();
		tableSach.setModel(new DefaultTableModel(new Object[][] {},
				new String[] { "M\u00E3 S\u00E1ch", "T\u00EAn s\u00E1ch", "Nh\u00E0 Xu\u1EA5t B\u1EA3n",
						"N\u0103m xu\u1EA5t b\u1EA3n", "T\u00E1c gi\u1EA3", "S\u00F4 l\u01B0\u1EE3ng",
						"T\u00ECnh tr\u1EA1ng", "Gi\u00E1" }) {
			boolean[] columnEditables = new boolean[] { false, false, false, false, false, false, false, false };

			public boolean isCellEditable(int row, int column) {
				return columnEditables[column];
			}
		});
		tableSach.getColumnModel().getColumn(0).setPreferredWidth(77);
		tableSach.getColumnModel().getColumn(1).setPreferredWidth(76);
		tableSach.getColumnModel().getColumn(2).setPreferredWidth(76);
		tableSach.getColumnModel().getColumn(3).setPreferredWidth(76);
		tableSach.getColumnModel().getColumn(4).setPreferredWidth(76);
		tableSach.getColumnModel().getColumn(5).setPreferredWidth(76);
		tableSach.getColumnModel().getColumn(6).setPreferredWidth(77);
		tableSach.getColumnModel().getColumn(7).setPreferredWidth(76);
		tableSach.setBounds(27, 119, 839, 137);

		showtable();
		JLabel jlabMuonSach = new JLabel("Sách đang mượn");
		jlabMuonSach.setFont(new Font("Tahoma", Font.BOLD, 17));
		jlabMuonSach.setBounds(372, 455, 183, 23);
		contentPane.add(jlabMuonSach);

		tableMuonSach = new JTable();
		tableMuonSach.setModel(new DefaultTableModel(new Object[][] {},
				new String[] { "M\u00E3 th\u00E0nh vi\u00EAn", "M\u00E3 nh\u00E2n vi\u00EAn", "M\u00E3 s\u00E1ch",
						"Ng\u00E0y m\u01B0\u1EE3n", "Ng\u00E0y tr\u1EA3", "Ghi ch\u00FA" }) {
			boolean[] columnEditables = new boolean[] { false, false, false, false, false, false };

			public boolean isCellEditable(int row, int column) {
				return columnEditables[column];
			}
		});
		tableMuonSach.getColumnModel().getColumn(0).setResizable(false);
		tableMuonSach.getColumnModel().getColumn(0).setPreferredWidth(76);
		tableMuonSach.getColumnModel().getColumn(1).setResizable(false);
		tableMuonSach.getColumnModel().getColumn(1).setPreferredWidth(76);
		tableMuonSach.getColumnModel().getColumn(2).setResizable(false);
		tableMuonSach.getColumnModel().getColumn(2).setPreferredWidth(76);
		tableMuonSach.getColumnModel().getColumn(3).setResizable(false);
		tableMuonSach.getColumnModel().getColumn(3).setPreferredWidth(76);
		tableMuonSach.getColumnModel().getColumn(4).setResizable(false);
		tableMuonSach.getColumnModel().getColumn(4).setPreferredWidth(76);
		tableMuonSach.getColumnModel().getColumn(5).setResizable(false);
		tableMuonSach.getColumnModel().getColumn(5).setPreferredWidth(76);
		tableMuonSach.setBounds(39, 349, 817, 180);

		tableMuonSach.addMouseListener(new MouseAdapter() {
			public void mouseClicked(MouseEvent e) {
				XuatRaJtextField(tableMuonSach.getSelectedRow());
			}
		});
		DefaultTableModel tableMTSach_model = (DefaultTableModel) tableMuonSach.getModel();
		try {

			ArrayList<MuonTraSachModel> listMTSach = MuonTraSachDAO.getInstance()
					.selectByCondition(this.tvModel.getMatv());
			for (MuonTraSachModel i : listMTSach) {
				tableMTSach_model.addRow(new Object[] { i.getMaTv(), i.getMaNv(), i.getMaSach(), i.getNgayMuon(),
						i.getNgayTra(), i.getGhiChu() });
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		JScrollPane jscrolSach = new JScrollPane(tableSach);
		jscrolSach.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
		jscrolSach.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_ALWAYS);
		jscrolSach.setBounds(27, 225, 839, 219);
		contentPane.add(jscrolSach);

		JScrollPane jscrolMUONSACH = new JScrollPane(tableMuonSach);
		jscrolMUONSACH.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
		jscrolMUONSACH.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_ALWAYS);
		jscrolMUONSACH.setBounds(27, 489, 839, 154);
		contentPane.add(jscrolMUONSACH);

		txtngaymuon = new JTextField();
		txtngaymuon.setForeground(new Color(0, 0, 0));
		txtngaymuon.setFont(new Font("Tahoma", Font.PLAIN, 11));
		txtngaymuon.setColumns(10);
		txtngaymuon.setBounds(221, 663, 138, 20);
		contentPane.add(txtngaymuon);

		txtngaytra = new JTextField();
		txtngaytra.setForeground(Color.RED);
		txtngaytra.setFont(new Font("Tahoma", Font.BOLD, 11));
		txtngaytra.setColumns(10);
		txtngaytra.setBounds(399, 663, 138, 20);
		contentPane.add(txtngaytra);

		txtghichu = new JTextField();
		txtghichu.setForeground(Color.RED);
		txtghichu.setFont(new Font("Tahoma", Font.BOLD, 11));
		txtghichu.setColumns(10);
		txtghichu.setBounds(399, 694, 138, 20);
		contentPane.add(txtghichu);

		JTextArea textArea = new JTextArea(
				"Mã thành viên: " + this.tvModel.getMatv() + "\t\tTên thành viên:" + this.tvModel.getTentv()
						+ "\nMã đơn vị: " + this.tvModel.getMadv() + "\t\tNgày Sinh: " + this.tvModel.getNgaysinh()
						+ "\nĐịa chỉ: " + this.tvModel.getDiachi() + "\t\tSố điện thoại: " + this.tvModel.getSodt()
						+ "\nEmail: " + this.tvModel.getEmail() + "\t\tNgày đăng ký : " + this.tvModel.getNgayDKTV());
		textArea.setEditable(false);
		textArea.setFont(new Font("Arial", Font.PLAIN, 22));
		textArea.setForeground(new Color(95, 65, 33));
		textArea.setBounds(27, 63, 839, 106);
		contentPane.add(textArea);

		this.setJMenuBar(jmenuBar);

		this.setVisible(true);
		this.setLocationRelativeTo(null);

	}

	public void ChucNangTimSach() {
		DefaultTableModel model_table = (DefaultTableModel) tableSach.getModel();
		model_table.setRowCount(0);
		for (SachModel i : SachDAO.getinstance().selectByCondition(txtTimKiem.getText())) {
			model_table.addRow(new Object[] { i.getMASACH(), i.getTENSACH(), i.getNXB(), i.getNAMXB(), i.getTACGIA(),
					i.getSOLUONG(), i.getTINHTRANG(), i.getGIA() });
		}
		model_table.fireTableDataChanged();

	}

	public void XuatRaJtextField(int row) {
		DefaultTableModel model_table = (DefaultTableModel) tableMuonSach.getModel();
		txtMaTv.setText(model_table.getValueAt(row, 0) + "");
		txtnhanvien.setText(model_table.getValueAt(row, 1) + "");
		txtMaSach.setText(model_table.getValueAt(row, 2) + "");
		txtngaymuon.setText(model_table.getValueAt(row, 3) + "");
		txtngaytra.setText(model_table.getValueAt(row, 4) + "");
		txtghichu.setText(model_table.getValueAt(row, 5) + "");
	}

	public void chucnangGiaHan() {
		String ngaymuon = txtngaymuon.getText();
		String ngaytra = txtngaytra.getText();
		SimpleDateFormat inputformat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date ngaymuondate = null;
		java.util.Date ngaytradate = null;

		try {
			ngaymuondate = inputformat.parse(ngaymuon);
			ngaytradate = inputformat.parse(ngaytra);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		java.util.Calendar calNgaytra = java.util.Calendar.getInstance();
		calNgaytra.setTime(ngaytradate);
		calNgaytra.add(java.util.Calendar.MONTH, 1);

		java.sql.Date sqlDateNgaymuon = new java.sql.Date(ngaymuondate.getTime());
		java.sql.Date sqlDateNgaytraMoi = new java.sql.Date(calNgaytra.getTimeInMillis());

		// Định dạng lại đối tượng sqlDateNgaytraMoi
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
		String formattedDate = sdf.format(sqlDateNgaytraMoi);
		sqlDateNgaytraMoi = java.sql.Date.valueOf(formattedDate);

		MuonTraSachModel mts = new MuonTraSachModel(txtMaTv.getText(), txtnhanvien.getText(), txtMaSach.getText(),
				sqlDateNgaymuon, sqlDateNgaytraMoi, "Gia hạn");
		MuonTraSachDAO.getInstance().update(mts);
		JOptionPane.showMessageDialog(this, "Gia hạn thành công", "Thành công", JOptionPane.DEFAULT_OPTION);
		DefaultTableModel tableMTSach_model = (DefaultTableModel) tableMuonSach.getModel();
		tableMTSach_model.setRowCount(0);
		try {

			ArrayList<MuonTraSachModel> listMTSach = MuonTraSachDAO.getInstance()
					.selectByCondition(this.tvModel.getMatv());
			for (MuonTraSachModel i : listMTSach) {
				tableMTSach_model.addRow(new Object[] { i.getMaTv(), i.getMaNv(), i.getMaSach(), i.getNgayMuon(),
						i.getNgayTra(), i.getGhiChu() });
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void showtable() {
		DefaultTableModel model_table = (DefaultTableModel) tableSach.getModel();
		model_table.setRowCount(0);
		for (SachModel i : SachDAO.getinstance().selectAll()) {
			model_table.addRow(new Object[] { i.getMASACH(), i.getTENSACH(), i.getNXB(), i.getNAMXB(), i.getTACGIA(),
					i.getSOLUONG(), i.getTINHTRANG(), i.getGIA() });
		}
		model_table.fireTableDataChanged();
	}

	public void chunangDoiMk() {
		new DoiMKViewDesign(tvModel);
		this.dispose();
	}
}
