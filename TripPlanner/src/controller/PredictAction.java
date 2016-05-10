/**
 * Show the prediction time of one route or several routes for one stop
 * @author Zhihao Ji
 * @date 05/06/2016
 */
package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.genericdao.RollbackException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import databean.Prediction;
import databean.Route;
import model.DAO;
import model.Model;
import util.Common;

public class PredictAction extends Action {

    private DAO stopDAO;

    public PredictAction(Model model) {
        stopDAO = model.getDAO();
    }

    @Override
    public String getName() {
        return "predict.do";
    }

    @Override
    public String perform(HttpServletRequest request) {

        // Get Parameters from front end form
        String route = request.getParameter("bus").trim();
        String direction = request.getParameter("bound").trim();
        String stopName = request.getParameter("busStop").trim();

        String getAllRoute = null;// request.getParameter("allroutes").trim();

        // Get the stop location
        Route curStop = null;
        try {
            curStop = stopDAO.getStopInfo(stopName);
        } catch (RollbackException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        if (curStop == null) {
            System.out.println("something wrong");
            return "error.jsp";
        }
        String stopId = String.valueOf(curStop.getStopId());
        request.setAttribute("stopId", stopId);
        request.setAttribute("stopName", curStop.getStopName());
        request.setAttribute("stopLong", curStop.getStopLong());
        request.setAttribute("stopLat", curStop.getStopLat());

        List<Prediction> predList = new ArrayList<>();
        if ("true".equals(getAllRoute)) {
            // search for all routes for this stop

        } else {
            // search for just this route for this stop
            JSONArray predictions = null;
            while ((predictions = Common.getPredictions(stopId, route)) == null)
                ;

            JSONObject jPredict = (JSONObject) predictions.get(0);
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

            // get the vehicle location
            JSONObject vehicle = (JSONObject) Common.getVehicle((String) jPredict.get("vid")).get(0);
            double lon = Double.parseDouble(((String) vehicle.get("lon"))
                    .trim());
            double lat = Double.parseDouble(((String) vehicle.get("lat"))
                    .trim());

            Prediction prediction = new Prediction(lat, lon, stopId, curStop.getStopName(), route, direction,
                    (String) jPredict.get("vid"),
                    String.valueOf(gapTime), predTime);
            predList.add(prediction);
        }
        request.setAttribute("busList", predList);
        return "/pages/busDetails.jsp";
    }

}
