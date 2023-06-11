package Model;

public class NhanVienHomePageModel {
		private String Username;
		private String Password;
		//private List[]
		public NhanVienHomePageModel()
		{
			
		}
		public String getName()
		{
			return "Nguyen Van A";
		}
		public String getPass()
		{
			return this.Password;
		}
		public void setPass(String pass)
		{
			this.Password = pass;
		}
}
