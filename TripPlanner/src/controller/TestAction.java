/**
 *  This action is used for test some functions.
 *  @author Zhihao Ji
 *  @date 05/09/2016
 */
package controller;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import util.Common;

public class TestAction extends Action {

    @Override
    public String getName() {
        return "test.do";
    }

    @Override
    public String perform(HttpServletRequest request) {

        String vid = request.getParameter("vid");
        JSONObject vehicleInfo = (JSONObject) Common.getVehicle(vid).get(0);
        double lon = (double) vehicleInfo.get("lon");
        double lat = (double) vehicleInfo.get("lat");
        JSONObject location = new JSONObject();
        location.put("lat", lat);
        location.put("lon", lon);

        request.setAttribute("realLocation", location);
        return "vehicle.ajax";
    }

}
