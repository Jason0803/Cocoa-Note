package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.util.ModelAndView;
import dao.diary.DiaryDAO;
import vo.diary.Schedule;
import vo.member.Member;

public class DeleteDiaryController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member mvo = (Member)request.getSession().getAttribute("memberVO");
		int no = Integer.parseInt(request.getParameter("no"));
		request.setAttribute("no", no);
		return null;
	}

}


