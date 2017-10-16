package vo_diary;

import java.util.Date;

public class Memo extends Diary {
	private String content;
	private Date writeDate;
	
	public Memo() {
		super();
	}

	public Memo(String content, Date writeDate) {
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

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "Memo [content=" + content + ", writeDate=" + writeDate + "]";
	}
	
	
}
