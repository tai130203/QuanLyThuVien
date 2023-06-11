package Controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import Vew.QuanLiNhanVienView;

public class QuanliNhanVienController implements ActionListener {
	private QuanLiNhanVienView qlnvView;
	
	public QuanliNhanVienController(QuanLiNhanVienView qlnvView) {
		super();
		this.qlnvView = qlnvView;
	}

	@Override
	public void actionPerformed(ActionEvent e) {
			String src = e.getActionCommand();		
			if(src.equals("Tìm kiếm"))
			{
				this.qlnvView.ChucNangTIm();
			}
			if(src.equals("Thêm Mới Nhân Viên"))
			{
				this.qlnvView.ChucNangThem();
			}
			if(src.equals("Cập Nhật Nhân Viên"))
			{
				this.qlnvView.ChucNangCapNhat();
			}
			if(src.equals("Xóa nhân viên"))
			{
				this.qlnvView.ChucNangXoa();
			}
			if(src.equals("Làm mới bảng"))
			{
				this.qlnvView.ShowTable();
			}
			if (src.equals("Trở lại trang chủ"))
			{
				this.qlnvView.chucnang_quay_ve_trang_chu();
				this.qlnvView.dispose();
			}
	}

}
