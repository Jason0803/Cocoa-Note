package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.util.ModelAndView;
import dao.diary.DiaryDAO;
import util.CocoaDate;
import vo.day.Day;
import vo.member.Member;

public class CalendarController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member vo = (Member)request.getSession().getAttribute("memberVO");
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		System.out.println(year);
		CocoaDate date = new CocoaDate(year, month, 1);
//		ArrayList<Day> monthlyDiary = DiaryDAO.getInstance().getMonthlyDiary(date);
		return new ModelAndView("cal.jsp?year="+year+"&month="+month);
	}

}
