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
	
	
}
