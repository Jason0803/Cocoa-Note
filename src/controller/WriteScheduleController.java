package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.util.ModelAndView;
import dao.diary.DiaryDAO;
import util.CocoaDate;

import vo.diary.Schedule;
import vo.member.Member;

public class WriteScheduleController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member vo = (Member)request.getSession().getAttribute("memberVO");
		String id = vo.getId();
		String title = (String)request.getParameter("title");
		String start_date = (String)request.getParameter("start_date"); 
		String end_date = (String)request.getParameter("end_date");
		String content = (String)request.getParameter("content");
		String[] members = ((String)request.getParameter("group_member")).split(",");
		
		Schedule schedule = DiaryDAO.getInstance().writeDiary(new Schedule(
									0, 									// no
									id, 								// id
									title, 								// title
									content,							// content
									members,							// group_member_id
									new CocoaDate(start_date),			// start_date
									new CocoaDate(end_date)));			// end_date
		
		
		return new ModelAndView("DispatcherServlet?command=calView&"
								+"year=" + new CocoaDate(start_date).getYear()
								+"&month="+ new CocoaDate(start_date).getMonth()
								+"&date="+ new CocoaDate(start_date).getDate());
	}
	
}
