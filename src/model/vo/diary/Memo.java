package model.vo.diary;

import java.util.Date;

import util.CocoaDate;

public class Memo extends Diary {
	protected CocoaDate writeDate;
	protected String content;
	
	public Memo() {
		super();
	}
	
	public Memo(int no, String id){ 
		super(no, id);
	}
	
	public Memo(CocoaDate writeDate, String content) {
		super();
		this.writeDate = writeDate;
		this.content = content;
	}
	
	public Memo(int no, String id, CocoaDate writeDate, String content) {
		super(no, id);
		this.writeDate = writeDate;
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
