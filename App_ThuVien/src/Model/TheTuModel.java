package Model;

import java.sql.Date;

public class TheTuModel {
	private String mathe;
	private Date Ngaytao;
	private Date ngayhethan;
	private String manv;
	private String matv;
	public TheTuModel(String mathe, Date ngaytao, Date ngayhethan, String manv, String matv) {
		super();
		this.mathe = mathe;
		this.Ngaytao = ngaytao;
		this.ngayhethan = ngayhethan;
		this.manv = manv;
		this.matv = matv;
	}
	public TheTuModel() {
		super();
	}
	public String getMathe() {
		return mathe;
	}
	public Date getNgaytao() {
		return Ngaytao;
	}
	public Date getNgayhethan() {
		return ngayhethan;
	}
	public String getManv() {
		return manv;
	}
	public String getMatv() {
		return matv;
	}
	public void setMathe(String mathe) {
		this.mathe = mathe;
	}
	public void setNgaytao(Date ngaytao) {
		Ngaytao = ngaytao;
	}
	public void setNgayhethan(Date ngayhethan) {
		this.ngayhethan = ngayhethan;
	}
	public void setManv(String manv) {
		this.manv = manv;
	}
	public void setMatv(String matv) {
		this.matv = matv;
	}
	
}
