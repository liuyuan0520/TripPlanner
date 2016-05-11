/**
 * Some common functions
 * @author Ryan
 * @Date   05/06/2016
 */
package util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.google.gson.JsonArray;
import com.google.gson.JsonParser;

import sun.net.www.protocol.http.HttpURLConnection;

public class Common {
    public final static String KEY = "nwsgFcSEiT6EGChKUFiXrnEQN";
    //
    // w9m3MfMkLEEwU7hqyGM6mU9ut

    /**
     * Get all routes
     * @return JSONArray
     */
    public static JsonArray getRoutes() {
        // API:
        // http://truetime.portauthority.org/bustime/api/v2/getroutes?key=Bethdfzqb5sLpVWvwcCgaYutX&format=json
        /*
         * "rt": "1", "rtnm": "FREEPORT ROAD", "rtclr": "#3300cc", "rtdd": "1"
         */

        HttpURLConnection connection = null;
        URL url;
        try {
            url = new URL(
                    "http://truetime.portauthority.org/bustime/" + "api/v2/getroutes?key=" + KEY + "&format=json");

            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            JsonArray routes = new JsonParser().parse(getStringFromWeb(connection)).getAsJsonObject()
                    .getAsJsonObject("bustime-response").getAsJsonArray("routes");
            return routes;
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Get all stops for one route and direction
     * @param route
     *            Like 58
     * @param direction
     *            Like "INBOUND" or "OUTBOUND"
     * @return
     */
    public static JsonArray getStops(String route, String direction) {
        // API:http://truetime.portauthority.org/bustime/api/v2/getstops?key=Bethdfzqb5sLpVWvwcCgaYutX&format=json&rt=58&dir=INBOUND
        /*
         * "stpid": "12232", "stpnm": "Alger St at Winterburn Ave", "lat":
         * 40.42704709803, "lon": -79.939723994712
         */
        HttpURLConnection connection = null;
        URL url;
        try {
            url = new URL("http://truetime.portauthority.org/bustime/" + "api/v2/getstops?key=" + KEY + "&rt=" + route
                    + "&dir=" + direction + "&format=json");

            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            JsonArray stops = new JsonParser().parse(getStringFromWeb(connection)).getAsJsonObject()
                    .getAsJsonObject("bustime-response").getAsJsonArray("stops");
            return stops;
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Get all prediction buses by stop id
     * @param stopId
     * @return
     */
    public static JSONArray getPrediction(String stopId) {
        // API:http://truetime.portauthority.org/bustime/api/v2/getpredictions?key=Bethdfzqb5sLpVWvwcCgaYutX&format=json&stpid=34
        /*
         * "tmstmp": "20160505 23:28", "typ": "A", "stpnm":
         * "Fifth Ave at Bigelow Blvd", "stpid": "34", "vid": "6042", "dstp":
         * 4458, "rt": "61A", "rtdd": "61A", "rtdir": "INBOUND", "des":
         * "Downtown", "prdtm": "20160505 23:32", "tablockid": "061A-184",
         * "tatripid": "6525", "dly": false, "prdctdn": "3", "zone": ""
         */
        HttpURLConnection connection = null;
        URL url;
        try {
            url = new URL("http://truetime.portauthority.org/bustime/" + "api/v2/getpredictions?key=" + KEY + "&stpid="
                    + stopId + "&format=json");

            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            JSONObject obj = (JSONObject) JSONValue.parse(Common.getResponse(connection));
            JSONObject results = (JSONObject) obj.get("bustime-response");
            JSONArray predictions = (JSONArray) results.get("prd");
            return predictions;
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Get one route prediction to some one stop
     * @param stopId
     * @param route
     * @return
     */
    public static JSONArray getPredictions(String stopId, String route) {
        // API:http://truetime.portauthority.org/bustime/api/v2/getpredictions?key=Bethdfzqb5sLpVWvwcCgaYutX&format=json&stpid=34&rt=71B
        /*
         * the array just contain one element "tmstmp": "20160505 23:31", "typ":
         * "A", "stpnm": "Fifth Ave at Bigelow Blvd", "stpid": "34", "vid":
         * "6056", "dstp": 21448, "rt": "71B", "rtdd": "71B", "rtdir":
         * "INBOUND", "des": "Downtown", "prdtm": "20160505 23:49", "tablockid":
         * "071B-135", "tatripid": "10839", "dly": false, "prdctdn": "17",
         * "zone": ""
         */
        HttpURLConnection connection = null;
        URL url;
        try {
            url = new URL("http://truetime.portauthority.org/bustime/" + "api/v2/getpredictions?key=" + KEY + "&stpid="
                    + stopId + "&rt=" + route + "&format=json");

            System.out.println(url);
            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            JSONObject obj = (JSONObject) JSONValue.parse(Common.getResponse(connection));
            JSONObject results = (JSONObject) obj.get("bustime-response");
            JSONArray predictions = (JSONArray) results.get("prd");
            return predictions;
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Get the vehicle information by vid
     * @param vid
     * @return
     */
    public static JSONArray getVehicle(String vid) {
        // API:http://truetime.portauthority.org/bustime/api/v2/getvehicles?key=Bethdfzqb5sLpVWvwcCgaYutX&format=json&vid=6056
        /*
         * The array just contains one element "vid": "6056", "tmstmp":
         * "20160505 23:36", "lat": "40.477416543399585", "lon":
         * "-79.91999513962689", "hdg": "205", "pid": 4686, "rt": "71B", "des":
         * "Downtown", "pdist": 2229, "dly": false, "spd": 15, "tatripid":
         * "10839", "tablockid": "071B-135", "zone": ""
         */
        HttpURLConnection connection = null;
        URL url;
        try {
            url = new URL("http://truetime.portauthority.org/bustime/" + "api/v2/getvehicles?key=" + KEY + "&vid=" + vid
                    + "&format=json");
            System.out.println(url);
            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            JSONObject obj = (JSONObject) JSONValue.parse(Common.getResponse(connection));
            JSONObject results = (JSONObject) obj.get("bustime-response");
            JSONArray vehicles = (JSONArray) results.get("vehicle");
            return vehicles;
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static JsonArray getGooglePlans(String origin, String destination, String departure, String arrival) {
        HttpURLConnection connection = null;
        StringBuilder sb = new StringBuilder(
                "https://maps.googleapis.com/maps/api/directions/json?mode=transit&alternatives=true&origin=" + origin
                        + "&destination=" + destination + "key=AIzaSyBPLZvtXmpwTONHCfU6gEz_GQ-ocwHvumk");
        if (arrival != null) {
            sb.append("&arrival_time=" + arrival);
        }
        if (departure != null) {
            sb.append("&departure_time=" + departure);
        }

        URL url;
        try {
            url = new URL(sb.toString());
            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            JsonArray plans = new JsonParser().parse(getStringFromWeb(connection)).getAsJsonObject()
                    .getAsJsonArray("routes");
            return plans;
        } catch (MalformedURLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    /**
     * get response from the API through the connection
     * @param connection
     * @return String response of the the API
     */
    public static String getResponse(HttpURLConnection connection) {
        try {
            StringBuilder str = new StringBuilder();
            BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String line = "";
            while ((line = br.readLine()) != null) {
                str.append(line + System.getProperty("line.separator"));
            }
            return str.toString();
        } catch (IOException e) {
            return new String();
        }
    }

    public static String getStringFromWeb(HttpURLConnection connection) {
        StringBuilder sb = new StringBuilder();
        String line;
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
            return sb.toString();
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static JsonArray getDirections(String routeId) {
        HttpURLConnection connection = null;
        URL url = null;
        try {
            url = new URL("http://truetime.portauthority.org/bustime/" + "api/v2/getdirections?key=" + KEY + "&rt="
                    + routeId + "&format=json");

            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            JsonArray directions = new JsonParser().parse(getStringFromWeb(connection)).getAsJsonObject()
                    .getAsJsonObject("bustime-response").getAsJsonArray("directions");
            return directions;
        } catch (MalformedURLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static long getTimeGap(String curTime, String predTime) {
        long gapTime = -1;
        try {
            // 20160506 21:08
            SimpleDateFormat sdFormat = new SimpleDateFormat("yyyyMMdd hh:mm");

            long curMilli = sdFormat.parse(curTime).getTime();
            long predMilli = sdFormat.parse(predTime).getTime();
            gapTime = (predMilli - curMilli) / (1000 * 60);

        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return gapTime;
    }
}
