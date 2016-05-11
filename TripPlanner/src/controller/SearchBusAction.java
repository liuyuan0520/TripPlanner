package controller;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.genericdao.RollbackException;

import databean.Route;
import model.DAO;
import model.Model;

public class SearchBusAction extends Action {

    private DAO routeDAO;

    public SearchBusAction(Model model) {
        routeDAO = model.getDAO();
    }

    @Override
    public String getName() {
        return "searchBus.do";
    }

    @Override
    public String perform(HttpServletRequest request) {
        // get all bus list
        Route[] routes = null;
        try {
            routes = routeDAO.getAllRoutes();
        } catch (RollbackException e) {
            e.printStackTrace();
        }
        Set<String> routeSet = new HashSet<>();
        Map<String, String> routeName = new HashMap<>();
        for (Route r : routes) {
            if (routeSet.contains(r.getRouteId())) {
                continue;
            }
            routeSet.add(r.getRouteId());
            routeName.put(r.getRouteId(), r.getRouteName());
        }
        int size = routeSet.size();
        String[] routeArr = new String[size];
        String[] nameArr = new String[size];
        Iterator<String> it = routeSet.iterator();
        int count = 0;
        while (it.hasNext()) {
            String tmpRoute = it.next();
            routeArr[count] = tmpRoute;
            nameArr[count++] = routeName.get(tmpRoute);
        }

        // for (int i = 0; i < routeArr.length; i++) {
        // System.out.println(routeArr[i] + " " + nameArr[i]);
        // }
        request.setAttribute("routeId", routeArr);
        request.setAttribute("routeName", nameArr);
        return "searchBus.jsp";
    }

}
