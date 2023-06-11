package Model;

public class SachModel {
	private String MASACH;
	private String TENSACH;
	private String NXB;
	private String NAMXB;
	private String TACGIA;
	private int SOLUONG;
	private String TINHTRANG;
	private String GIA;
	public SachModel(String mASACH, String tENSACH, String nXB, String nAMXB, String tACGIA, int sOLUONG, String tINHTRANG,
			String gIA) {
		super();
		MASACH = mASACH;
		TENSACH = tENSACH;
		NXB = nXB;
		NAMXB = nAMXB;
		TACGIA = tACGIA;
		SOLUONG = sOLUONG;
		TINHTRANG = tINHTRANG;
		GIA = gIA;
	}
	public SachModel() {
		super();
	}
	public String getMASACH() {
		return MASACH;
	}
	public void setMASACH(String mASACH) {
		MASACH = mASACH;
	}
	public String getTENSACH() {
		return TENSACH;
	}
	public void setTENSACH(String tENSACH) {
		TENSACH = tENSACH;
	}
	public String getNXB() {
		return NXB;
	}
	public void setNXB(String nXB) {
		NXB = nXB;
	}
	public String getNAMXB() {
		return NAMXB;
	}
	public String getTACGIA() {
		return TACGIA;
	}
	public void setTACGIA(String tACGIA) {
		TACGIA = tACGIA;
	}
	public int getSOLUONG() {
		return SOLUONG;
	}
	public void setSOLUONG(int sOLUONG) {
		SOLUONG = sOLUONG;
	}
	public String getTINHTRANG() {
		return TINHTRANG;
	}
	public void setTINHTRANG(String tINHTRANG) {
		TINHTRANG = tINHTRANG;
	}
	public String getGIA() {
		return GIA;
	}
	public void setGIA(String gIA) {
		GIA = gIA;
	}
	@Override
	public String toString() {
		return "SachModel [MASACH=" + MASACH + ", TENSACH=" + TENSACH + ", NXB=" + NXB + ", NAMXB=" + NAMXB
				+ ", TACGIA=" + TACGIA + ", SOLUONG=" + SOLUONG + ", TINHTRANG=" + TINHTRANG + ", GIA=" + GIA + "]";
	}
	
}
