package model;

import org.genericdao.ConnectionPool;
import org.genericdao.DAOException;
import org.genericdao.GenericDAO;

import databean.Route;

public class DAO extends GenericDAO<Route> {
    public DAO(String tableName, ConnectionPool pool) throws DAOException {
        super(Route.class, tableName, pool);
    }

    public Route getStopInfo(String stopId) {
        return null;
    }
    
}
