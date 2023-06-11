package Model;

import java.sql.Date;

public class NhanVienModel {
	private String MaNV;
	private String TenNV;
	private Date NgaySinh;
	private Date ngayVaoLam;
	private String Diachi;
	private String Sodt;
	private String cccd;
	private String Email;
	private String username;
	private String password;
	public NhanVienModel(String maNV, String tenNV, Date ngaySinh, Date ngayVaoLam, String diachi, String sodt,
			String cccd, String email, String username, String password) {
		super();
		MaNV = maNV;
		TenNV = tenNV;
		NgaySinh = ngaySinh;
		this.ngayVaoLam = ngayVaoLam;
		Diachi = diachi;
		Sodt = sodt;
		this.cccd = cccd;
		Email = email;
		this.username = username;
		this.password = password;
	}
	public NhanVienModel() {
		super();
	}
	public NhanVienModel(String maNV, String tenNV, Date ngaySinh, Date ngayVaoLam, String diachi, String sodt,
			String cccd, String email) {
		super();
		MaNV = maNV;
		TenNV = tenNV;
		NgaySinh = ngaySinh;
		this.ngayVaoLam = ngayVaoLam;
		Diachi = diachi;
		Sodt = sodt;
		this.cccd = cccd;
		Email = email;
	}
	public String getMaNV() {
		return MaNV;
	}
	public void setMaNV(String maNV) {
		MaNV = maNV;
	}
	public String getTenNV() {
		return TenNV;
	}
	public void setTenNV(String tenNV) {
		TenNV = tenNV;
	}
	public Date getNgaySinh() {
		return NgaySinh;
	}
	public void setNgaySinh(Date ngaySinh) {
		NgaySinh = ngaySinh;
	}
	public Date getNgayVaoLam() {
		return ngayVaoLam;
	}
	public void setNgayVaoLam(Date ngayVaoLam) {
		this.ngayVaoLam = ngayVaoLam;
	}
	public String getDiachi() {
		return Diachi;
	}
	public void setDiachi(String diachi) {
		Diachi = diachi;
	}
	public String getSodt() {
		return Sodt;
	}
	public void setSodt(String sodt) {
		Sodt = sodt;
	}
	public String getCccd() {
		return cccd;
	}
	public void setCccd(String cccd) {
		this.cccd = cccd;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "NhanVienModel [MaNV=" + MaNV + ", TenNV=" + TenNV + ", NgaySinh=" + NgaySinh + ", ngayVaoLam="
				+ ngayVaoLam + ", Diachi=" + Diachi + ", Sodt=" + Sodt + ", cccd=" + cccd + ", Email=" + Email + "]";
	}
	
	
}
