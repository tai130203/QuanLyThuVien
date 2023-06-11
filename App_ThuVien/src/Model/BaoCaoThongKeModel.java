package Model;

import java.sql.Date;

public class BaoCaoThongKeModel {
	private String MaHD;
	private Date NgayHD;
	private String Sotien;
	private String ghichu;
	private String MaNV;
	private String Matv;
	public BaoCaoThongKeModel(String maHD, Date ngayHD, String sotien, String ghichu, String maNV, String matv) {
		super();
		MaHD = maHD;
		NgayHD = ngayHD;
		Sotien = sotien;
		this.ghichu = ghichu;
		MaNV = maNV;
		Matv = matv;
	}
	public BaoCaoThongKeModel() {
		super();
	}
	public String getMaHD() {
		return MaHD;
	}
	public Date getNgayHD() {
		return NgayHD;
	}
	public String getSotien() {
		return Sotien;
	}
	public String getGhichu() {
		return ghichu;
	}
	public String getMaNV() {
		return MaNV;
	}
	public String getMatv() {
		return Matv;
	}
	public void setMaHD(String maHD) {
		MaHD = maHD;
	}
	public void setNgayHD(Date ngayHD) {
		NgayHD = ngayHD;
	}
	public void setSotien(String sotien) {
		Sotien = sotien;
	}
	public void setGhichu(String ghichu) {
		this.ghichu = ghichu;
	}
	public void setMaNV(String maNV) {
		MaNV = maNV;
	}
	public void setMatv(String matv) {
		Matv = matv;
	}
	
}
