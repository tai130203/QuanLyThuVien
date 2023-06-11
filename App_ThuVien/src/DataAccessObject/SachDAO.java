package DataAccessObject;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JButton;

import DB_util.connect_db;
import Model.NhanVienModel;
import Model.SachModel;

public class SachDAO implements DAOinterface<SachModel>{

	public static SachDAO getinstance()
	{
		return new SachDAO();
	}
	@Override
	public int insert(SachModel t) {
		int kq=0;
		try {
//			INSERT INTO SACH VALUES ('IT003', 'Toeic Listening Practice', 'Nhà xu?t b?n Tr?', 
//					'Nguyen Lan Anh', 13, 'Moi', '135000', '2005');

			Connection connect = connect_db.getConnnection();
			String sql = "insert into sach values(?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = connect.prepareStatement(sql);
			ps.setString(1, t.getMASACH());
			ps.setNString(2, t.getTENSACH());
			ps.setNString(3, t.getNXB());
			ps.setNString(4, t.getTACGIA());
			ps.setInt(5, t.getSOLUONG());
			ps.setNString(6, t.getTINHTRANG());
			ps.setString(7, t.getGIA());
			ps.setString(8, t.getNAMXB());
			kq = ps.executeUpdate();
			connect_db.closeConection(connect);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return kq;
	}

	@Override
	public int update(SachModel t) {
		int kq=0;
		try {
			Connection connect = connect_db.getConnnection();
			String sql = "update sach set tensach = ?, nxb = ?, tacgia = ?, soluong = ?, tinhtrang = ?, gia = ?, namxb = ?"
					+ "where masach = ?";
			PreparedStatement ps = connect.prepareStatement(sql);
			ps.setNString(1, t.getTENSACH());
			ps.setNString(2, t.getNXB());
			ps.setNString(3, t.getTACGIA());
			ps.setInt(4, t.getSOLUONG());
			ps.setNString(5, t.getTINHTRANG());
			ps.setString(6, t.getGIA());
			ps.setString(7, t.getNAMXB());
			ps.setString(8, t.getMASACH());

			kq = ps.executeUpdate();
			connect_db.closeConection(connect);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return kq;
	}

	@Override
	public int delete(SachModel t) {
		try {
			Connection connection = connect_db.getConnnection();

			String sql = "select count(*) as soluong from muontrasach mt where mt.masach = ?";
			PreparedStatement prepareSQL = connection.prepareStatement(sql);

			prepareSQL.setString(1, t.getMASACH());
			ResultSet count = prepareSQL.executeQuery();
			if (count.next()) {
				if(count.getInt("soluong") == 0)
				{
					String sqlDelete = "delete from sach where masach = ?";
					PreparedStatement prepareDelete = connection.prepareStatement(sqlDelete);
					prepareDelete.setString(1, t.getMASACH());
					int result = prepareDelete.executeUpdate();
					return 1; // xoa duoc
				}
				else
				{
					return 0; // khong xoa duoc
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
		
}

	@Override
	public ArrayList<SachModel> selectAll() {
		ArrayList<SachModel> listSach = new ArrayList<SachModel>();

		try {
			
			Connection connect = connect_db.getConnnection();
			
			String sql = "select * from sach";
			
			Statement st = connect.createStatement();
			
			ResultSet result = st.executeQuery(sql);


			while(result.next())
			{
				String masach = result.getString("MASACH");
				String tensach = result.getNString("TENSACH");
				String NXB = result.getNString("NXB");
				String namxb = result.getString("NAMXB");
				String tacgia = result.getNString("TACGIA");
				int soluong = result.getInt("SOLUONG");
				String TINHTRANG = result.getNString("TINHTRANG");
				String Gia =  result.getString("GIA");
				
				listSach.add(new SachModel(masach, tensach, NXB, namxb, tacgia, soluong, TINHTRANG, Gia));
				
			}
			
			connect_db.closeConection(connect);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listSach;
	}

	@Override
	public SachModel selectById(SachModel t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<SachModel> selectByCondition(String ma ) {
		ArrayList<SachModel> listSach = new ArrayList<SachModel>();

		try {
			
			Connection connect = connect_db.getConnnection();
			
			String sql = "select * from sach where masach like '" + ma + "%'" ;
			
			Statement st = connect.createStatement();
			
			ResultSet result = st.executeQuery(sql);


			while(result.next())
			{
				String masach = result.getString("MASACH");
				String tensach = result.getNString("TENSACH");
				String NXB = result.getNString("NXB");
				String namxb = result.getString("NAMXB");
				String tacgia = result.getNString("TACGIA");
				int soluong = result.getInt("SOLUONG");
				String TINHTRANG = result.getNString("TINHTRANG");
				String Gia =  result.getString("GIA");
				
				listSach.add(new SachModel(masach, tensach, NXB, namxb, tacgia, soluong, TINHTRANG, Gia));
			}
			
			connect_db.closeConection(connect);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listSach;
	}
	@Override
	public SachModel LayThongTin(String ma) {
		try {
			Connection connecttion = connect_db.getConnnection();
			Statement st = connecttion.createStatement();
			
			String sql = "select * from Sach";
			
			ResultSet result = st.executeQuery(sql);

			while(result.next())
			{
				if (result.getString("MASACH").equals(ma))
				{
					String MASACH = result.getString("MASACH");
					 String TENSACH  = result.getString("TENSACH");
					 String NXB = result.getNString("NXB");
					 String tacgia = result.getNString("TACGIA");
					 int soluong = result.getInt("SOLUONG");
					 
					 String tinhtrang = result.getNString("TINHTRANG");
					 String gia = result.getString("GIA");
					 String namxb = result.getString("NAMXB");
					

					SachModel sachmoi = new SachModel(MASACH, TENSACH, NXB, namxb, tacgia, soluong, tinhtrang, gia);
					return sachmoi;
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
