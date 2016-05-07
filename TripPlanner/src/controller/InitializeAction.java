package controller;

import javax.servlet.http.HttpServletRequest;

import org.genericdao.RollbackException;

import model.DAO;
import model.Model;
import util.Common;

public class InitializeAction {

	private Model model;
	private DAO dao;

	public InitializeAction(Model model) {
		this.model = model;
		this.dao = model.getDAO();
	}

	public String getName() {
		return "initialize.do";
	}

	public String perform(HttpServletRequest request) {
		try {
			if (dao.getCount() == 0) {
				initialize();
			}
		} catch (RollbackException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "index.jsp";
	}

	public void initialize() {
		Common.getRoutes();

	}
}
