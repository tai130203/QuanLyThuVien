package Model;

import java.sql.Date;

public class MuonTraSachModel {
	private String MaTv;
	private String MaNv;
	private String MaSach;
	private Date NgayMuon;
	private Date NgayTra;
	private String GhiChu;
	public MuonTraSachModel(String maTv, String maNv, String maSach, Date ngayMuon, Date ngayTra, String ghiChu) {
		super();
		MaTv = maTv;
		MaNv = maNv;
		MaSach = maSach;
		NgayMuon = ngayMuon;
		NgayTra = ngayTra;
		GhiChu = ghiChu;
	}
	
	public MuonTraSachModel() {
		super();
	}

	public String getMaTv() {
		return MaTv;
	}
	public void setMaTv(String maTv) {
		MaTv = maTv;
	}
	public String getMaNv() {
		return MaNv;
	}
	public void setMaNv(String maNv) {
		MaNv = maNv;
	}
	public String getMaSach() {
		return MaSach;
	}
	public void setMaSach(String maSach) {
		MaSach = maSach;
	}
	public Date getNgayMuon() {
		return NgayMuon;
	}
	public void setNgayMuon(Date ngayMuon) {
		NgayMuon = ngayMuon;
	}
	public Date getNgayTra() {
		return NgayTra;
	}
	public void setNgayTra(Date ngayTra) {
		NgayTra = ngayTra;
	}
	public String getGhiChu() {
		return GhiChu;
	}
	public void setGhiChu(String ghiChu) {
		GhiChu = ghiChu;
	}

	@Override
	public String toString() {
		return "MuonTraSachModel [MaTv=" + MaTv + ", MaNv=" + MaNv + ", MaSach=" + MaSach + ", NgayMuon=" + NgayMuon
				+ ", NgayTra=" + NgayTra + ", GhiChu=" + GhiChu + "]";
	}
	
	
}
