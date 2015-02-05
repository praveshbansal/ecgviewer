package com.registration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jettison.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.rjil.jio.nasan.wscall.WSCall;

/**
 * Servlet implementation class DeviceServ
 */
public class DeviceServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeviceServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		System.out.println("this is servlet is called");
		
		System.out.println("receviced");
		
		String devicename=request.getParameter("dname");
		String imeinumber=request.getParameter("imei");
		String status=request.getParameter("state");
		String clinic_id=request.getParameter("clinicid");
		String organisation_name=request.getParameter("clinicname");
		System.out.println(devicename);
		System.out.println(clinic_id);
		System.out.println(organisation_name);
		

		//System.out.println(c_id);
		org.codehaus.jettison.json.JSONObject json=new org.codehaus.jettison.json.JSONObject();
		PrintWriter out = response.getWriter();
		String success="";
        org.codehaus.jettison.json.JSONObject data=new org.codehaus.jettison.json.JSONObject();
        
        
        WSCall call=new WSCall();
        try {
			data=call.devreg(imeinumber, devicename, status, clinic_id, organisation_name);
			System.out.println("data"+data);
			if(data.getString("sucess").equalsIgnoreCase("Registation Sucessful"))
			{
				System.out.println("hello");
				json.put("success", "1");
				success="1";
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        out.print(json);
		out.flush();
		
        		
	}

}
