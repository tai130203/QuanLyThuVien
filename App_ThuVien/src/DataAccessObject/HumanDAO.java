package DataAccessObject;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import DB_util.connect_db;
import Model.HumanModel;

public class HumanDAO implements DAOinterface<HumanModel>{

	public static HumanDAO getInstance()
	{
		return new HumanDAO();
	}
	@Override
	public int insert(HumanModel t) {
		
		int ketqua = 0;
		try {
			Connection connecttion = connect_db.getConnnection();
			Statement st = connecttion.createStatement();
			
			String sql = "insert into human values('"
			+ t.getMaHuman() + "', '" +t.getTenHuman() + "', '" + t.getUssername() + "', '" + t.getPassowrd()  + "')";
			
			
			ketqua = st.executeUpdate(sql);
			
			//st.executeUpdate("commit");
			
			System.out.println("ban da thuc thi: " + sql);
			System.out.println("row effect: " + ketqua);
			
			connect_db.closeConection(connecttion);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ketqua;
	}

	@Override
	public int update(HumanModel t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(HumanModel t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<HumanModel> selectAll() {
		ArrayList<HumanModel> ketqua = new ArrayList<HumanModel>();
		try {
			Connection connecttion = connect_db.getConnnection();
			Statement st = connecttion.createStatement();
			
			String sql = "select * from human";
			
			
			ResultSet result = st.executeQuery(sql);
			
			//st.executeUpdate("commit");
			
			System.out.println("ban da thuc thi: " + sql);
			
			while(result.next())
			{
				String ma = result.getString("ma");
				String ten = result.getString("ten");
				String ussername = result.getString("username");
				String password = result.getString("PassWord");
				
				ketqua.add(new HumanModel(ma, ten, ussername, password));
			}
			
			connect_db.closeConection(connecttion);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ketqua;
	}

	@Override
	public HumanModel selectById(HumanModel t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<HumanModel> selectByCondition(String condition) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public HumanModel LayThongTin(String ma) {
		// TODO Auto-generated method stub
		return null;
	}

}
