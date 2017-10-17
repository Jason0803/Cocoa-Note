package vo.day;

import java.util.ArrayList;
import java.util.Date;
import java.util.Vector;

import util.CocoaDate;
import vo.diary.*;

public class Day {
	private CocoaDate date;
	private Vector<Note> notes;
	private Vector<Schedule> schedules;
	private Vector<Memo> memos;
	
	public Day() {
		super();
	}

	public Day(CocoaDate date) {
		super();
		this.date = date;
	}

	public CocoaDate getDate() {
		return date;
	}

	public void setDate(CocoaDate date) {
		this.date = date;
	}

	public Vector<Note> getNotes() {
		return notes;
	}

	public void setNotes(Vector<Note> notes) {
		this.notes = notes;
	}

	public Vector<Schedule> getSchedules() {
		return schedules;
	}

	public void setSchedules(Vector<Schedule> schedules) {
		this.schedules = schedules;
	}

	public Vector<Memo> getMemos() {
		return memos;
	}

	public void setMemos(Vector<Memo> memos) {
		this.memos = memos;
	}

	@Override
	public String toString() {
		return "Day [date=" + date + ", notes=" + notes + ", schedules=" + schedules + ", memos=" + memos + "]";
	}
	
	
}
