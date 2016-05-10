package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import databean.Plan;
import util.Common;

/**
 * @author Yuan Liu
 * @date 05/09/2016
 */

public class PlanTripAction {

	public String getName() {
		return "dummy.do";
	}

	public String perform(HttpServletRequest request) {
		String origin = request.getParameter("origin");
		String destination = request.getParameter("destination");
		String departureTime = request.getParameter("departureTime");
		String arrivalTime = request.getParameter("arrivalTime");

		if (origin == null || origin.length() == 0) {
			origin = "wean hall";
		}

		departureTime = convertTime(departureTime);
		if (arrivalTime != null) {
			arrivalTime = convertTime(arrivalTime);
			departureTime = null;
		}

		List<Plan> plans = getPlans(origin, destination, departureTime, arrivalTime);
		request.getSession().setAttribute("plans", plans);

		return "results.jsp";
	}

	private String convertTime(String time) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		sdf.setTimeZone(TimeZone.getTimeZone("EST"));

		Date date = new Date();
		try {
			date = sdf.parse(time);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return String.valueOf(date.getTime() / 1000);
	}

	private List getPlans(String origin, String destination, String departure, String arrival) {
		JsonArray plansArray = Common.getGooglePlans(origin, destination, departure, arrival);
		List<Plan> plans = new ArrayList();
		for (JsonElement planAsElement : plansArray) {
			JsonArray legsArray = planAsElement.getAsJsonObject().getAsJsonArray("legs");
			for (JsonElement legAsElement : legsArray) {
				Plan plan = new Plan();
				JsonObject legAsObject = legAsElement.getAsJsonObject();

				String departureTime = legAsObject.getAsJsonPrimitive("departure_time").getAsString();
				String arrivalTime = legAsObject.getAsJsonPrimitive("departure_time").getAsString();
				String duration = legAsObject.getAsJsonPrimitive("duration").getAsString();

				plan.setArrivalTime(arrivalTime);
				plan.setDepartureTime(departureTime);
				plan.setDuration(duration);

				// List<Step> steps = new ArrayList();
				List<String> routes = new ArrayList();
				JsonArray stepsArray = legAsObject.getAsJsonArray("steps");
				for (JsonElement stepAsElement : stepsArray) {
					JsonObject stepAsObject = stepAsElement.getAsJsonObject();
					String travelMode = stepAsObject.getAsJsonPrimitive("travel_mode").getAsString();
					if (travelMode.equals("TRANSIT")) {
						String routeName = stepAsObject.getAsJsonObject("transit_details").getAsJsonObject("line")
								.getAsJsonPrimitive("short_name").getAsString();
						routes.add(routeName);
					}
				}

				if (routes.size() == 0) {
					routes.add("WALKING");
				}
				plan.setRoutes(routes);

				plans.add(plan);
			}
		}
		return plans;
	}
}
