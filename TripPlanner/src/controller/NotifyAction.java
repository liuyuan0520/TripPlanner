package controller;

import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

public class NotifyAction extends Action {

	@Override
	public String getName() {
		return "notify.do";
	}

	@Override
	public String perform(HttpServletRequest request) {
		String phone = request.getParameter("phone");
		String time = request.getParameter("time");

		JSONObject result = new JSONObject();
		HttpURLConnection connection = null;
		URL url;
		try {
			url = new URL(
					"http://api.clickatell.com/http/sendmsg?user=yuanliu&password=EBLWTWWYWTSaLK&api_id=3602143&to=1"
							+ phone + "&text=Your bus is arriving in " + time + " minutes");

			connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");

			connection.getInputStream();

		} catch (Exception e) {
			result.put("status", "error");
		}

		result.put("status", "success");

		request.setAttribute("resObj", result);

		return "notify.ajax";
	}

}
