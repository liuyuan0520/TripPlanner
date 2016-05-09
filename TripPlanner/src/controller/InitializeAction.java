package controller;

import javax.servlet.http.HttpServletRequest;

import org.genericdao.RollbackException;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;

import databean.Route;
import model.DAO;
import model.Model;
import util.Common;

public class InitializeAction extends Action {

	private Model model;
	private DAO dao;

	public InitializeAction(Model model) {
		this.model = model;
		this.dao = model.getDAO();
	}

	@Override
	public String getName() {
		return "initialize.do";
	}

	@Override
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
		JsonArray routesArray = Common.getRoutes();
		for (JsonElement routeAsJsonElement : routesArray) {
			String routeId = routeAsJsonElement.getAsJsonObject().getAsJsonPrimitive("rt").getAsString();
			String routeName = routeAsJsonElement.getAsJsonObject().getAsJsonPrimitive("rtnm").getAsString();
			JsonArray directionsArray = Common.getDirections(routeId);
			for (JsonElement directionAsJsonElement : directionsArray) {
				String direction = directionAsJsonElement.getAsJsonObject().getAsJsonPrimitive("dir").getAsString();
				JsonArray stopsArray = Common.getStops(routeId, direction);
				for (JsonElement stopAsJsonElement : stopsArray) {
					Route route = new Route();
					route.setRouteId(routeId);
					route.setRouteName(routeName);
					String stopId = stopAsJsonElement.getAsJsonObject().getAsJsonPrimitive("stpid").getAsString();
					route.setStopId(Integer.parseInt(stopId));
					String stopName = stopAsJsonElement.getAsJsonObject().getAsJsonPrimitive("stpnm").getAsString();
					route.setStopName(stopName);
					String stopLat = stopAsJsonElement.getAsJsonObject().getAsJsonPrimitive("lat").getAsString();
					route.setStopLat(Double.parseDouble(stopLat));
					String stopLong = stopAsJsonElement.getAsJsonObject().getAsJsonPrimitive("lon").getAsString();
					route.setStopLong(Double.parseDouble(stopLong));
					try {
						dao.create(route);
					} catch (RollbackException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
	}
}
