package controller;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.util.ModelAndView;
import dao.diary.DiaryDAO;
import vo.diary.Diary;
import vo.diary.Memo;
import vo.diary.Note;
import vo.member.Member;

public class NoteViewController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		Member mvo = (Member)request.getSession().getAttribute("memberVO");
		Note note=DiaryDAO.getInstance().getNoteByNo(Integer.parseInt(request.getParameter("diaryNo")));
		request.setAttribute("note", note);
		return new ModelAndView("note_view.jsp");
	}

}
