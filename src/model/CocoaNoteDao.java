package model;

// #00011 : import change required

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import sql.StringQuery;

public class CocoaNoteDao {
	private static CocoaNoteDao dao = new CocoaNoteDao();
	private CocoaNoteDao() {}
	public static CocoaNoteDao getInstance() {
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
	
	
	//---------------Biz Logic -------------------
	

	public boolean idDuplicateCheck(String id) {
		
		
	}
	
	public Member registerMember(Member vo) {
		
		
	}
	
	public Member login(String id, String password) {
		
		
	}
	
	public ArrayList<Day> getMonthlyDiary(int month){
		
		
	}
	
	public Day getDailyDiary(int day) {
		
		
	}
	
	public ArrayList<Diary> getAllDiary(String id){
		
		
	}
	
	public Diary getDiaryByNo(int DiaryNo) {
		
		
	}
	
	public Diary writeDiary(Diary diary) {
		
		
	}
	
	public Diary updayeDiary(Diary diary) {
		
		
	}
	
	public void deleteDiary(int DiaryNo) {
		
		
	}
	
}
