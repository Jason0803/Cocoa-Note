package sql;

public interface StringQuery {
	/*
	 * Diary No 시퀀스 생성.
	 * 컬럼명 : seq_diary_no
	 * 다이어리 번호 부여방법 : INSERT 구문 사용시 no 컬럼에 seq_diary_no.NEXTVAL 기입
	 * - K
	 */
	
	// ----------------------------------- MemberDAO -------------------------------------- //
	String REGISTER_MEMBER =
			"INSERT INTO member VALUES(?,?,?,?,?)";
	String ISEXIST_MEMBER =
			"SELECT id FROM member WHERE id = ?";
	String CHECK_VALIDATION = 
			"SELECT password FROM member WHERE id = ?";
	String UPDATE_MEMBER =
			"UPDATE member SET password=?, name=?, acc_plan=?, theme=? where id=?";
	String GET_MEMBER_INFO =
			"SELECT * FROM member where id=?";
	
	// ----------------------------------- DiaryDAO -------------------------------------- //
	String GET_ALL_MEMO = 
			"SELECT * FROM memo WHERE id = ?";
	String GET_ALL_SCHEDULE =
			"SELECT * FROM schedule WHERE id = ?";
	String GET_ALL_NOTE =
			"SELECT * FROM note WHERE id = ?";

	String SEARCH_NOTE_BY_KEYWORD = 
			"SELECT * FROM note WHERE id = ? AND (title LIKE '%'||?||'%' OR content LIKE '%'||?||'%')";
	String SEARCH_MEMO_BY_KEYWORD =
			"SELECT * FROM memo WHERE id=? AND content LIKE '%'||?||'%'";
	String SEARCH_SCHEDULE_BY_KEYWORD = 
	         "SELECT * FROM SCHEDULE WHERE id=? AND (TITLE like '%'||?||'%' OR CONTENT like '%'||?||'%')";
	String GET_CURR_DIARYNO =
			 "SELECT seq_diary_no.currVal FROM dual";
	String WRITE_MEMO = 
			 "INSERT INTO memo (memo_no, id, content, wrt_date) VALUES(seq_diary_no.nextVal, ?, ?, to_date(?, 'YYYYMMDDHHMI'))";
	String WRITE_NOTE = 
			 "INSERT INTO note (note_no, id, title, content, wrt_date, curr_date) VALUES(seq_diary_no.nextVal, ?, ?, ?, to_date(?, 'YYYYMMDDHHMI'), to_date(?, 'YYYYMMDDHHMI'))";
	String GET_DAILY_NOTE_BY_ID = 
			 "SELECT * FROM note WHERE id=? AND to_char(wrt_date, 'YYYYMMDD')=?";
	String GET_DAILY_SCHEDULE_BY_ID = 
			 "SELECT * FROM schedule WHERE id=? AND to_char(start_date, 'YYYYMMDD')=?";


}