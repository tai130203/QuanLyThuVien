package DataAccessObject;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import DB_util.connect_db;
import Model.BaoCaoThongKeModel;
import Model.MuonTraSachModel;

public class BCTKDAO implements DAOinterface<BaoCaoThongKeModel>{

	public static BCTKDAO getInstance()
	{
		return new BCTKDAO();
	}
	@Override
	public int insert(BaoCaoThongKeModel t) {
		int kq=0;
		try {
			Connection connect = connect_db.getConnnection();
			String sql = "insert into hoadon values(?,?,?,?,?,?)";
			PreparedStatement ps = connect.prepareStatement(sql);
			ps.setString(1, t.getMaHD());
			ps.setDate(2, t.getNgayHD());
			ps.setString(3, t.getSotien());
			ps.setString(4, t.getGhichu());
			ps.setString(5, t.getMaNV());
			ps.setString(6, t.getMatv());
			
			ps.executeUpdate();
			connect_db.closeConection(connect);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return kq;
	}

	@Override
	public int update(BaoCaoThongKeModel t) {
		int kq=0;
		try {
			Connection connect = connect_db.getConnnection();
			String sql = "update hoadon set nghd = ?, sotien = ?, ghichu = ?, manv = ?, matv = ?"
					+ "where mahd = ?";
			PreparedStatement ps = connect.prepareStatement(sql);
			ps.setDate(1, t.getNgayHD());
			ps.setString(2, t.getSotien());
			ps.setString(3, t.getGhichu());
			ps.setString(4, t.getMaNV());
			ps.setString(5, t.getMatv());
			ps.setString(6, t.getMaHD());

			ps.executeUpdate();
			connect_db.closeConection(connect);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return kq;
	}

	@Override
	public int delete(BaoCaoThongKeModel t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<BaoCaoThongKeModel> selectAll() {
		ArrayList<BaoCaoThongKeModel> listHoaDon = new ArrayList<BaoCaoThongKeModel>();

		try {
			
			Connection connect = connect_db.getConnnection();
			
			String sql = "select * from hoadon";
			
			Statement st = connect.createStatement();
			
			ResultSet result = st.executeQuery(sql);

			while(result.next())
			{
				String mahd = result.getString("mahd");
				Date nghd = result.getDate("nghd");
				String sotien = result.getString("sotien");
				String ghichu =  result.getNString("ghichu");
				String manv =  result.getString("manv");
				String matv =  result.getString("matv");
				listHoaDon.add(new BaoCaoThongKeModel(mahd, nghd, sotien, ghichu, manv, matv));
			}
			connect_db.closeConection(connect);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listHoaDon;
	}

	@Override
	public BaoCaoThongKeModel selectById(BaoCaoThongKeModel t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<BaoCaoThongKeModel> selectByCondition(String ma) {
		ArrayList<BaoCaoThongKeModel> listHoaDon = new ArrayList<BaoCaoThongKeModel>();

		try {
			
			Connection connect = connect_db.getConnnection();
			
			String sql = "select * from hoadon where manv like '" + ma + "%'";
			
			Statement st = connect.createStatement();
			
			ResultSet result = st.executeQuery(sql);

			while(result.next())
			{
				String mahd = result.getString("mahd");
				Date nghd = result.getDate("nghd");
				String sotien = result.getString("sotien");
				String ghichu =  result.getNString("ghichu");
				String manv =  result.getString("manv");
				String matv =  result.getString("matv");
				listHoaDon.add(new BaoCaoThongKeModel(mahd, nghd, sotien, ghichu, manv, matv));
			}
			connect_db.closeConection(connect);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listHoaDon;
	}

	@Override
	public BaoCaoThongKeModel LayThongTin(String ma) {
		// TODO Auto-generated method stub
		return null;
	}

}
