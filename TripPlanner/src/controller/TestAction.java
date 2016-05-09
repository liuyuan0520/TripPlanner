/**
 *  This action is used for test some functions.
 *  @author Zhihao Ji
 *  @date 05/09/2016
 */
package controller;

import javax.servlet.http.HttpServletRequest;

import org.genericdao.RollbackException;

import databean.Route;
import model.DAO;
import model.Model;

public class TestAction extends Action {

    private DAO stopDAO;

    public TestAction(Model model) {
        stopDAO = model.getDAO();
    }

    @Override
    public String getName() {
        return "test.do";
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
