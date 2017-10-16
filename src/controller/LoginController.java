package controller;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.util.ModelAndView;
import dao.member.MemberDAO;
import vo.member.Member;

public class LoginController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		int month = Calendar.getInstance().get(Calendar.MONTH) + 1;
		String path = "cal.jsp?month="+month;
		Member vo = MemberDAO.getInstance().login(id, password);
		if(vo==null) path = "login.jsp?login=false";
		else {
			HttpSession session = request.getSession();
			session.setAttribute("memberVO", vo);
		}
		return new ModelAndView(path, true);
	}

}
