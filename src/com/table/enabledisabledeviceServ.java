package com.table;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

import com.rjil.jio.nasan.wscall.WSCall;

/**
 * Servlet implementation class enabledisabledeviceServ
 */
public class enabledisabledeviceServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public enabledisabledeviceServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String device_id = request.getParameter("imeinumber");
		String clinic_id = request.getParameter("transfertoenabledisableserv");
		String device_status = request.getParameter("device_status");
		System.out.println("changestatus");
		System.out.println(device_id + " " + device_status + " " + clinic_id);

		WSCall call = new WSCall();
		JSONObject success = new JSONObject();
		PrintWriter out = response.getWriter();
		try {
			success = call.changeDeviceStatus(clinic_id, device_id,
					device_status);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print(success);
		System.out.println(success);
		out.flush();
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
