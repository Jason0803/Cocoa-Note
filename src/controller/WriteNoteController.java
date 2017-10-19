package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.util.ModelAndView;
import dao.diary.DiaryDAO;
import util.CocoaDate;
import vo.diary.Memo;
import vo.diary.Note;
import vo.member.Member;

public class WriteNoteController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member vo = (Member)request.getSession().getAttribute("memberVO");
		String id = vo.getId();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		DiaryDAO.getInstance().writeDiary(new Note(0, id, new CocoaDate(), content, new CocoaDate(), title));
		return new ModelAndView("", true);
	}

}
