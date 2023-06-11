package Controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.ParseException;

import javax.swing.JOptionPane;

import Vew.QuanLiThanhVienView;

public class QuanLiThanhVienController implements ActionListener {
	private QuanLiThanhVienView qltvView;
	public QuanLiThanhVienController(QuanLiThanhVienView qltv) {
		super();
		this.qltvView = qltv;
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		String src = e.getActionCommand();
		if(src.equals("Tìm kiếm"))
		{
			this.qltvView.chucnangTim();
		}
		if(src.equals("Xác Nhận Thêm Thành Viên"))
		{
				try {
					this.qltvView.ThemThanhVienMoi();
				} catch (ParseException e1) {
					e1.printStackTrace();
				}
		}
		if(src.equals("Cập nhật"))
		{
			this.qltvView.chucNangCapNhat();;
		}
		if(src.equals("Xóa thành viên"))
		{
			this.qltvView.chucnangXoa();
		}
		if(src.equals("Quay Lại Trang Chủ"))
		{
			this.qltvView.chucnang_quay_ve_trang_chu();
		}
	}
}
