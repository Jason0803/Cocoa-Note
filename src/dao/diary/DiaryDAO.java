package dao.diary;

// #00011 : import change required

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import sql.StringQuery;
import util.CocoaDate;
import util.DataSourceManager;
import vo.day.Day;
import vo.diary.Diary;
import vo.diary.Memo;
import vo.diary.Note;
import vo.diary.Schedule;
import vo.member.Member;

public class DiaryDAO {
	private static DiaryDAO dao = new DiaryDAO();
	private DiaryDAO() {}
	public static DiaryDAO getInstance() {
		return dao;
	}
	
	public Connection getConnection() throws SQLException{
		return DataSourceManager.getInstance().getConnection();
	}
	public void closeAll(PreparedStatement ps, Connection conn)throws SQLException{
		if(ps!=null) ps.close();
		if(conn!=null) conn.close();
	}
	
	public void closeAll(ResultSet rs,PreparedStatement ps, Connection conn)throws SQLException{
		if(rs!=null){
			rs.close();
			closeAll(ps, conn);
		}
	}//
	
	
	// ------------------------------ Logics ------------------------------ //
	// ------------------------------ [TEMP TEST] ------------------------------ //
	public void printMemoDate(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement("SELECT wrt_date FROM memo WHERE id = ?");
			//ps.setString(parameterIndex, x);
		} catch(SQLException e) {
			
		} finally {
			
		}
	}
	// ------------------------------ getAllMemo ------------------------------ //
	public Vector<Memo> getAllMemo(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Vector<Memo> v = null;
		
		try {
			conn = getConnection();
			v = new Vector<Memo>();
			ps = conn.prepareStatement(StringQuery.GET_ALL_MEMO);
			rs = ps.executeQuery();
			
			// #00053 : getAllMemo
			while(rs.next()) {
				Memo m = new Memo(rs.getInt("note_no"), 
						rs.getString("id"),
						new CocoaDate(rs.getDate("wrt_date")), 
						new CocoaDate(rs.getDate("curr_date")),
						rs.getString("title"), 
						rs.getString("content"));
				v.add(m);
			}
		} catch(SQLException e) {
			System.out.println("ERROR : [DiaryDAO]@getAllMemo : SQLException Caught !");
			e.printStackTrace();
		} finally {
			System.out.println("[DiaryDAO]@getAllMemo : Arrived finally clause");
			closeAll(rs,ps,conn);
		}
		
		return v;
	}
	// ------------------------------ getAllSchedule ------------------------------ //
	public Vector<Schedule> getAllSchedule(String id) {
		return null;
	}
	public Vector<Note> getAllNote(String id) {
		return null;
	}
}
