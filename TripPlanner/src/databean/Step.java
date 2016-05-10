package databean;

public class Step {
	private String departureTime;
	private String departureStop;
	private String duration;
	private String busLine;
	private int numOfStops;
	private String arrivalStop;

	public String getArrivalStop() {
		return arrivalStop;
	}

	public void setArrivalStop(String arrivalStop) {
		this.arrivalStop = arrivalStop;
	}

	public String getDepartureStop() {
		return departureStop;
	}

	public void setDepartureStop(String departureStop) {
		this.departureStop = departureStop;
	}

	public String getDepartureTime() {
		return departureTime;
	}

	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getBusLine() {
		return busLine;
	}

	public void setBusLine(String busLine) {
		this.busLine = busLine;
	}

	public int getNumOfStops() {
		return numOfStops;
	}

	public void setNumOfStops(int numOfStops) {
		this.numOfStops = numOfStops;
	}
}
