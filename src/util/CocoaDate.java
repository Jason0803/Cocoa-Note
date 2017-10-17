package util;

import java.util.Calendar;

public class CocoaDate {
	private int year;
	private int month;
	private int date;
	private int startDay;
	private int endDay;
	private Calendar cal;
	private Calendar cal2;
	
	public CocoaDate(Calendar cal) {
		this.year = cal.get(cal.YEAR);
		this.month = cal.get(cal.MONTH)+1;
		this.date = cal.get(cal.DATE);
		this.cal2 = cal;
		cal2.set(Calendar.DATE, 1);
		this.startDay = cal2.get(cal2.DAY_OF_WEEK);
		this.endDay = cal2.getActualMaximum(cal2.DAY_OF_MONTH);
	}
	
	public CocoaDate(int year, int month, int date) {
		Calendar cal = Calendar.getInstance();
		cal.set(year, month-1, date);
		this.year = cal.get(cal.YEAR);
		this.month = cal.get(cal.MONTH)+1;
		this.date = cal.get(cal.DATE);
		this.cal2 = cal;
		cal2.set(Calendar.DATE, 1);
		this.startDay = cal2.get(cal2.DAY_OF_WEEK);
		this.endDay = cal2.getActualMaximum(cal2.DATE);
	}
	
	
	public Calendar getCal() {
		return cal;
	}

	public void setCal(Calendar cal) {
		this.cal = cal;
	}

	public Calendar getCal2() {
		return cal2;
	}

	public void setCal2(Calendar cal2) {
		this.cal2 = cal2;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public void setDay(int day) {
		this.date = day;
	}

	public void setStartDay(int startDay) {
		this.startDay = startDay;
	}

	public void setEndDay(int endDay) {
		this.endDay = endDay;
	}

	public int getYear() {
		return year;
	}
	public int getMonth() {
		return month;
	}
	public int getDay() {
		return date;
	}
	public int getStartDay() {
		return startDay;
	}
	public int getEndDay() {
		return endDay;
	}
}
