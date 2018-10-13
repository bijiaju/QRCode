package com.bee.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import com.bee.service.QRService;
import com.bee.service.impl.QRServiceImpl;

/**
 * Servlet implementation class QRCodeServlet
 */
@WebServlet("/QRCodeServlet")
public class QRCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private QRServiceImpl qrcodeService = new QRServiceImpl();//服务
    /**
     * Default constructor. 
     */
    public QRCodeServlet() {
        // TODO Auto-generated constructor stub
    }

    
    /**
	 * 4.destroy方法
	 */
	@Override
	public void destroy() {
		System.out.println("4.servlet对象销毁了");
	}

	/**
	 * 2.init方法
	 */
	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("2.init方法被调用");
	}


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		if ("decodeQR".equals(method)) {
			decodeQR(request, response);
		}else if("createQR".equals(method)){
			createQR(request, response);
		}else if("batchProcessQR".equals(method)){
			batchProcessQR(request, response);
		}else if("transpng".equals(method)){
			transPng(request, response);
		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	/**
	 * 批量处理QR,遍历文件下文件执行操作
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void batchProcessQR(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String srcAddress = request.getParameter("srcAddress");//哈哈
		String desAddress = request.getParameter("desAddress");//哈哈
		String error = request.getParameter("error");//哈哈
		String width = request.getParameter("width");//哈哈
		String hight = request.getParameter("hight");//哈哈
		String whiteEdge = request.getParameter("whiteEdge");//哈哈
		
		 String  QRInfo = qrcodeService.transQR(srcAddress,desAddress,Integer.valueOf(width),Integer.valueOf(hight),error,Integer.valueOf(whiteEdge));
				
		 response.setContentType("text/html;charset=UTF-8");
		 PrintWriter pw = response.getWriter();
		 pw.write(QRInfo);
		 pw.flush();
		 pw.close();
		
	}
	/**
	 * 格式化png图片
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void transPng(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String srcAddress= request.getParameter("srcAddress");//哈哈
		String desAddress = request.getParameter("desAddress");//哈哈
		
		String pngInfo = qrcodeService.transPNG(srcAddress,desAddress);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.write(pngInfo);
		pw.flush();
		pw.close();
	}

	/**
	 * 
	 * 
	 * @param request
	 * @param response
	 */
	private void createQR(HttpServletRequest request, HttpServletResponse response) {
		
	}

	/**
	 * 请求地址http://localhost:8080/QRCode/QRCodeServlet?method=decodeQR
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void decodeQR(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		qrcodeService.decodeQrCode("C:\\Users\\bee\\Desktop\\test1\\2.png");
		response.getWriter().append("Served at:hahaha ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
