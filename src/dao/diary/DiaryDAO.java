package dao.diary;

// #00011 : import change required

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

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
	public Vector<Memo> getAllMemo(String id) {
		return null;
		
	}
	public Vector<Schedule> getAllSchedule(String id) {
		return null;
	}
	public Vector<Note> getAllNote(String id) {
		return null;
	}
}
