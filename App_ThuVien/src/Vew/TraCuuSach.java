package Vew;

import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
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

import DB_util.connect_db;
import DataAccessObject.NhanvienDAO;
import DataAccessObject.SachDAO;
import Model.NhanVienModel;
import Model.SachModel;
import javax.swing.JScrollPane;
import javax.swing.ScrollPaneConstants;

public class TraCuuSach extends JFrame {

	private JPanel contentPane;
	private JTextField textField;
	private JTextField textField_1;
	private JTextField textField_2;
	private JTextField textField_3;
	private JTextField textField_4;
	private JTextField textField_5;
	private JTextField textField_6;
	private JTextField textField_7;
	private JTextField textField_8;
	private JTable table;

	public TraCuuSach() {
		setTitle("SÁCH");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 1000, 500);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblNewLabel = new JLabel("Nhập tên sách/mã sách");
		lblNewLabel.setBounds(20, 27, 134, 14);
		contentPane.add(lblNewLabel);
		
		textField = new JTextField();
		textField.setBounds(175, 24, 380, 20);
		contentPane.add(textField);
		textField.setColumns(10);
		
		JButton btnNewButton = new JButton("Tìm kiếm");
		btnNewButton.setBounds(608, 23, 89, 23);
		contentPane.add(btnNewButton);
		btnNewButton.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				ChucNangTimSach(textField.getText());
			}
		});
		
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
		
		
		textField_1 = new JTextField();
		textField_1.setBounds(105, 334, 400, 20);
		contentPane.add(textField_1);
		textField_1.setColumns(10);
		
		textField_2 = new JTextField();
		textField_2.setColumns(10);
		textField_2.setBounds(105, 359, 400, 20);
		contentPane.add(textField_2);
		
		textField_3 = new JTextField();
		textField_3.setColumns(10);
		textField_3.setBounds(105, 384, 400, 20);
		contentPane.add(textField_3);
		
		textField_4 = new JTextField();
		textField_4.setColumns(10);
		textField_4.setBounds(105, 409, 400, 20);
		contentPane.add(textField_4);
		
		textField_5 = new JTextField();
		textField_5.setColumns(10);
		textField_5.setBounds(633, 334, 300, 20);
		contentPane.add(textField_5);
		
		textField_6 = new JTextField();
		textField_6.setColumns(10);
		textField_6.setBounds(633, 362, 300, 20);
		contentPane.add(textField_6);
		
		textField_7 = new JTextField();
		textField_7.setColumns(10);
		textField_7.setBounds(633, 384, 300, 20);
		contentPane.add(textField_7);
		
		textField_8 = new JTextField();
		textField_8.setColumns(10);
		textField_8.setBounds(633, 409, 300, 20);
		contentPane.add(textField_8);
		
		table = new JTable();
		table.setModel(new DefaultTableModel(
			new Object[][] {
				{null, null, null, null, null, null, null, null},
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
		table.getColumnModel().getColumn(0).setResizable(false);
		table.getColumnModel().getColumn(0).setPreferredWidth(50);
		table.getColumnModel().getColumn(1).setResizable(false);
		table.getColumnModel().getColumn(1).setPreferredWidth(170);
		table.getColumnModel().getColumn(2).setResizable(false);
		table.getColumnModel().getColumn(2).setPreferredWidth(170);
		table.getColumnModel().getColumn(3).setResizable(false);
		table.getColumnModel().getColumn(3).setPreferredWidth(20);
		table.getColumnModel().getColumn(4).setResizable(false);
		table.getColumnModel().getColumn(4).setPreferredWidth(73);
		table.getColumnModel().getColumn(5).setResizable(false);
		table.getColumnModel().getColumn(5).setPreferredWidth(10);
		table.getColumnModel().getColumn(6).setResizable(false);
		table.getColumnModel().getColumn(6).setPreferredWidth(30);
		table.getColumnModel().getColumn(7).setResizable(false);
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
		
		JScrollPane scrollPane = new JScrollPane(table);
		scrollPane.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
		scrollPane.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_ALWAYS);
		scrollPane.setBounds(30, 52, 919, 241);
		contentPane.add(scrollPane);
		this.setLocationRelativeTo(null);
		this.setVisible(true);
	}
	public void xuatRajText(int row)
	{
		DefaultTableModel table_model = (DefaultTableModel) table.getModel();
		textField_1.setText(table_model.getValueAt(row, 0)+"");
		textField_2.setText(table_model.getValueAt(row, 1)+"");
		textField_3.setText(table_model.getValueAt(row, 2)+"");
		textField_4.setText(table_model.getValueAt(row, 3)+"");
		textField_5.setText(table_model.getValueAt(row, 4)+"");
		textField_6.setText(table_model.getValueAt(row, 5)+"");
		textField_7.setText(table_model.getValueAt(row, 6)+"");
		textField_8.setText(table_model.getValueAt(row, 7)+"");
	}
	public void ChucNangTimSach(String ma)
	{
		SachModel sach = new SachModel();
		sach = SachDAO.getinstance().LayThongTin(ma);
		if(sach != null)
		{
			textField_1.setText(sach.getMASACH());
			textField_2.setText(sach.getTENSACH());
			textField_3.setText(sach.getNXB());
			textField_4.setText(sach.getNAMXB() + "");
			textField_5.setText(sach.getTACGIA());
			textField_6.setText(sach.getSOLUONG() + "");
			textField_7.setText(sach.getTINHTRANG());
			textField_8.setText(sach.getGIA());
		}
		else
			JOptionPane.showMessageDialog(this, "Không tìm thấy, nhập lại mã sách", "Not Found", JOptionPane.ERROR_MESSAGE);
	}
}
