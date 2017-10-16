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
		}
		return controller;
	}
}
