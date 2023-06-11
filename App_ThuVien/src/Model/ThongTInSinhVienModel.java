package Model;

public class ThongTInSinhVienModel {
	private String tenUser; // ten user name = ma thanh vien dươc luu trong csdl
	private String Password;
	private String mssv;
	private String Tensv;
	private String NgSinh;
	public ThongTInSinhVienModel()
	{
		this.Password = "";
		this.mssv = "21522479";
		this.NgSinh = "04/07/2003";
		this.Tensv = "Tran Hoang Phuc";
		this.tenUser = "";
	}
	public ThongTInSinhVienModel(String user)
	{
		this.tenUser = user;
	}
	public String getName()
	{
		return this.Tensv;
	}
	public String getMssv()
	{
		return this.mssv;
	}
	public String getTenUserName()
	{
		return this.tenUser;
	}
	public String getNgaySinh()
	{
		return this.NgSinh;
	}
	public String getTruong()
	{
		return "UIT";
	}
	
}
