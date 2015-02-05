package com.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;

import com.rjil.jio.nasan.wscall.WSCall;

import java.sql.*;

/**
 * Servlet implementation class FpassServ
 */
public class FpassServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FpassServ() {
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
		// TODO Auto-generated method stub
		JSONObject json = new JSONObject();
		
		JSONObject data = new JSONObject();
		PrintWriter out = response.getWriter();
		String success="";	
		String clinicid=request.getParameter("clinicid");
		//System.out.println(clinicid);
		WSCall call=new WSCall();
		try {
			data=call.getPassword(clinicid);
			if(data.get("status").equals("1")){
				json.put("success", "1");
			}
			else{
					json.put("success", "0");
				
				
			}
		
			out.print(json);
			out.flush();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println("i m happy");
		
		}}
