package util;

import java.util.Calendar;
import java.util.Date;

/*
 * Date 관리용 커스텀 클래스.
 * DB에서 Date 타입 컬럼 요청시 SELECT to_char(date, 'YYYYMMDDHH24MI') FROM table
 * Constructor 
 * 1) String type의 YYYYMMDDHH24MI
 * 2) int year, int month, int day
 * 3) Calendar 객체
 * 
 * 2017.10.17 / coding by K
 */

public class CocoaDate {
	private int year;
	private int month;
	private int date;
	private int startDay;
	private int lastDate;
	private int hour;
	private int minute;
	private Calendar originCal;
	private Calendar renewCal;
	
	public CocoaDate() { //인자값 없이 CocoaDate 생성시 현재시간으로 생성
		Calendar cal = Calendar.getInstance();
		setDefault(cal.get(cal.YEAR), cal.get(cal.MONTH)+1, cal.get(cal.DATE), cal.get(cal.HOUR), cal.get(cal.MINUTE));
		setRenewCal(cal);
	}
	
	public CocoaDate(Calendar cal) {
		setDefault(cal.get(cal.YEAR), cal.get(cal.MONTH)+1, cal.get(cal.DATE), cal.get(cal.HOUR), cal.get(cal.MINUTE));
		setRenewCal(cal);
	}
	
	public CocoaDate(int year, int month, int date) {
		Calendar cal = Calendar.getInstance();
		cal.set(year, month-1, date);
		setDefault(cal.get(cal.YEAR), cal.get(cal.MONTH)+1, cal.get(cal.DATE), cal.get(cal.HOUR), cal.get(cal.MINUTE));
		setRenewCal(cal);
	}
	
	public CocoaDate(String sql_date) {
		//YYYYMMDDHHMM
		//012345678901
		int year = Integer.parseInt(sql_date.substring(0, 4));
		int month = Integer.parseInt(sql_date.substring(4, 6));
		int date = Integer.parseInt(sql_date.substring(6, 8));
		int hour = Integer.parseInt(sql_date.substring(8, 10));
		int minute = Integer.parseInt(sql_date.substring(10));
		Calendar cal = Calendar.getInstance();
		cal.set(year, month, date, hour, minute);
		setDefault(year, month, date, hour, minute);
		setRenewCal(cal);
	}
	
	// #00047 : Constructor for DATE type --> CocoaDate
	public CocoaDate(Date date) {
		this.year = date.getYear();
		this.month = date.getMonth();
		this.date = date.getDate();
		this.hour = date.getHours();
		this.minute = date.getMinutes();
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		// cal.set(date.getYear(), date.getMonth(), date.getDate(), date.getHours(), date.getMinutes());
		setDefault(date.getYear(), date.getMonth(), date.getDate(), date.getHours(), date.getMinutes());
		setRenewCal(cal);
	}
	
	private void setDefault(int year, int month, int date, int hour, int minute) {
		this.year = year;
		this.month = month;
		this.date = date;
		this.hour = hour;
		this.minute = minute;
	} // CocoaDate 객체 필드에 연월일분초를 할당하는 내부메소드
	
	public Calendar getOriginCal() {
		return originCal;
	}

	public void setOriginCal(Calendar originCal) {
		this.originCal = originCal;
	}

	public Calendar getRenewCal() {
		return renewCal;
	}

	public void setRenewCal(Calendar originCal) {
		this.renewCal = originCal;
		renewCal.set(Calendar.DATE, 1);
		this.startDay = renewCal.get(renewCal.DAY_OF_WEEK);
		this.lastDate = renewCal.getActualMaximum(renewCal.DATE);
	} // Date연산용 temp Calendar 객체를 생성

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
		this.lastDate = endDay;
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
		return lastDate;
	}
}
