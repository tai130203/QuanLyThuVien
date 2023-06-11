package DataAccessObject;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import DB_util.connect_db;
import Model.MuonTraSachModel;

public class MuonTraSachDAO implements DAOinterface<MuonTraSachModel> {

	public static MuonTraSachDAO getInstance()
	{
		return new MuonTraSachDAO();
	}
	@Override
	public int insert(MuonTraSachModel t) {
		int kq=0;
		
		try {
			Connection connect = connect_db.getConnnection();
			String sql = "insert into muontrasach values(?,?,?, ?, ?, ?)";
			PreparedStatement ps;
			ps = connect.prepareStatement(sql);
			ps.setString(1, t.getMaTv());
			ps.setString(2, t.getMaNv());
			ps.setString(3, t.getMaSach());
			ps.setDate(4, t.getNgayMuon());
			ps.setDate(5, t.getNgayTra());
			ps.setString(6, t.getGhiChu());
			
			ps.executeUpdate();
			connect_db.closeConection(connect);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return kq;
	}

	@Override
	public int update(MuonTraSachModel t) {
		int kq=0;
		
		try {
			Connection connect = connect_db.getConnnection();
			String sql = "update muontrasach set ngaymuon = ?, ngaytra = ?, ghichu = ? "
					+ "where matv = ? and manv = ? and masach = ?";
			PreparedStatement ps;
			ps = connect.prepareStatement(sql);

			ps.setDate(1, t.getNgayMuon());
			ps.setDate(2, t.getNgayTra());
			ps.setString(3, t.getGhiChu());
			ps.setString(4, t.getMaTv());
			ps.setString(5, t.getMaNv());
			ps.setString(6, t.getMaSach());
			
			ps.executeUpdate();
			
			String sqlUPdate = "update muontrasach set ghichu = 'Hết hạn' where ngaytra < sysdate and matv = ?";
			PreparedStatement psudate = connect.prepareStatement(sqlUPdate);
			psudate.setString(1, t.getMaTv());
			psudate.executeUpdate();
			
			connect_db.closeConection(connect);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return kq;
	}

	@Override
	public int delete(MuonTraSachModel t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<MuonTraSachModel> selectAll() {
		ArrayList<MuonTraSachModel> listMTSach = new ArrayList<MuonTraSachModel>();

		try {
			
			Connection connect = connect_db.getConnnection();
			
			String sql = "select * from muontrasach";
			
			Statement st = connect.createStatement();
			
			ResultSet result = st.executeQuery(sql);

			while(result.next())
			{
				String matv = result.getString("matv");
				String manv = result.getString("manv");
				String masach = result.getString("masach");
				Date ngaymuon  = result.getDate("ngaymuon");
				Date ngaytra  = result.getDate("ngaytra");
				String ghichu =  result.getNString("ghichu");
				
				listMTSach.add(new MuonTraSachModel(matv, manv, masach, ngaymuon, ngaytra, ghichu));
			}
			
			connect_db.closeConection(connect);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listMTSach;
	}

	@Override
	public MuonTraSachModel selectById(MuonTraSachModel t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<MuonTraSachModel> selectByCondition(String MATVMTS) {
		ArrayList<MuonTraSachModel> listMTSach = new ArrayList<MuonTraSachModel>();

		try {
			
			Connection connect = connect_db.getConnnection();
			
			String sql = "select * from muontrasach where matv like '" + MATVMTS + "%'";
			
			Statement st = connect.createStatement();
			
			ResultSet result = st.executeQuery(sql);

			while(result.next())
			{
				String matv = result.getString("matv");
				String manv = result.getString("manv");
				String masach = result.getString("masach");
				Date ngaymuon  = result.getDate("ngaymuon");
				Date ngaytra  = result.getDate("ngaytra");
				String ghichu =  result.getNString("ghichu");
				
				listMTSach.add(new MuonTraSachModel(matv, manv, masach, ngaymuon, ngaytra, ghichu));
			}
			
			connect_db.closeConection(connect);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listMTSach;
	}

	@Override
	public MuonTraSachModel LayThongTin(String ma) {
		// TODO Auto-generated method stub
		return null;
	}

}
