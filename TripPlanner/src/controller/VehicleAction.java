/**
 * Get Vehicle location by AJAX
 * @author Zhihao Ji
 * @date 05/07/2016
 */
package controller;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import util.Common;

public class VehicleAction extends Action {

    @Override
    public String getName() {
        return "vehicle.do";
    }

    @Override
    public String perform(HttpServletRequest request) {

        String vid = request.getParameter("vid");
        JSONObject vehicleInfo = (JSONObject) Common.getVehicle(vid).get(0);
        double lon = Double.parseDouble(((String) vehicleInfo.get("lon"))
                .trim());
        double lat = Double.parseDouble(((String) vehicleInfo.get("lat"))
                .trim());

        JSONObject location = new JSONObject();
        location.put("lat", lat);
        location.put("lon", lon);

        request.setAttribute("realLocation", location);
        return "vehicle.ajax";
    }

}
