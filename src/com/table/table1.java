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

import com.rjil.jio.nasan.wscall.WSCall;


public class table1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public table1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String searchid = request.getParameter("id");
		System.out.println("servlet called");
		System.out.println("bindings>>>>>   " + searchid);
		
		JSONArray array=new JSONArray();
        JSONObject data=new JSONObject();
        /*JSONObject data=new JSONObject();*/
        //List<Map<String, String>> datalist=new ArrayList<Map<String,String>>();
        
        WSCall call=new WSCall();
        try {
			array=call.getClinicData(searchid,"0");
			
			for(int i=0;i<array.length();i++)
           	{
    			data=(JSONObject)array.get(i);
    			System.out.println("data"+data);
           	}
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        
        
		//HttpSession session = request.getSession();
		//request.setAttribute("x1", array);
		
		// By Nikesh
		JSONObject jj = new JSONObject();
		PrintWriter out = response.getWriter();
		
		try {
			jj.put("x1",array);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		out.print(jj);
		out.flush();
		// Nikesh Code ends here
		//RequestDispatcher dispatch = request.getRequestDispatcher("/registeredclinics.jsp");
		//dispatch.include(request,response);

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//System.out.println("Servelet is called 2 ...... ");
		
		// TODO Auto-generated method stub
	}

}
