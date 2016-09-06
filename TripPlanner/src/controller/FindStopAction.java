package controller;

import javax.servlet.http.HttpServletRequest;

import org.genericdao.RollbackException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import databean.Route;
import model.DAO;
import model.Model;

/**
 * @author Yuan Liu
 * @date 05/09/2016
 */
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

		Route[] stops = null;
		try {
			stops = stopDAO.getAllStopsByRouteIdandDir(routeId, direction);
			// request.setAttribute("stops", stops);
		} catch (RollbackException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JSONArray stopArray = new JSONArray();
		JSONObject resObj = new JSONObject();
		if (stops != null && stops.length != 0) {
			for (Route s : stops) {
				JSONObject jb = new JSONObject();
				jb.put("stopId", s.getStopId());
				jb.put("stopName", s.getStopName());
				jb.put("lat", s.getStopLat());
				jb.put("lon", s.getStopLong());
				jb.put("routeId", s.getRouteId());
				stopArray.add(jb);
			}
			resObj.put("status", "success");
			resObj.put("stops", stopArray);
		} else {
			resObj.put("status", "fail");
		}
		request.setAttribute("stops", resObj);
		return "findStops.ajax";
	}

}
