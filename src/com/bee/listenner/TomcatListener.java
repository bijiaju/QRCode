package com.bee.listenner;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
/**
 * Context监听器
 * @author bee
 *
 */
public class TomcatListener implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("MyServletContextListener.contextDestroyed()");
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("1..........MyServletContextListener.contextInitialized()");
		
	}

}
