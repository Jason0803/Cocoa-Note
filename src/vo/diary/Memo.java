package vo.diary;

import java.util.Date;

import util.CocoaDate;

public class Memo extends Diary {
	private int memo_no;
	private String member_id; // foriegn key
	private CocoaDate writeDate;
	private CocoaDate currDate;
	private String title;	
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
	
	// #00052 : Memo Constructor UPDATE 2

	public Memo(int memo_no, String member_id, CocoaDate writeDate, CocoaDate currDate, String title, String content) {
		super();
		this.memo_no = memo_no;
		this.member_id = member_id;
		this.writeDate = writeDate;
		this.currDate = currDate;
		this.title = title;
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
