package databean;

public class Prediction {
    private double latitude;
    private double longitude;
    private String stopId;
    private String stopName;
    private String routeId;
    private String direction;
    private String vid;
    private String gapTime;
    private String predTime;

    public Prediction(double lat, double lon, String stopId, String stopName, String routeId, String dir,
            String vid, String gt, String pt) {
        this.latitude = lat;
        this.longitude = lon;
        this.stopId = stopId;
        this.stopName = stopName;
        this.routeId = routeId;
        this.direction = dir;
        this.vid = vid;
        this.gapTime = gt;
        this.predTime = pt;
    }

    public double getLatitude() {
        return latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public String getStopId() {
        return stopId;
    }

    public String getStopName() {
        return stopName;
    }

    public String getRouteId() {
        return routeId;
    }

    public String getDirection() {
        return direction;
    }

    public String getVid() {
        return vid;
    }

    public String getGapTime() {
        return gapTime;
    }

    public String getPredTime() {
        return predTime;
    }

}
