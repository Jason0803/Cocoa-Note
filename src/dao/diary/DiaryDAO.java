package dao.diary;

// #00011 : import change required

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
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
	// ------------------------------ getAllNote ------------------------------ //
	public Vector<Note> getAllNote(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Vector<Note> n = null;
		
		try {
			conn = getConnection();
			n = new Vector<Note>();
			ps = conn.prepareStatement(StringQuery.GET_ALL_NOTE);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Note m = new Note(rs.getInt("note_no"), 			// no
						rs.getString("id"),							// id
						new CocoaDate(rs.getDate("wrt_date")), 		// writeDate
						rs.getString("content"),					// content
						new CocoaDate(rs.getDate("curr_date")),		// currentDate
						rs.getString("title"));						// title
				
				n.add(m);
			}

		} catch(SQLException e) {
			System.out.println("ERROR : [DiaryDAO]@getAllMemo : SQLException Caught !");
			e.printStackTrace();
		} finally {
			System.out.println("[DiaryDAO]@getAllMemo : Arrived finally clause");
			closeAll(rs,ps,conn);
		}
		
		return n;
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
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				sc.add(new Schedule(rs.getInt("schedule_no"), 			// no
						rs.getString("id"), 							// id
						rs.getString("title"), 							// title
						rs.getString("content"),						// content
						temp_str,										// group
						new CocoaDate(rs.getDate("start_date")),		// startDate
						new CocoaDate(rs.getDate("end_date"))));		// endDate
			}
			
		}catch(Exception e) {
			System.out.println("ERROR : [DiaryDAO]@getAllSchedule : SQLException Caught !");
			e.printStackTrace();
		}finally {
			closeAll(rs, ps, conn);
			System.out.println("[DiaryDAO]@getAllSchedule : Arrived finally clause");
		}
		return sc;
	}
	// ------------------------------ getAllMemo ------------------------------ //
	public Vector<Memo> getAllMemo(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Vector<Memo> m = null;
		
		try {
			conn = getConnection();
			m = new Vector<Memo>();
			ps= conn.prepareStatement(StringQuery.GET_ALL_MEMO);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				m.add(new Memo(rs.getInt("memo_no"), 
						id, 
						new CocoaDate(new Date(rs.getTimestamp("wrt_date").getTime())), 
						rs.getString("content")));
			}	
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(rs, ps, conn);
		}
		return m;
	}
	// ------------------------------ 		searchNote ------------------------------ //
	public Set<Note> searchNoteByKeyword(String id, String keyword) {
		Connection conn = null;
		Set<Note> result = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try { 
			conn = getConnection();
			result = new HashSet<Note>();
			ps = conn.prepareStatement(StringQuery.SEARCH_NOTE_BY_KEYWORD);
			ps.setString(1, id);
			ps.setString(2, keyword);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				if(rs.getString("title").equalsIgnoreCase(keyword) || rs.getString("content").equalsIgnoreCase(keyword)) {
					if(!result.contains(rs.getInt("note_no")) ){			
						Note n = new Note(rs.getInt("note_no"),
											rs.getString("id"),
											new CocoaDate(new Date(rs.getTimestamp("wrt_date").getTime())),
											rs.getString("content"),
											new CocoaDate(new Date(rs.getTimestamp("curr_date").getTime())),
											rs.getString("title"));
						result.add(n);
					}	
				}
			}
		} catch (SQLException e) {
			
		}
		return result;
	}
	// ------------------------------ 		searchMemo ------------------------------ //
	// ------------------------------ 	searchSchedule ------------------------------ //
	
}
