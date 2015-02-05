package com.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

import com.rjil.jio.nasan.wscall.WSCall;

/**
 * Servlet implementation class LoginServ
 */
public class SigninServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SigninServ() {
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
		HttpSession session=request.getSession();
		JSONObject data=new JSONObject();
		String username=request.getParameter("uid");
		System.out.println(username);
		/*int password=Integer.parseInt(request.getParameter("password"));
		*/
		String password=request.getParameter("password");
		System.out.println("password"+password);
		PrintWriter out = response.getWriter();
		WSCall call=new WSCall();
		try {
			data = call.verify(username, password);
			System.out.println("passed");
			if(data.get("status").equals("success")){
		//		System.out.println(data.get("status"));
				/*RequestDispatcher dispatch = request.getRequestDispatcher("ecgviewer.jsp");
				dispatch.forward(request, response);
				*/
				String name=(String) data.get("organisation_name");
			//	System.out.println(name);
			/*String pass=(String) data.get("password");
			System.out.println(pass);
			*/
			String utype=(String) data.get("user_type");
			//System.out.println(utype);
			String cid=(String) data.get("clinic_id");
			//System.out.println(cid);
			session.setAttribute("EName",name);
			session.setAttribute("Clinic_id1",cid);
			//session.setAttribute("Password", pass);
			session.setAttribute("Role", utype);
			//System.out.println("hi");
			RequestDispatcher dispatch = request.getRequestDispatcher("/ecgviewer.jsp");
			dispatch.forward(request, response);
			}
			else{
				//System.out.println("Incorrect Employee ID or Password");
				
				out.println("<html><head></head><body>Incorrect Employee ID or Password</body></html>");
				response.setHeader("Refresh","5; url=signin.jsp");
				
			}
			
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
		
		//System.out.println(data.toString());
		
				/*
				 * name=rs.getString("organisation_name");
			String pass=rs.getString("password");
			String utype=rs.getString("user_type");
			String cid=rs.getString("clinic_id");
			session.setAttribute("EName",name);
			session.setAttribute("Clinic_id1",cid);
			session.setAttribute("Password", pass);
			session.setAttribute("Role", utype);
			
				 * 
				 * RequestDispatcher dispatch = request.getRequestDispatcher("/Processsignin.jsp");
				dispatch.forward(request, response);
				System.out.println("Incorrect Employee ID or Password");
				out.println("<html><head></head><body>Incorrect Employee ID or Password</body></html>");
				response.setHeader("Refresh","5; url=signin.jsp");*/
	}
	}