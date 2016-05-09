package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;

/**
 * 
 * @author Yuan Liu
 * @date 05/09/2016
 */

public class PlanTripAction {

	public String getName() {
		return "plan.do";
	}

	public String perform(HttpServletRequest request) {
		String origin = request.getParameter("origin");
		String destination = request.getParameter("destination");
		String departureTime = request.getParameter("departureTime");
		String arrivalTime = request.getParameter("arrivalTime");

		if (origin == null || origin.length() == 0) {
			origin = "wean hall";
		}

		if (departureTime == null) {
			departureTime = String.valueOf(System.currentTimeMillis() / 1000);
		}

		if (arrivalTime != null) {
			arrivalTime = departureTime = null;
		}

		return "results.jsp";
	}

	public static String convertTime(String time) {
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
