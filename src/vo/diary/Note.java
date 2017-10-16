package vo.diary;

import java.util.Date;

public class Note extends Memo {
	private String title;
	private Date currentDate;
	
	public Note() {
		super();
	}

	public Note(String title, Date currentDate) {
		super();
		this.title = title;
		this.currentDate = currentDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getCurrentDate() {
		return currentDate;
	}

	public void setCurrentDate(Date currentDate) {
		this.currentDate = currentDate;
	}

	@Override
	public String toString() {
		return "Note [title=" + title + ", currentDate=" + currentDate + "]";
	}
	
	
}
