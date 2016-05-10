package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Yuan Liu
 * @date 05/09/2016
 */

public class PlanTripsAction extends Action {

	public String getName() {
		return "planTrips.do";
	}

	public String perform(HttpServletRequest request) {
		String origin = request.getParameter("origin");
		String destination = request.getParameter("destination");
		String departureTime = request.getParameter("departureTime");
		String arrivalTime = request.getParameter("arrivalTime");

		System.out.println(origin);
		System.out.println(destination);

		if (origin == null || origin.length() == 0) {
			origin = "wean hall";
		}
		if (departureTime != null) {
			departureTime = convertTime(departureTime);
		}
		if (arrivalTime != null) {
			arrivalTime = convertTime(arrivalTime);
		} else {
			arrivalTime = "";
		}

		arrivalTime = String.valueOf(System.currentTimeMillis());
		departureTime = "";

		request.getSession().setAttribute("origin", origin);
		request.getSession().setAttribute("destination", destination);
		request.getSession().setAttribute("departureTime", departureTime);
		request.getSession().setAttribute("arrivalTime", arrivalTime);

		return "planTripResults.jsp";
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
}
