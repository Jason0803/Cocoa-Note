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
		
		switch(command) {
			case "login" : {
				controller = new LoginController();
				break;
			}
			case "updateMember" : {
				controller = new UpdateMemberController();
				break;
			}
			case "writeMemo" : {
				controller = new WriteMemoController();
				break;
			}
			case "memoList" : {
				controller = new MemoListController();
				break;
			}
			case "cal" : {
				controller = new CalendarController();
				break;
			}
			case "serach" : {
				controller = new SearchController();
				break;
			}
			case "writeNote" : {
				controller = new WriteNoteController();
				break;
			}
			// #00082 : HandlerMapping or 6 New ..Controllers
			case "noteList" : {
				// 전체 노트 가져오는 것
				controller = new NoteListController();
				break;
			}
			case "noteView" : {
				// 특정 no 를 받아서, 그 넘버 해당하는 노트를 리턴
				controller = new NoteViewController();
				break;
			}
			case "scheduleView" : {
				// 특정 no 를 받아서, 그 넘버 해당하는 스케쥴 리턴
				controller = new ScheduleViewController();
				break;
			}
			case "deleteDiary" : {
				// 그 넘버 해당하는 것 지움
				controller = new DeleteDiaryController();
				break;
			}
			case "updateNote" : { 
				//노트 내용을 수정 
				// no 는 해당 노트를찾기 위한 것이
				// title / content 수정 함
				controller = new UpdateNoteController();
				break;
			}
			case "updateSchedule" : {
				//노트 내용을 수정 
				// no 는 해당 노트를찾기 위한 것이
				// title / content / 시작날짜 / 끝날짜 수정 함
				controller = new UpdateScheduleController();
				break;
			}
		}
		/*
		if(command.equals("register")) {
			controller = new RegisterMemberController();
		} else if(command.equals("login")) {
			controller = new LoginController();
		} else if(command.equals("updateMember")) {
			controller = new UpdateMemberController();
		} else if(command.equals("writeMemo")) {
			controller = new WriteMemoController();
		} else if(command.equals("memoList")) {
			controller = new MemoListController();
		} else if(command.equals("cal")) {
			controller = new CalendarController();
		} else if(command.equals("search")) {
			controller = new SearchController();
		} else if(command.equals("writeNote")) {
			controller = new WriteNoteController();
		}
		*/
		return controller;
	}
}
