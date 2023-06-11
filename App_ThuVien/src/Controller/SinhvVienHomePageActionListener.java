package Controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import Vew.AboutUsView;
import Vew.DoiMatKhauView;
import Vew.LoginView;
import Vew.MoreHelpView;
import Vew.SinhvienHomePageView;
import Vew.ThongTinSinhVienView;

public class SinhvVienHomePageActionListener implements ActionListener {
	private SinhvienHomePageView svhpview;

	public SinhvVienHomePageActionListener(SinhvienHomePageView svhp_view)
	{
		super();
		this.svhpview = svhp_view;
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		String src = e.getActionCommand();
		if(src.equals("Dang xuat tai khoan"))
		{
			new LoginView();
			this.svhpview.dispose();
		}
		if(src.equals("Thong tin sinh vien"))
		{
			new ThongTinSinhVienView("SVUIT99992");
			this.svhpview.dispose();
		}
		if(src.equals("Doi mat khau"))
		{
			new DoiMatKhauView();
			this.svhpview.dispose();
		}
		if(src.equals("More help"))
		{
			new MoreHelpView();
		}
		if (src.equals("About us"))
		{
			new AboutUsView();
			this.svhpview.dispose();
		}
	}

}
