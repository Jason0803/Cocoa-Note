package sql;

public interface StringQuery {
	String INSERT_POSTING = "INSERT INTO board (no, title, writer, password, content, time_posted) VALUES(board_seq.nextVal, ?, ?, ?, ?, sysdate)";
	String CURRENT_ARTICLE_NO = "SELECT board_seq.currVal FROM dual";
	String SELECT_POSTING = "SELECT title, writer, password, content, hits, time_posted FROM board WHERE no=?";
	String SELECT_ALL_POSTING = "SELECT no, content, title, writer, to_char(time_posted, 'YYYY.MM.DD') time_posted, hits FROM board ORDER BY no DESC";
	String CHECK_PASSWORD = "SELECT password FROM board WHERE no=?";
	String DELETE_POSTING = "DELETE FROM board WHERE no=?";
}
