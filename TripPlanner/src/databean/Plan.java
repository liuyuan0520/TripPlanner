package databean;

import java.util.ArrayList;
import java.util.List;

public class Plan {
	private ArrayList<Step> steps;
	private String duration;
	private String departureTime;
	private String arrivalTime;
	private List<String> routes;
	private boolean noBus = false;

	public boolean isNoBus() {
		return noBus;
	}

	public void setNoBus(boolean noBus) {
		this.noBus = noBus;
	}

	public List<String> getRoutes() {
		return routes;
	}

	public void setRoutes(List<String> routes) {
		this.routes = routes;
	}

	public ArrayList<Step> getSteps() {
		return steps;
	}

	public void setSteps(ArrayList<Step> steps) {
		this.steps = steps;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getDepartureTime() {
		return departureTime;
	}

	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}

	public String getArrivalTime() {
		return arrivalTime;
	}

	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}
}
