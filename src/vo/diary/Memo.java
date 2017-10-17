package vo.diary;

import java.util.Date;

import util.CocoaDate;

public class Memo extends Diary {
	private int memo_no;
	private CocoaDate writeDate;
	private String member_id; // foriegn key
	private String content;
	
	public Memo() {
		super();
	}
	
	// #00049 : Memo Constructor UPDATE
	public Memo(int memo_no, String member_id, CocoaDate writeDate) {
		super();
		this.memo_no = memo_no;
		this.member_id = member_id;
		this.writeDate = writeDate;
	}

	public Memo(int memo_no, CocoaDate writeDate, String member_id, String content) {
		super();
		this.memo_no = memo_no;
		this.writeDate = writeDate;
		this.member_id = member_id;
		this.content = content;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public CocoaDate getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(CocoaDate writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "Memo [content=" + content + ", writeDate=" + writeDate + "]";
	}
	
	
}
