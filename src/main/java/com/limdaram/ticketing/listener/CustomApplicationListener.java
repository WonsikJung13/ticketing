package com.limdaram.ticketing.listener;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebListener
public class CustomApplicationListener implements ServletContextListener, HttpSessionListener, HttpSessionAttributeListener {

    public CustomApplicationListener() {
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // application 영역에 attribute 를 추가제공
        // https://study-2022-08-02-wsj.s3.ap-northeast-2.amazonaws.com/prj1/board
        ServletContext application = sce.getServletContext();
        application.setAttribute("imgUrl", "https://study-2022-08-02-wsj.s3.ap-northeast-2.amazonaws.com/prj1/board");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        /* This method is called when the servlet Context is undeployed or Application Server shuts down. */
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        /* Session is created. */
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        /* Session is destroyed. */
    }

    @Override
    public void attributeAdded(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute is added to a session. */
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute is removed from a session. */
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute is replaced in a session. */
    }
}
