package Controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import Vew.QuanLiSachView;

public class QLSachController implements ActionListener {

	private QuanLiSachView slsachView;

	public QLSachController(QuanLiSachView qlsv) {
		super();
		this.slsachView = qlsv;
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		String	src = e.getActionCommand();
		if(src.equals("Thêm sách"))
		{
			this.slsachView.ChucNangThem();
		}
		if(src.equals("Xóa sách"))
		{
			this.slsachView.ChucNangXoa();
		}
		if(src.equals("Cập nhật sách"))
		{
			this.slsachView.ChucNangCapNhat();
		}
		if(src.equals("Tìm kiếm"))
		{
			this.slsachView.ChucNangTimSach();
		}
		if(src.equals("Làm mới bảng"))
		{
			this.slsachView.showtable();
		}
		if (src.equals("Trở lại trang chủ"))
		{
			this.slsachView.chucnang_Quay_Lai_Trang_Chu();
		}
	}

}
