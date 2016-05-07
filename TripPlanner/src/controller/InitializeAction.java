package controller;

import javax.servlet.http.HttpServletRequest;

import model.DAO;
import model.Model;

public class InitializeAction {

	private Model model;
	private DAO dao;

	public InitializeAction(Model model) {
		this.model = model;
	}

	public String getName() {
		return "initialize.do";
	}

	public String perform(HttpServletRequest request) {

		return "index.jsp";
	}
}
