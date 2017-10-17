package dao.diary;

// #00011 : import change required

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import sql.StringQuery;
import util.CocoaDate;
import util.DataSourceManager;
import vo.diary.Memo;
import vo.diary.Note;
import vo.diary.Schedule;

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
	public Vector<Schedule> getAllSchedule(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Vector<Schedule> sc = null;
		String[] temp_str = {};
		
		try {
			conn = getConnection();
			sc = new Vector<Schedule>();
			ps= conn.prepareStatement(StringQuery.GET_ALL_SCHEDULE);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				sc.add(new Schedule(rs.getInt("schedule_no"), rs.getString("id"), rs.getString("title"), temp_str,
						new CocoaDate(rs.getDate("start_date")), new CocoaDate(rs.getDate("end_date"))));
			}
			
		}catch(Exception e) {
			System.out.println("ERROR : [DiaryDAO]@getAllSchedule : SQLException Caught !");
			e.printStackTrace();
		}finally {
			closeAll(rs, ps, conn);
			System.out.println("[DiaryDAO]@getAllSchedule : Arrived finally clause");
		}
		return null;
	}
	// ------------------------------ getAllNote ------------------------------ //
	public Vector<Note> getAllNote(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Vector<Note> n = null;
		
		try {
			conn = getConnection();
			n = new Vector<Note>();
			ps= conn.prepareStatement(StringQuery.GET_ALL_NOTE);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(rs, ps, conn);
		}
		return null;
	}
}
