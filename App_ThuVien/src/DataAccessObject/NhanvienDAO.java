package DataAccessObject;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import DB_util.connect_db;
import Model.NhanVienModel;
import Model.ThanhVienModel;

public class NhanvienDAO implements DAOinterface<NhanVienModel> {

	public static NhanvienDAO getInstance() {
		return new NhanvienDAO();
	}

	@Override
	public int insert(NhanVienModel t) {
		int kq = 0;
		try {
			Connection connection = connect_db.getConnnection();

			String sql = "INSERT INTO nhanvien (manv, tennv, ngaysinh, ngvl, diachi, sodt, cccd, email, username, passwordnv) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, t.getMaNV());
			ps.setString(2, t.getTenNV());
			ps.setDate(3, t.getNgaySinh());
			ps.setDate(4, (t.getNgayVaoLam()));
			ps.setString(5, t.getDiachi());
			ps.setString(6, t.getSodt());
			ps.setString(7, t.getCccd());
			ps.setString(8, (t.getEmail()));
			ps.setString(9, "USER" + t.getMaNV());
			ps.setString(10, t.getMaNV() + "TVTT");

			kq = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return kq;
	}

	@Override
	public int update(NhanVienModel t) {
		int kq = 0;
		try {

			Connection connection = connect_db.getConnnection();

			String sql = "UPDATE NHANVIEN set tennv = ?, ngaysinh = ?, ngvl = ?, diachi = ?,"
					+ "sodt = ?, cccd = ?, email = ?, username = ?, passwordnv = ?" + "where manv = ?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setNString(1, t.getTenNV());
			ps.setDate(2, t.getNgaySinh());
			ps.setDate(3, t.getNgayVaoLam());
			ps.setNString(4, (t.getDiachi()));
			ps.setString(5, t.getSodt());
			ps.setString(6, t.getCccd());
			ps.setString(7, (t.getEmail()));
			ps.setString(8, t.getUsername());
			ps.setString(9, t.getPassword());
			ps.setString(10, t.getMaNV());
			kq = ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return kq;
	}

	@Override
	public int delete(NhanVienModel t) {
		try {
			Connection connection = connect_db.getConnnection();

			String sql = "select count(*) as soluong from muontrasach mt, nhanvien nv where mt.manv = ?";
			PreparedStatement prepareSQL = connection.prepareStatement(sql);

			prepareSQL.setString(1, t.getMaNV());
			ResultSet count = prepareSQL.executeQuery();
			if (count.next()) {
				if (count.getInt("soluong") == 0) {
					String sqlDelete = "delete from nhanvien where manv = ?";
					PreparedStatement prepareDelete = connection.prepareStatement(sqlDelete);
					prepareDelete.setString(1, t.getMaNV());
					int result = prepareDelete.executeUpdate();
					return 1; // xoa duoc
				} else {
					return 0; // khong xoa duoc
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public ArrayList<NhanVienModel> selectAll() {
		ArrayList<NhanVienModel> listNhanVien = new ArrayList<NhanVienModel>();
		try {
			Connection connect = connect_db.getConnnection();

			Statement st = connect.createStatement();
			String sql = "select * from nhanvien";

			ResultSet result = st.executeQuery(sql);
			while (result.next()) {
				String MaNV = result.getString("MANV");
				String TenNV = result.getString("TENNV");
				Date NgaySinh = result.getDate("NGAYSINH");
				Date ngayVaoLam = result.getDate("NGVL");
				String Diachi = result.getNString("DIACHI");
				String Sodt = result.getString("SODT");
				String cccd = result.getString("CCCD");
				String Email = result.getString("Email");
				String username = result.getString("USERNAME");
				String password = result.getString("PASSWORDNV");
				listNhanVien.add(new NhanVienModel(MaNV, TenNV, NgaySinh, ngayVaoLam, Diachi, Sodt, cccd, Email,
						username, password));
			}
			connect_db.closeConection(connect);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listNhanVien;
	}

	@Override
	public NhanVienModel selectById(NhanVienModel t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<NhanVienModel> selectByCondition(String manv) {
		ArrayList<NhanVienModel> listNhanVien = new ArrayList<NhanVienModel>();
		try {
			Connection connect = connect_db.getConnnection();

			Statement st = connect.createStatement();
			String sql = "select * from nhanvien where manv like '" + manv + "%'";

			ResultSet result = st.executeQuery(sql);
			while (result.next()) {
				String MaNV = result.getString("MANV");
				String TenNV = result.getString("TENNV");
				Date NgaySinh = result.getDate("NGAYSINH");
				Date ngayVaoLam = result.getDate("NGVL");
				String Diachi = result.getNString("DIACHI");
				String Sodt = result.getString("SODT");
				String cccd = result.getString("CCCD");
				String Email = result.getString("Email");
				String username = result.getString("USERNAME");
				String password = result.getString("PASSWORDNV");
				listNhanVien.add(new NhanVienModel(MaNV, TenNV, NgaySinh, ngayVaoLam, Diachi, Sodt, cccd, Email,
						username, password));
			}
			connect_db.closeConection(connect);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listNhanVien;
	}

	@Override
	public NhanVienModel LayThongTin(String ma) {
		try {
			Connection connecttion = connect_db.getConnnection();
			Statement st = connecttion.createStatement();

			String sql = "select * from nhanvien";

			ResultSet result = st.executeQuery(sql);

			while (result.next()) {
				if (result.getString("manv").equals(ma)) {
					String MaNV = result.getString("MANV");
					String TenNV = result.getString("TENNV");
					Date NgaySinh = result.getDate("NGAYSINH");
					Date ngayVaoLam = result.getDate("NGVL");
					String Diachi = result.getNString("DIACHI");
					String Sodt = result.getString("SODT");
					String cccd = result.getString("CCCD");
					String Email = result.getString("Email");

					String ussername = result.getString("Username");
					String password = result.getString("passwordnv");

					NhanVienModel nv = new NhanVienModel(MaNV, TenNV, NgaySinh, ngayVaoLam, Diachi, Sodt, cccd, Email,
							ussername, password);
					return nv;
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
