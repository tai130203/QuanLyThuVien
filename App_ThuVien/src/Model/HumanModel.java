package Model;

public class HumanModel {
	private String maHuman;
	private String tenHuman;
	private String ussername;
	private String passowrd;
	public HumanModel(String maHuman, String tenHuman, String ussername, String passowrd) {
		super();
		this.maHuman = maHuman;
		this.tenHuman = tenHuman;
		this.ussername = ussername;
		this.passowrd = passowrd;
	}
	public HumanModel() {
		super();
	}
	public String getMaHuman() {
		return maHuman;
	}
	public void setMaHuman(String maHuman) {
		this.maHuman = maHuman;
	}
	public String getTenHuman() {
		return tenHuman;
	}
	public void setTenHuman(String tenHuman) {
		this.tenHuman = tenHuman;
	}
	public String getUssername() {
		return ussername;
	}
	public void setUssername(String ussername) {
		this.ussername = ussername;
	}
	public String getPassowrd() {
		return passowrd;
	}
	public void setPassowrd(String passowrd) {
		this.passowrd = passowrd;
	}
	@Override
	public String toString() {
		return "HumanModel [maHuman=" + maHuman + ", tenHuman=" + tenHuman + ", ussername=" + ussername + ", passowrd="
				+ passowrd + "]";
	}
	
	
}
