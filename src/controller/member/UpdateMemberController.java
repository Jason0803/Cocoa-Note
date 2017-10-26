package controller.member;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.ModelAndView;
import model.dao.member.MemberDAO;
import model.vo.member.Member;
import util.CocoaDate;

public class UpdateMemberController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String newPassword = request.getParameter("new_password");
		String name = request.getParameter("name");		
		String themeTemp = request.getParameter("theme"); 	// #00192: theme 값변경 
		int theme = 0;
		System.out.println("프론트에서 넘어온 테마 값:"+themeTemp);
		if(themeTemp.equals("코코아")) theme = 1;
		else if(themeTemp.equals("피치")) theme=2;
		System.out.println(theme+"테마 받았당!!!!!!!!!!!!!!!!!");
		int accountPlan = 1;
		
		int month = Calendar.getInstance().get(Calendar.MONTH) + 1;
		String path = null;
		CocoaDate today = new CocoaDate();
		Member vo = MemberDAO.getInstance().updateMember(new Member(id, password, name, accountPlan, theme), newPassword, theme);
		if(vo==null) path = "updateMember.jsp";
		else {
			HttpSession session = request.getSession();
			session.setAttribute("memberVO", vo);
			path = "DispatcherServlet?command=cal&year="+today.getYear()+"&month="+today.getMonth();
		}
		return new ModelAndView(path, true);
	}

}
