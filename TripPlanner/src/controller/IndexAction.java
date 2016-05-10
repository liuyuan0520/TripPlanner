package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.genericdao.RollbackException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import databean.Prediction;
import databean.Route;
import model.DAO;
import model.Model;
import util.Common;

public class IndexAction extends Action {

    private DAO routeDAO;

    public IndexAction(Model model) {
        routeDAO = model.getDAO();
    }

    @Override
    public String getName() {
        return "index.do";
    }

    @Override
    public String perform(HttpServletRequest request) {

        // get all bus list
        Route[] routes = null;
        try {
            routes = routeDAO.getAllRoutes();
        } catch (RollbackException e) {
            e.printStackTrace();
        }
        Set<String> routeSet = new HashSet<>();
        Map<String, String> routeName = new HashMap<>();
        for (Route r : routes) {
            if (routeSet.contains(r.getRouteId())) {
                continue;
            }
            routeSet.add(r.getRouteId());
            routeName.put(r.getRouteId(), r.getRouteName());
        }
        int size = routeSet.size();
        String[] routeArr = new String[size];
        String[] nameArr = new String[size];
        Iterator<String> it = routeSet.iterator();
        int count = 0;
        while (it.hasNext()) {
            String tmpRoute = it.next();
            routeArr[count] = tmpRoute;
            nameArr[count++] = routeName.get(tmpRoute);
        }

        for (int i = 0; i < routeArr.length; i++) {
            System.out.println(routeArr[i] + " " + nameArr[i]);
        }
        request.setAttribute("routeId", routeArr);
        request.setAttribute("routeName", nameArr);

        // get nearby bus and bus stop
        // NSH : 40.443518, -79.945757
        // Step1 get nearby stops
        // Step2 predict buses from stops
        // Step3 find nearby ones
        // However, here we fix the stop & bus {7116: 61BCD, 4408: 28X, 58, 61A}
        String[] stopIds = { "7116", "4408" };
        String[] routeIds = { "61B", "61C", "61D", "28X", "58", "61A" };
        List<Prediction> predList = new ArrayList<>();
        for (int i = 0; i < 6; i++) {
            int mod = i % 3;
            String stopId = stopIds[mod];
            String routeId = routeIds[i];
            JSONArray jArray = Common.getPredictions(stopId, routeId);
            JSONObject jPredict = (JSONObject) jArray.get(0);
            long gapTime = -1;
            String curTime = null;
            String predTime = null;
            try {
                curTime = ((String) jPredict.get("tmstmp")).trim();
                predTime = ((String) jPredict.get("prdtm")).trim();
                // 20160506 21:08
                SimpleDateFormat sdFormat = new SimpleDateFormat("yyyyMMdd hh:mm");

                long curMilli = sdFormat.parse(curTime).getTime();
                long predMilli = sdFormat.parse(predTime).getTime();
                gapTime = (predMilli - curMilli) / (1000 * 60);

            } catch (ParseException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            if (gapTime != -1) {
                request.setAttribute("waitTime", gapTime);
            } else {
                request.setAttribute("waitTime", "Sorry, this service currently is not available.");
            }

            String dir = (String) jPredict.get("rtdir");

            // get the vehicle location
            JSONObject vehicle = (JSONObject) Common.getVehicle((String) jPredict.get("vid")).get(0);
            double lon = Double.parseDouble(((String) vehicle.get("lon"))
                    .trim());
            double lat = Double.parseDouble(((String) vehicle.get("lat"))
                    .trim());

            Prediction prediction = new Prediction(lat, lon, routeId, dir,
                    (String) jPredict.get("vid"),
                    String.valueOf(gapTime), predTime);
            predList.add(prediction);
        }

        return "searchNextBus.jsp";

    }

}
