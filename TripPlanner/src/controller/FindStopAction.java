package controller;

import javax.servlet.http.HttpServletRequest;

import org.genericdao.RollbackException;

import databean.Route;
import model.DAO;
import model.Model;

public class FindStopAction extends Action {

    private DAO stopDAO;

    public FindStopAction(Model model) {
        stopDAO = model.getDAO();
    }

    @Override
    public String getName() {
        return "findstop-ajax.do";
    }

    @Override
    public String perform(HttpServletRequest request) {

        String routeId = request.getParameter("rt");
        String direction = request.getParameter("dir");

        Route[] stops;
        try {
            stops = stopDAO.getAllStopsByRouteIdandDir(routeId, direction);
            request.setAttribute("stops", stops);
        } catch (RollbackException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return "findStop.ajax";
    }

}
