package Controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import Vew.AboutUsView;
import Vew.LoginView;
import Vew.LoginViewDesign;
import Vew.MoreHelpView;
import Vew.QuanLiHomePageViewDesign;
import Vew.QuanLiNhanVienView;
import Vew.QuanLiSachView;
import Vew.QuanliHomePageView;

public class QuanLiHomePageActionListener implements ActionListener {

	private QuanliHomePageView qlhpView;
	private QuanLiHomePageViewDesign qlhpviewdesign ;
	public QuanLiHomePageActionListener(QuanliHomePageView qlhp)
	{
		super();
		this.qlhpView = qlhp;
	}
	public QuanLiHomePageActionListener(QuanLiHomePageViewDesign qlhp)
	{
		super();
		this.qlhpviewdesign = qlhp;
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		String src = e.getActionCommand();
		if(src.equals("Quản lý sách"))
		{
			new QuanLiSachView(this.qlhpviewdesign.qlmodel.getMaNV());
			this.qlhpviewdesign.dispose();
		}
		if(src.equals("Quản lý nhân viên"))
		{
			new QuanLiNhanVienView(this.qlhpviewdesign.qlmodel.getMaNV());
			this.qlhpviewdesign.dispose();
		}
		if(src.equals("Dang xuat tai khoan"))
		{
			new LoginViewDesign();
			this.qlhpviewdesign.dispose();
		}
		if(src.equals("About us"))
		{
			new AboutUsView();
			this.qlhpviewdesign.dispose();
		}
		if(src.equals("Doi mat khau"))
		{
			this.qlhpviewdesign.chucnangDOiMK();
		}
		if (src.equals("More help")) {
			new MoreHelpView();
		}
	}

}
