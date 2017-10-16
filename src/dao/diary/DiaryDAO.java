package dao.diary;

// #00011 : import change required

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
	
	
	//---------------Biz Logic -------------------
	
	public ArrayList<Day> getMonthlyDiary(String id, int month){
		return null;
		/*
		 * month를 받아 해당 월에 대한 Day 객체 배열을 반환. front 담당자와 조율 - K
		 */
		
	}
	
	public Day getDailyDiary(String id, int day) {
		return null;
		/*
		 * 특정 날짜에 해당하는 모든 다이어리를 반환(캘린더에서 날짜 클릭시 호출되는 로직) - K
		 */
		
	}
	
	public ArrayList<Diary> getAllDiary(String id){
		return null;
		/*
		 * 특정 회원에 대한 모든 다이어리를 반환. (note list에서 활용) - K
		 */
		
	}
	
	public Diary getDiaryByNo(int DiaryNo) {
		return null;
		/*
		 * 노트 번호로 다이어리 객체를 반환 - K
		 */
		
	}
	
	public int writeDiary(Memo memo) {
		return 0;
		/*
		 * Memo 데이터 추가 후 메모 no 반환(오버로딩) - K
		 * Note & Schedule
		 */
		
	}

	public int updateDiary(Memo memo) {
		return 0;
		/*
		 * Note & Schedule
		 */
		
	}

	public void deleteDiary(int DiaryNo) {

	}
	
}
