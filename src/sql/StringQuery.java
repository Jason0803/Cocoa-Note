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
			"SELECT * FROM note WHERE id = ? AND (title LIKE '%?%' OR content LIKE '%?%')";
	String SEARCH_MEMO_BY_KEYWORD =
			"SELECT * FROM memo WHERE id=? AND content LIKE '%?%'";
	String SEARCH_SCHEDULE_BY_KEYWORD = 
	         "SELECT * FROM HR.SCHEDULE WHERE id=? AND (TITLE like %?% OR CONTENT like '%?%')";

}