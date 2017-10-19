package controller;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.util.ModelAndView;
import dao.diary.DiaryDAO;
import vo.diary.Memo;
import vo.diary.Schedule;
import vo.member.Member;

public class UpdateScheduleController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member mvo = (Member) request.getSession().getAttribute("memberVO");
		// Schedule schedule = DiaryDAO.getInstance().getAllMemo(mvo.getId());
		request.setAttribute("schedule", schedule);
		return new ModelAndView("update_schedule.jsp");
	}

}
