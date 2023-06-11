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

public class TheTuDAO implements DAOinterface<TheTuModel> {

	public static TheTuDAO getInstance() {
		return new TheTuDAO();
	}

	@Override
	public int insert(TheTuModel t) {
		int kq = 0;
		try {
			Connection connect = connect_db.getConnnection();
			String sql = "insert into thetu values(?,?,?,?,?)";

			PreparedStatement ps = connect.prepareStatement(sql);

			ps.setString(1, t.getMathe());
			ps.setDate(2, t.getNgaytao());
			ps.setDate(3, t.getNgayhethan());
			ps.setString(4, t.getManv());
			ps.setString(5, t.getMatv());

			kq = ps.executeUpdate();
			connect_db.closeConection(connect);
			update(t);
			return kq;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 0;
	}

	@Override
	public int update(TheTuModel t) {

		int kq = 0;
		try {
			Connection connect = connect_db.getConnnection();
			String sql = "UPDATE THETU" + " SET NGAYHETHAN = ADD_MONTHS(?, 36)" + " WHERE MATHE = ? ";

			PreparedStatement ps = connect.prepareStatement(sql);

			ps.setDate(1, t.getNgaytao());
			ps.setString(2, t.getMathe());

			kq = ps.executeUpdate();
			connect_db.closeConection(connect);
			return kq;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 0;
	}

	@Override
	public int delete(TheTuModel t) {
		int kq = 0;
		try {
			Connection connect = connect_db.getConnnection();
			String sql = "delete from thetu" + " WHERE matv = ? ";

			PreparedStatement ps = connect.prepareStatement(sql);

			ps.setString(1, t.getMatv());

			kq = ps.executeUpdate();
			connect_db.closeConection(connect);
			return kq;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 0;
	}

	@Override
	public ArrayList<TheTuModel> selectAll() {
		ArrayList<TheTuModel> ketqua = new ArrayList<TheTuModel>();
		try {
			Connection connecttion = connect_db.getConnnection();
			Statement st = connecttion.createStatement();

			String sql = "select * from thetu";

			ResultSet result = st.executeQuery(sql);

			while (result.next()) {
				String mathe = result.getString("mathe");
				Date ngaytao = result.getDate("ngaytao");
				Date ngayhethan = result.getDate("ngayhethan");

				String manv = result.getNString("manv");
				String matv = result.getString("matv");

				ketqua.add(new TheTuModel(mathe, ngaytao, ngayhethan, manv, matv));
			}

			connect_db.closeConection(connecttion);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ketqua;
	}

	@Override
	public TheTuModel selectById(TheTuModel t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<TheTuModel> selectByCondition(String condition) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TheTuModel LayThongTin(String ma) {
		// TODO Auto-generated method stub
		return null;
	}

}
