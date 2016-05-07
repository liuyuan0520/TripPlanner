package databean;

public class Prediction {
    private double latitude;
    private double longitude;
    // private String stopId;
    // private String stopName;
    private String routeId;
    private String direction;
    private String vid;
    private String gapTime;
    private String predTime;

    public Prediction(double lat, double lon, String routeId, String dir,
            String vid, String gt, String pt) {
        this.latitude = lat;
        this.longitude = lon;
        // this.stopId = stopId;
        // this.stopName = stopName;
        this.routeId = routeId;
        this.direction = dir;
        this.vid = vid;
        this.gapTime = gt;
        this.predTime = pt;
    }

}
