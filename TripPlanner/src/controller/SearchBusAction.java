package controller;

import javax.servlet.http.HttpServletRequest;

public class SearchBusAction extends Action {

    @Override
    public String getName() {
        return "searchBus.do";
    }

    @Override
    public String perform(HttpServletRequest request) {

        return "searchBus.jsp";
    }

}
