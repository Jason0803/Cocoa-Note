package model.vo.diary;

import java.util.Date;

import util.CocoaDate;

public class Note extends Memo {
	private CocoaDate currentDate;
	private String title;
	
	public CocoaDate getCurrentDate() {
		return currentDate;
	}

	public void setCurrentDate(CocoaDate currentDate) {
		this.currentDate = currentDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Note() {
		super();
	}
	
	public Note(int no, String id){ 
		super(no, id);
	}
	
	public Note(int no, String id, CocoaDate writeDate, String content){ 
		super(no, id, writeDate, content);
	}

	public Note(CocoaDate currentDate, String title) {
		super();
		this.currentDate = currentDate;
		this.title = title;
	}

	public Note(int no, String id, CocoaDate writeDate, String content, CocoaDate currentDate, String title) {
		super(no, id, writeDate, content);
		this.currentDate = currentDate;
		this.title = title;
	}

	
	@Override
	public String toString() {
		return "Note [title=" + title + ", currentDate=" + currentDate + "]";
	}

}
