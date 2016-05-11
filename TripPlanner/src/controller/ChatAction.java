package controller;

import javax.servlet.http.HttpServletRequest;

public class ChatAction extends Action {

    @Override
    public String getName() {
        return "chat.do";
    }

    @Override
    public String perform(HttpServletRequest request) {

        return "chat.jsp";
    }

}
