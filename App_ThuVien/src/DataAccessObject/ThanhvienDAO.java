package DataAccessObject;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import DB_util.connect_db;
import Model.ThanhVienModel;
import Model.TheTuModel;

public class ThanhvienDAO implements DAOinterface<ThanhVienModel> {

	public static ThanhvienDAO getINstance() {
		return new ThanhvienDAO();
	}

	@Override
	public int insert(ThanhVienModel t) {

		try {

			Connection connection = connect_db.getConnnection();
			String sql = "INSERT INTO THANHVIEN (matv, tentv, madv, ngaysinh, diachi, sodt, email,"
					+ " ngaydktv, username, passwordtv) " + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			// Statement st =connection.createStatement();
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, t.getMatv());
			ps.setString(2, t.getTentv());
			ps.setString(3, t.getMadv());
			ps.setDate(4, (t.getNgaysinh()));
			ps.setString(5, t.getDiachi());
			ps.setString(6, t.getSodt());
			ps.setString(7, t.getEmail());
			ps.setDate(8, (t.getNgayDKTV()));
			ps.setString(9, "USER" + t.getMatv());
			ps.setString(10, t.getMatv() + "TVTT");
			ps.executeUpdate();
			return 1;
		} catch (SQLException e) {
			return 0;
		}
	}

	@Override
	public int update(ThanhVienModel t) {
		try {

			Connection connection = connect_db.getConnnection();
			String sql = "update thanhvien set tentv = ?, madv = ?, ngaysinh = ?, diachi = ?, sodt = ?,"
					+ "email = ?, ngaydktv = ?, username = ?, passwordtv = ? where matv = ?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, t.getTentv());
			ps.setString(2, t.getMadv());
			ps.setDate(3, (t.getNgaysinh()));
			ps.setString(4, t.getDiachi());
			ps.setString(5, t.getSodt());
			ps.setString(6, t.getEmail());
			ps.setDate(7, (t.getNgayDKTV()));
			ps.setString(8, t.getUsernametv());
			ps.setString(9, t.getPasswordtv());
			ps.setString(10, t.getMatv());
			ps.executeUpdate();
			return 1;
		} catch (SQLException e) {
			return 0;
		}
	}

	@Override
	public int delete(ThanhVienModel t) {
		int kq = 0;
		try {
			Connection connection = connect_db.getConnnection();
			
			TheTuModel tt = new TheTuModel("TT" + t.getMatv(), t.getNgayDKTV(), t.getNgayDKTV(), "nv01", t.getMatv());
			TheTuDAO.getInstance().delete(tt);
			
			String sql = "delete from thanhvien where matv = ?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, t.getMatv());
			kq = ps.executeUpdate();
			return 1;
		} catch (SQLException e) {
			return 0;
		}

	}

	@Override
	public ArrayList<ThanhVienModel> selectAll() {
		ArrayList<ThanhVienModel> ketqua = new ArrayList<ThanhVienModel>();
		try {
			Connection connecttion = connect_db.getConnnection();
			Statement st = connecttion.createStatement();

			String sql = "select * from thanhvien";

			ResultSet result = st.executeQuery(sql);

			while (result.next()) {
				String maTV = result.getString("MATV");
				String tenTV = result.getNString("tenTV");
				String MADV = result.getString("MADV");
				Date ngaysinh = result.getDate("NGAYSINH");
				String DIACHI = result.getNString("DIACHI");
				String SODT = result.getString("SODT");
				String email = result.getString("email");
				Date ngaydktv = result.getDate("NGAYDKTV");

				String ussername = result.getString("USERNAME");
				String password = result.getString("PASSWORDTV");
				ketqua.add(new ThanhVienModel(maTV, tenTV, MADV, ngaysinh, DIACHI, SODT, email, ngaydktv, ussername,
						password));
			}

			connect_db.closeConection(connecttion);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ketqua;
	}

	@Override
	public ThanhVienModel selectById(ThanhVienModel t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<ThanhVienModel> selectByCondition(String ma) {
		ArrayList<ThanhVienModel> ketqua = new ArrayList<ThanhVienModel>();
		try {
			Connection connecttion = connect_db.getConnnection();
			Statement st = connecttion.createStatement();

			String sql = "select * from thanhvien where matv like '" + ma + "%'";

			ResultSet result = st.executeQuery(sql);
			while (result.next()) {
				String maTV = result.getString("MATV");
				String tenTV = result.getNString("tenTV");
				String MADV = result.getString("MADV");
				Date ngaysinh = result.getDate("NGAYSINH");
				String DIACHI = result.getNString("DIACHI");
				String SODT = result.getString("SODT");
				String email = result.getString("email");
				Date ngaydktv = result.getDate("NGAYDKTV");

				String ussername = result.getString("Username");
				String password = result.getString("passwordtv");
				ketqua.add(new ThanhVienModel(maTV, tenTV, MADV, ngaysinh, DIACHI, SODT, email, ngaydktv, ussername,
						password));
			}

			connect_db.closeConection(connecttion);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ketqua;
	}

	@Override
	public ThanhVienModel LayThongTin(String ma) {
		try {
			Connection connecttion = connect_db.getConnnection();
			Statement st = connecttion.createStatement();

			String sql = "select * from thanhvien";

			ResultSet result = st.executeQuery(sql);

			while (result.next()) {
				if (result.getString("MATV").equals(ma)) {
					String maTV = result.getString("MATV");
					String tenTV = result.getNString("tenTV");
					String MADV = result.getString("MADV");
					Date ngaysinh = result.getDate("NGAYSINH");
					String DIACHI = result.getNString("DIACHI");
					String SODT = result.getString("SODT");
					String email = result.getString("email");
					Date ngaydktv = result.getDate("NGAYDKTV");

					String ussername = result.getString("Username");
					String password = result.getString("passwordtv");

					ThanhVienModel tv = new ThanhVienModel(maTV, tenTV, MADV, ngaysinh, DIACHI, SODT, email, ngaydktv,
							ussername, password);
					return tv;
				}
			}
			connect_db.closeConection(connecttion);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

}
