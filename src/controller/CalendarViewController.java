package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
import controller.Controller;
import controller.util.ModelAndView;
import model.dao.diary.DiaryDAO;
import util.CocoaDate;
import model.vo.day.Day;
import model.vo.member.Member;
*/

import controller.util.ModelAndView;
import model.dao.diary.DiaryDAO;
import model.vo.day.Day;
import model.vo.member.Member;

public class CalendarViewController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member vo = (Member)request.getSession().getAttribute("memberVO");
		String id = vo.getId();
		
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		int date = Integer.parseInt(request.getParameter("date"));
		
		Day day = DiaryDAO.getInstance().getDay(id, year, month, date);
		
		// #00089 : Issue #10002 : Cal_view.jsp 완료 !
		request.setAttribute("dayInfo", day);
		System.out.println("CalendarViewController attribute : " + day);
		return new ModelAndView("cal_view.jsp");
	}

}
