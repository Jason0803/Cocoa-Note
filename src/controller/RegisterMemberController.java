package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.util.ModelAndView;
import dao.member.MemberDAO;
import vo.member.Member;

public class RegisterMemberController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String path = "cal.jsp";
		Member vo = MemberDAO.getInstance().registerMember(new Member(id, password, name, 1, 1));
		if(vo==null) path
		return new ModelAndView(path, isRedirect);
	}

}
