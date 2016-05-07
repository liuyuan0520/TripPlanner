package databean;

import org.genericdao.PrimaryKey;

@PrimaryKey("id")
public class Route {
	private String routeId;
	private String routeName;
	private int stopId;
	private String stopName;
	private double stopLat;
	private double stopLong;
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRouteId() {
		return routeId;
	}

	public void setRouteId(String routeId) {
		this.routeId = routeId;
	}

	public String getRouteName() {
		return routeName;
	}

	public void setRouteName(String routeName) {
		this.routeName = routeName;
	}

	public int getStopId() {
		return stopId;
	}

	public void setStopId(int stopId) {
		this.stopId = stopId;
	}

	public String getStopName() {
		return stopName;
	}

	public void setStopName(String stopName) {
		this.stopName = stopName;
	}

	public double getStopLat() {
		return stopLat;
	}

	public void setStopLat(double stopLat) {
		this.stopLat = stopLat;
	}

	public double getStopLong() {
		return stopLong;
	}

	public void setStopLong(double stopLong) {
		this.stopLong = stopLong;
	}
}
