package vo.diary;

import java.util.Date;

import util.CocoaDate;

public class Note extends Memo {
	private String title;
	private CocoaDate currentDate;
	
	public Note() {
		super();
	}

	public Note(String title, CocoaDate currentDate) {
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

	public CocoaDate getCurrentDate() {
		return currentDate;
	}

	public void setCurrentDate(CocoaDate currentDate) {
		this.currentDate = currentDate;
	}

	@Override
	public String toString() {
		return "Note [title=" + title + ", currentDate=" + currentDate + "]";
	}
	
	
}
