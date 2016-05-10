/**
 *  This action is used for test some functions.
 *  @author Zhihao Ji
 *  @date 05/09/2016
 */
package controller;

import javax.servlet.http.HttpServletRequest;

import model.DAO;
import model.Model;

public class TestAction extends Action {

    private DAO stopDAO;

    public TestAction(Model model) {
        stopDAO = model.getDAO();
    }

    @Override
    public String getName() {
        return "test.do";
    }

    @Override
    public String perform(HttpServletRequest request) {

        return null;
    }

}
