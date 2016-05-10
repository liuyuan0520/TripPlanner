package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
		System.out.println(departureTime);
		System.out.println(arrivalTime);

		if (origin == null || origin.length() == 0) {
			origin = "wean hall";
		}
		if (destination == null || destination.length() == 0) {
			return "planTrips.jsp";
		}

		departureTime = convertTime(departureTime);
		if (arrivalTime != "") {
			arrivalTime = convertTime(arrivalTime);
		}

		request.getSession().setAttribute("origin", origin);
		request.getSession().setAttribute("destination", destination);
		request.getSession().setAttribute("departureTime", departureTime);
		request.getSession().setAttribute("arrivalTime", arrivalTime);

		return "planTripResults.jsp";
	}

	private String convertTime(String time) {
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy h:mm a");
		// sdf.setTimeZone(TimeZone.getTimeZone("EST"));

		Date date = new Date();
		try {
			date = sdf.parse(time);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("parsed date " + date);
		return String.valueOf(date.getTime());
	}
}
