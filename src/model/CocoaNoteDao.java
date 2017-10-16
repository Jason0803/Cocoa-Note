package model;

// #00011 : import change required

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import sql.StringQuery;
import vo_diary.Diary;
import vo_diary.Memo;
import vo_diary.Note;
import vo_diary.Schedule;

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
		/*
		 * ID 중복체크 로직. ID String 값으로 member 테이블의 id 컬럼을 체크 - K
		 */
		
	}
	
	public Member registerMember(Member vo) {
		/*
		 * 중복체크후 member테이블에 신규회원 정보를 추가하고 해당 vo를 리턴 - K
		 */
		
	}
	
	public Member login(String id, String password) {
		/*
		 * 로그인 성공시 해당 vo를 리턴, 일치하는 정보 없을시 null vo 리턴 - K
		 */
		
	}
	
	public ArrayList<Day> getMonthlyDiary(String id, int month){
		/*
		 * month를 받아 해당 월에 대한 Day 객체 배열을 반환. front 담당자와 조율 - K
		 */
		
	}
	
	public Day getDailyDiary(String id, int day) {
		/*
		 * 특정 날짜에 해당하는 모든 다이어리를 반환(캘린더에서 날짜 클릭시 호출되는 로직) - K
		 */
		
	}
	
	public ArrayList<Diary> getAllDiary(String id){
		/*
		 * 특정 회원에 대한 모든 다이어리를 반환. (note list에서 활용) - K
		 */
		
	}
	
	public Diary getDiaryByNo(int DiaryNo) {
		/*
		 * 노트 번호로 다이어리 객체를 반환 - K
		 */
		
	}
	
	public int writeDiary(Memo memo) {
		/*
		 * Memo 데이터 추가 후 메모 no 반환(오버로딩) - K
		 */
		
	}
	
	public int writeDiary(Note note) {
		/*
		 * Note 데이터 추가 후 노트 no 반환(오버로딩) - K
		 */
		
	}
	
	public int writeDiary(Schedule schedule) {
		/*
		 * Schedule 데이터 추가 후 스케줄 no 반환(오버로딩) - K
		 */
		
	}
	
	public int updateDiary(Memo memo) {
		
		
	}
	
	public int updateDiary(Note note) {
		
		
	}
	
	public int updateDiary(Schedule schedule) {
		
		
	}
	
	public void deleteDiary(int DiaryNo) {
		
		
	}
	
}
