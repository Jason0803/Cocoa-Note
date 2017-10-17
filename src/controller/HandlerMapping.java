package controller;

import dao.member.MemberDAO;

public class HandlerMapping {
	private static HandlerMapping handler = new HandlerMapping();
	private HandlerMapping() {}
	public static HandlerMapping getHandler() {
		return handler;
	}
	
	public Controller handleRequest(String command) {
		Controller controller = null;
		if(command.equals("register")) {
			controller = new RegisterMemberController();
		} else if(command.equals("login")) {
			controller = new LoginController();
		} else if(command.equals("updateMember")) {
			controller = new UpdateMemberController();
		} else if(command.equals("writeMemo")) {
			controller = new WriteMemoController();
		}
		return controller;
	}
}
