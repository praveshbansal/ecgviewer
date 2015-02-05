package com.table;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

import java.io.PrintWriter;

import com.rjil.jio.nasan.wscall.WSCall;


public class table2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public table2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String clinicidfordevice = request.getParameter("transfertoDeviceservlet");
		System.out.println("servlet called dev");
		System.out.println("table2 dev bindings>>>>>   " + clinicidfordevice);
		HttpSession session=request.getSession();
		session.setAttribute("devclinic_id", clinicidfordevice);
		
		JSONArray array=new JSONArray();
        JSONObject data=new JSONObject();
       
        WSCall call=new WSCall();
        try {
        	System.out.println("present");
			array=call.getDeviceData(clinicidfordevice);
			System.out.println("array");
			for(int i=0;i<array.length();i++)
           	{
    			data=(JSONObject)array.get(i);
    			//System.out.println("data"+data);
    			
           	}
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		JSONObject jj = new JSONObject();
		PrintWriter out = response.getWriter();
		try {
			jj.put("count", array.length());
			jj.put("devicedata",array);
			//jj.put("x1", "1");
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		out.print(jj);
		out.flush();
		
		
		
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//System.out.println("Servelet is called 2 ...... ");
		
		// TODO Auto-generated method stub
	}

}
