package controller.calendar;

import java.util.Vector;

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

import controller.Controller;
import controller.ModelAndView;
import model.dao.diary.DiaryDAO;
import model.dao.member.MemberDAO;
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
		
		Vector<String> sharedIds = DiaryDAO.getInstance().findSharingMembers(Integer.parseInt(request.getParameter("diaryNo")));
		Vector<Member> sharedMembers = new Vector<Member>();
		
		for(String tempId : sharedIds)
			sharedMembers.add(MemberDAO.getInstance().findMemberById(tempId));
		
		request.setAttribute("group_member", sharedMembers);
		
		Day day = DiaryDAO.getInstance().getDay(id, year, month, date);
		
		// #00089 : Issue #10002 : Cal_view.jsp 완료 !
		request.setAttribute("dayInfo", day);
		System.out.println("CalendarViewController attribute : " + day);
		return new ModelAndView("cal_view.jsp");
	}

}
