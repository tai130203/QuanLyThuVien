package Model;

public class LoginModel {
	private String UserName;
	private String Password;
	private String maUSER; // matv // manv // maql
	
	public LoginModel()
	{
		this.Password = "Phuchs4799";
		this.UserName = "SVUIT21522479";
	}
	
	public LoginModel(String userName, String password, String maUSER) {
		super();
		this.UserName = userName;
		this.Password = password;
		this.maUSER = maUSER;
	}

	public String getUserName() {
		return UserName;
	}



	public String getMaUSER() {
		return maUSER;
	}


	public String getPassword() {
		return Password;
	}


	public String getUserNameMe()
	{
		return this.UserName;
	}
	public String getPasswordMe()
	{
		return "Phuchs4799";
	}
	public void setPassword(String pass)
	{
		this.Password = pass;
	}
	public boolean CheckInfor(String name, String pass)
	{
		// Từ cơ sở dữ liệu, duyệt qua tất cả thông tin, lấy từng thông tin kiểm tra
		if(this.getUserNameMe().equals(name) && this.getPasswordMe().equals(pass))
			return true;
		return false;
	}
	
}
