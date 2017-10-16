package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.util.ModelAndView;

public interface Controller {
	public ModelAndView handle(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
