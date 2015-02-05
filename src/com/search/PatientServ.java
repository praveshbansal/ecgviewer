package com.search;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.jms.Session;
import javax.resource.cci.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;


/**
 * Servlet implementation class PatientServ
 */
public class PatientServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientServ() {
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
		String Patientid=request.getParameter("patientSearch");
		
		System.out.println(Patientid);
		session.setAttribute("patientfind", Patientid);
		
		RequestDispatcher dispatch = request.getRequestDispatcher("/Search.jsp");
		dispatch.forward(request, response);
		/*
		HttpSession session=request.getSession();	
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jioecg","root","root");
		Statement stmt=con.createStatement();
		String cid1 = (String) session.getAttribute("Clinic_id1");
		String psearch = (String) session.getAttribute("sessionsearch");
		String sql="SELECT * from jioecg_upload where clinic_id = '"+cid1+"' and patient_id = '"+psearch+"'"  ;
		ResultSet res = stmt.executeQuery(sql);*/
	}
}
