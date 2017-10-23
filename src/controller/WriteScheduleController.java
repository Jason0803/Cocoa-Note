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
		String title = (String)request.getAttribute("title");
		CocoaDate start_date = (CocoaDate)request.getAttribute("start_date"); 
		CocoaDate end_date = (CocoaDate)request.getAttribute("end_date");
		String content = (String)request.getAttribute("content");
		String[] members = ((String)request.getAttribute("group_member")).split(",");
		
		Schedule schedule = DiaryDAO.getInstance().writeDiary(new Schedule(
									0, 									// no
									id, 								// id
									title, 								// title
									content,							// content
									members,							// group_member_id
									start_date,			// start_date
									end_date));			// end_date
		
		
		return new ModelAndView("DispatcherServlet?command=calView& "
								+"year="+start_date.getYear()
								+"month="+start_date.getMonth()
								+"&date="+start_date.getDate());
	}
	
}
