package Controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Date;

import javax.swing.JOptionPane;

import DataAccessObject.NhanvienDAO;
import DataAccessObject.ThanhvienDAO;
import Model.NhanVienModel;
import Model.ThanhVienModel;
import Vew.DoiMKViewDesign;
import Vew.DoiMatKhauView;
import Vew.LoginView;
import Vew.LoginViewDesign;

public class DoiMatKhauAcionlistener implements ActionListener {
	private DoiMatKhauView doimkView;
	private DoiMKViewDesign doimkviewDesign;
	public DoiMatKhauAcionlistener(DoiMKViewDesign doimkviewDesign) {
		super();
		this.doimkviewDesign = doimkviewDesign;
	}

	public DoiMatKhauAcionlistener(DoiMatKhauView doimkView) {
		super();
		this.doimkView = doimkView;
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		String src = e.getActionCommand();
		String passCu = this.doimkviewDesign.jpasMKCu.getText();
		String passMoi = this.doimkviewDesign.jpabMoi.getText();
		String XacNhanMKMoi = this.doimkviewDesign.jpabXN.getText();
		if (src.equals("Xác nhận đổi mật khẩu")) {
			if (this.doimkviewDesign.jpasMKCu.getText().isEmpty() || this.doimkviewDesign.jpabMoi.getText().isEmpty()
					|| this.doimkviewDesign.jpabXN.getText().isEmpty()) {
				JOptionPane.showMessageDialog(this.doimkviewDesign, "Các ô không được để trống", "LỖI",
						JOptionPane.ERROR_MESSAGE);
			} else {
				if (this.doimkviewDesign.nvmodel != null) {
					if (this.doimkviewDesign.nvmodel.getPassword().equals(passCu)) {
						if (passMoi.equals(XacNhanMKMoi)) {
							NhanVienModel nvpdate = new NhanVienModel(this.doimkviewDesign.nvmodel.getMaNV(),
									this.doimkviewDesign.nvmodel.getTenNV(), this.doimkviewDesign.nvmodel.getNgaySinh(),
									this.doimkviewDesign.nvmodel.getNgayVaoLam(), this.doimkviewDesign.nvmodel.getDiachi(),
									this.doimkviewDesign.nvmodel.getSodt(), this.doimkviewDesign.nvmodel.getCccd(),
									this.doimkviewDesign.nvmodel.getEmail(), this.doimkviewDesign.nvmodel.getUsername(), passMoi);
							NhanvienDAO.getInstance().update(nvpdate);
							JOptionPane.showMessageDialog(this.doimkviewDesign, "Đổi thành công, nhấn OK để đăng nhập lại",
									" THÀNH CÔNG", JOptionPane.DEFAULT_OPTION);
							new LoginViewDesign();
							this.doimkviewDesign.dispose();
						} else {
							JOptionPane.showMessageDialog(this.doimkviewDesign, "Xác nhận mật khẩu sai", "LỖI",
									JOptionPane.ERROR_MESSAGE);
						}
					} else {
						JOptionPane.showMessageDialog(this.doimkviewDesign, "Mật khẩu cũ sai", "LỖI",
								JOptionPane.ERROR_MESSAGE);
					}
				} else {
					if (this.doimkviewDesign.tvmodel.getPasswordtv().equals(passCu)) {
						if (passMoi.equals(XacNhanMKMoi)) {
							ThanhVienModel tvupdate = new ThanhVienModel(this.doimkviewDesign.tvmodel.getMatv(),
									this.doimkviewDesign.tvmodel.getTentv(), this.doimkviewDesign.tvmodel.getMadv(),
									this.doimkviewDesign.tvmodel.getNgaysinh(),
									this.doimkviewDesign.tvmodel.getDiachi(), this.doimkviewDesign.tvmodel.getSodt(),
									this.doimkviewDesign.tvmodel.getEmail(), this.doimkviewDesign.tvmodel.getNgayDKTV(),
									this.doimkviewDesign.tvmodel.getUsernametv(), passMoi);
							ThanhvienDAO.getINstance().update(tvupdate);
							JOptionPane.showMessageDialog(this.doimkviewDesign, "Đổi thành công, nhấn OK để đăng nhập lại",
									" THÀNH CÔNG", JOptionPane.DEFAULT_OPTION);
							new LoginViewDesign();
							this.doimkviewDesign.dispose();
						} else {
							JOptionPane.showMessageDialog(this.doimkviewDesign, "Xác nhận mật khẩu sai", "LỖI",
									JOptionPane.ERROR_MESSAGE);
						}
					} else {
						JOptionPane.showMessageDialog(this.doimkviewDesign, "Mật khẩu cũ sai", "LỖI",
								JOptionPane.ERROR_MESSAGE);
					}
				}
			}
		}
	}

}
