package vo.diary;

import java.util.Date;

import util.CocoaDate;

public class Memo extends Diary {
	private String content;
	private CocoaDate writeDate;
	
	public Memo() {
		super();
	}

	public Memo(String content, CocoaDate writeDate) {
		super();
		this.content = content;
		this.writeDate = writeDate;
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
