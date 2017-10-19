package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.util.ModelAndView;
import dao.diary.DiaryDAO;
import util.CocoaDate;
import vo.day.Day;
import vo.member.Member;

public class CalendarViewController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member vo = (Member)request.getSession().getAttribute("memberVO");
		String id = vo.getId();
		
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		int date = Integer.parseInt(request.getParameter("date"));
		
		Day day = DiaryDAO.getInstance().getDay(id, year, month, date);
		
		System.out.println(year);
		CocoaDate cocoa = new CocoaDate(year, month, 1);
		
		request.setAttribute("day", day);
		return new ModelAndView("cal_view.jsp");
	}

}
