package Controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import Vew.AboutUsView;
import Vew.BaoCaoThogKeView;
import Vew.DoiMatKhauView;
import Vew.LoginView;
import Vew.LoginViewDesign;
import Vew.MoreHelpView;
import Vew.MuonTraSachView;
import Vew.NhanVienHomePageView;
import Vew.NhanvVIenHomePageViewDesign;
import Vew.QuanLiThanhVienView;
import Vew.ThongTinView;

public class NhanVienHomePageActionListener implements ActionListener {
	private NhanVienHomePageView nvhpView;
	private NhanvVIenHomePageViewDesign nvhpviewDesign;
	public NhanVienHomePageActionListener(NhanVienHomePageView nvhp_view)
	{
		super();
		this.nvhpView = nvhp_view;
	}
	public NhanVienHomePageActionListener(NhanvVIenHomePageViewDesign nvhp_view)
	{
		super();
		this.nvhpviewDesign = nvhp_view;
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		String src = e.getActionCommand();
		if(src.equals("Dang xuat tai khoan"))
		{
			new LoginViewDesign();
			this.nvhpviewDesign.dispose();
		}
		if(src.equals("About us"))
		{
			new AboutUsView();
			this.nvhpviewDesign.dispose();
		}
		if(src.equals("Doi mat khau"))
		{
			this.nvhpviewDesign.chucnangDOiMK();
			this.nvhpviewDesign.dispose();
		}
		if (src.equals("More help")) {
			new MoreHelpView();
			this.nvhpviewDesign.dispose();
		}
		if (src.equals("Quản lí thành viên")) {
			new QuanLiThanhVienView(this.nvhpviewDesign.nvModel);
			this.nvhpviewDesign.dispose();
		}
		if (src.equals("Quản lí mượn trả sách")) {
			new MuonTraSachView(this.nvhpviewDesign.nvModel.getMaNV());
			this.nvhpviewDesign.dispose();
		}	
		if (src.equals("Báo cáo thống kê")) {
			new BaoCaoThogKeView(this.nvhpviewDesign.nvModel.getMaNV());
			this.nvhpviewDesign.dispose();
		}	
	}

}
