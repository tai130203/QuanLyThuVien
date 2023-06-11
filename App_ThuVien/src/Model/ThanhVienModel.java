package Model;

import java.sql.Date;

public class ThanhVienModel {
	private String matv;
	private String tentv;
	private String madv;
	private Date ngaysinh;
	private String diachi;
	private String sodt;
	private String email;
	private Date ngayDKTV;
	private String usernametv;
	private String passwordtv;
	public ThanhVienModel(String matv, String tentv, String madv, Date ngaysinh, String diachi, String sodt,
			String email, Date ngayDKTV, String usernametv, String passwordtv) {
		super();
		this.matv = matv;
		this.tentv = tentv;
		this.madv = madv;
		this.ngaysinh = ngaysinh;
		this.diachi = diachi;
		this.sodt = sodt;
		this.email = email;
		this.ngayDKTV = ngayDKTV;
		this.usernametv = usernametv;
		this.passwordtv = passwordtv;
	}
	public ThanhVienModel(String matv, String tentv, String madv, Date ngaysinh, String diachi, String sodt,
			String email, Date ngayDKTV) {
		super();
		this.matv = matv;
		this.tentv = tentv;
		this.madv = madv;
		this.ngaysinh = ngaysinh;
		this.diachi = diachi;
		this.sodt = sodt;
		this.email = email;
		this.ngayDKTV = ngayDKTV;
	}
	public ThanhVienModel() {
		super();
	}
	public String getMatv() {
		return matv;
	}
	public void setMatv(String matv) {
		this.matv = matv;
	}
	public String getTentv() {
		return tentv;
	}
	public void setTentv(String tentv) {
		this.tentv = tentv;
	}
	public String getMadv() {
		return madv;
	}
	public void setMadv(String madv) {
		this.madv = madv;
	}
	public Date getNgaysinh() {
		return ngaysinh;
	}
	public void setNgaysinh(Date ngaysinh) {
		this.ngaysinh = ngaysinh;
	}
	public String getDiachi() {
		return diachi;
	}
	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}
	public String getSodt() {
		return sodt;
	}
	public void setSodt(String sodt) {
		this.sodt = sodt;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getNgayDKTV() {
		return ngayDKTV;
	}
	public void setNgayDKTV(Date ngayDKTV) {
		this.ngayDKTV = ngayDKTV;
	}
	public String getUsernametv() {
		return usernametv;
	}
	public void setUsernametv(String usernametv) {
		this.usernametv = usernametv;
	}
	public String getPasswordtv() {
		return passwordtv;
	}
	public void setPasswordtv(String passwordtv) {
		this.passwordtv = passwordtv;
	}
	@Override
	public String toString() {
		return "ThanhVienModel [matv=" + matv + ", tentv=" + tentv + ", madv=" + madv + ", ngaysinh=" + ngaysinh
				+ ", diachi=" + diachi + ", sodt=" + sodt + ", email=" + email + ", ngayDKTV=" + ngayDKTV
				+ ", usernametv=" + usernametv + ", passwordtv=" + passwordtv + "]";
	}
	
	
}