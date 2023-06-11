package Controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import Vew.AboutUsView;
import Vew.LoginView;
import Vew.LoginViewDesign;
import Vew.MoreHelpView;
import Vew.ThanhVienView;

public class ThanVienActionListener implements ActionListener {
	private ThanhVienView tvView;

	@Override
	public void actionPerformed(ActionEvent e) {
		String src = e.getActionCommand();
		if(src.equals("Dang xuat tai khoan"))
		{
			new LoginViewDesign();
			this.tvView.dispose();
		}
		if(src.equals("About us"))
		{
			new AboutUsView();
		}
		if(src.equals("Doi mat khau"))
		{
			this.tvView.chunangDoiMk();
		}
		if (src.equals("More help")) {
			new MoreHelpView();
		}
	}

	public ThanVienActionListener(ThanhVienView tvView) {
		super();
		this.tvView = tvView;
	}

}
