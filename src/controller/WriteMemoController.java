package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.util.ModelAndView;
import dao.diary.DiaryDAO;
import util.CocoaDate;
import vo.diary.Memo;
import vo.member.Member;

public class WriteMemoController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member vo = (Member)request.getSession().getAttribute("memberVO");
		String id = vo.getId();
		String content = request.getParameter("content");
		DiaryDAO.getInstance().writeDiary(new Memo(0, id, new CocoaDate(), content));
		return new ModelAndView("write_memo_result.jsp?close=true", true);
	}

}
