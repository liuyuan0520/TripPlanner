package model;

import org.genericdao.ConnectionPool;
import org.genericdao.DAOException;
import org.genericdao.GenericDAO;
import org.genericdao.MatchArg;
import org.genericdao.RollbackException;

import databean.Route;

public class DAO extends GenericDAO<Route> {
    public DAO(String tableName, ConnectionPool pool) throws DAOException {
        super(Route.class, tableName, pool);
    }

    public Route getStopInfo(String stopId) {
        return null;
    }


    public Route[] getAllStopsByRouteIdandDir(String routeId, String direction) throws RollbackException {
        Route[] resRoutes = match(
                MatchArg.and(MatchArg.equals("direction", direction), MatchArg.equals("routeId", routeId)));
        return resRoutes;
    }

    public Route[] getAllRoutes() throws RollbackException {
        Route[] routes = match();

        return routes;
    }
}
