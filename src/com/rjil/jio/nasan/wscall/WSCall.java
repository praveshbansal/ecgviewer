package com.rjil.jio.nasan.wscall;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.ws.rs.QueryParam;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.codehaus.jettison.json.JSONTokener;

public class WSCall {
	public static void main(String[] args) throws JSONException {
		WSCall l = new WSCall();
		//l.verify("ril1000", "111111");
		//l.getClinicData("rf1025", "0");
		//l.getRegClinic();
		//l.getPassword("ril10000");
		// l.getDeviceData("888");
		// l.devreg("880070023435164", "nokia", "1", "888", "kkkkk");
		// l.clinicreg("RF1232", "111111", "RF", "Raja", "Mumbai", "Mumbai",
		// "9664286130", "222545789", "sdfs@fortis.com", "jjfjjf@fortis.com",
		// "0");
		//l.changeDeviceStatus("57", "223122", "Disabled");
	}

	public JSONObject verify(String clinic_id, String passwoord)
			throws JSONException {
		JSONObject data = new JSONObject();

		try {
			String path = "http://localhost:8080:8080/jioecg_2612/rest/jioecg/weblogin?clinic_id="
					+ clinic_id + "&password=" + passwoord;
			HttpPost post = new HttpPost(path);
			DefaultHttpClient client = new DefaultHttpClient();
			HttpResponse httpresponse = client.execute(post);
			BufferedReader br = new BufferedReader(new InputStreamReader(
					httpresponse.getEntity().getContent()));

			String line = br.readLine();
			System.out.println(line);
			HttpEntity entity = httpresponse.getEntity();

			line = line.replace("{", "");
			line = line.replace("}", "");
			line = line.replaceAll("\"", "");

			String a[] = new String[2];
			for (String retval : line.split(",", 0)) {

				String a1 = retval;
				int i = 0;
				for (String a2 : a1.split(":", 0)) {
					a[i] = a2;
					i++;
				}
				data.put(a[0], a[1]);

			}

			System.out.println("json");
			System.out.println(data.toString());
			System.out.println("status value" + data.get("organisation_name"));

		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	public JSONObject devreg(String device_id, String device_name,
			String device_status, String clinic_id, String organisation_name)
			throws JSONException {

		JSONObject data = new JSONObject();
		try {
			String path = "http://localhost:8080:8080/jioecg_2612/rest/jioecg/deviceregistration?device_id="
					+ device_id
					+ "&device_name="
					+ device_name
					+ "&device_status="
					+ device_status
					+ "&clinic_id="
					+ clinic_id
					+ "&organisation_name="
					+ organisation_name
					+ "";
			HttpPost post = new HttpPost(path);
			DefaultHttpClient client = new DefaultHttpClient();
			HttpResponse httpresponse = client.execute(post);
			BufferedReader br = new BufferedReader(new InputStreamReader(
					httpresponse.getEntity().getContent()));
			String line = br.readLine();

			HttpEntity entity = httpresponse.getEntity();

			line = line.replace("{", "");
			line = line.replace("}", "");
			line = line.replaceAll("\"", "");

			String a[] = new String[2];
			for (String retval : line.split(",", 0)) {
				String a1 = retval;
				int i = 0;
				for (String a2 : a1.split(":", 0)) {
					a[i] = a2;
					i++;
				}
				data.put(a[0], a[1]);
			}

			System.out.println("json");
			System.out.println(data.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	public JSONArray getClinicData(String clinic_id, String user_type)
			throws JSONException {

		List<Map<String, String>> datalist = new ArrayList<Map<String, String>>();
		if (user_type == null) {
			user_type = "0";
		}

		List<JSONObject> datalist1 = new ArrayList<JSONObject>();

		JSONArray array = new JSONArray();
		try {
			String path = "http://localhost:8080:8080/jioecg_2612/rest/jioecg/clinicdata?clinic_id="
					+ clinic_id + "&user_type=" + user_type + "";
			HttpPost post = new HttpPost(path);
			// post.setHeader("Content-type", "application/json");
			// post.setEntity(new StringEntity(json.toString(), "UTF-8"));
			DefaultHttpClient client = new DefaultHttpClient();
			HttpResponse httpresponse = client.execute(post);
			BufferedReader br = new BufferedReader(new InputStreamReader(
					httpresponse.getEntity().getContent()));

			String line = br.readLine();
			System.out.println(line);
			HttpEntity entity = httpresponse.getEntity();
			// System.out.println(entity.getContent());
			Map<String, String> datamap = new HashMap<String, String>();
			// ArrayList<Object> datamap= new ArrayList<Object>();

			line = line.replace("{", "");
			// line = line.replace("=", ":");
			line = line.replaceAll("\"", "");
			line = line.replaceAll(" ", "");
			/*
			 * line=line.replaceAll("[", ""); line=line.replaceAll("]", "");
			 */
			line = line.replace("[", "").replace("]", "");
			JSONObject data = new JSONObject();
			String date = "", time = "", datetime = "";
			// System.out.println("line"+line);
			String a[] = new String[2];
			String a5[] = new String[2];
			int k = 0;
			for (String retval1 : line.split("}", 1)) {
				String line1 = retval1;

				int j = 0;
				// System.out.println("line1 is = "+line1);
				line1 = line1.replace("}", "");
				for (String retval : line1.split(",", 0)) {
					// System.out.println("retval is "+retval);
					String a1 = retval;
					int i = 0;
					/*
					 * a5=a1.split(":"); System.out.println(a5[1]);
					 */
					for (String a2 : a1.split("=", 0)) {
						a[i] = a2;
						i++;

					}
					j++;
					/*
					 * if(a[0].equalsIgnoreCase("ecgtest_date")) {
					 * System.out.println("date"); data.put(a[0], a[1]);
					 * datetime=(String) data.get("ecgtest_date");
					 * date=datetime.substring(0, 10);
					 * time=datetime.substring(10);
					 * System.out.println(datetime.length()); } else {
					 */
					data.put(a[0], a[1]);
					// }
					datamap.put(a[0], a[1]);

					if (j == 12) {
						// System.out.println(datamap);
						array.put(k, datamap);
						// System.out.println("k"+k);
						// System.out.println("datamap is = "+datamap.toString());
						datalist1.add(k, data);
						// dl.add(datalist);
						// System.out.println();
						// System.out.println("datalist");
						// System.out.println(datalist1.toString());

						j = 0;
						k++;

					}
				}
				// System.out.println("array");
				for (int t = 0; t < array.length(); t++) {
					// System.out.println(array.get(1));
					JSONObject dd = (JSONObject) array.get(t);

					// System.out.println(dd);
				}
				// System.out.println("enddddd");
				// System.out.println(datalist.size());
				// dl.addAll(dl);

			}
			// System.out.println("json");
			// System.out.println(data.toString());

			datetime = (String) data.get("ecgtest_date");
			date = datetime.substring(0, 10);
			time = datetime.substring(10);
			// System.out.println("date"+date+"  time"+time);

			// System.out.println();

			/*
			 * if (datalist!=null && !datalist.isEmpty()) { for
			 * (List<Map<String, String>> employee1 : dl) { //for(String em:dl){
			 * for (Map<String, String> employee : datalist) { for
			 * (Iterator<Entry<String, String>> it =
			 * employee.entrySet().iterator(); it.hasNext();) { Entry<String,
			 * String> entry = it.next(); String key = entry.getKey(); Object
			 * value = entry.getValue(); System.out.println(key + " = " +
			 * value); String abc=employee.get("patient_name");
			 * //System.out.println(ecgdata.toString());
			 * //System.out.println("abc"+abc); } System.out.println(); } //} }
			 */

			/*
			 * if (datalist!=null && !datalist.isEmpty()) { for
			 * (List<Map<String, String>> employee1 : dl) { //for(String em:dl){
			 * for (Map<String, String> employee : datalist) {
			 * Iterator<Entry<String, String>> itr
			 * =datamap.entrySet().iterator();
			 * 
			 * 
			 * while (itr.hasNext()) { Entry<String, String> entry = itr.next();
			 * String key = entry.getKey(); Object value = entry.getValue();
			 * System.out.println(key + " = " + value); //String
			 * abc=employee.get("patient_name");
			 * //System.out.println(ecgdata.toString());
			 * //System.out.println("abc"+abc); } System.out.println(); } } }
			 */

		} catch (Exception e) {
			e.printStackTrace();
		}
		return array;
	}

	public JSONObject clinicreg(String clinic_id, String password,
			String organisation_name, String organisation_head,
			String organisation_address, String city, String contact_no,
			String alternate_contact_no, String email_id,
			String alternate_email_id, String user_type) throws JSONException {
		JSONObject data = new JSONObject();
		try {
			System.out.println(user_type);
			// String path =
			// "http://localhost:8080:8080/jioecg_2612/rest/jioecg/clinicregistration?clinic_id="+clinic_id+"&organisation_name="+organisation_name+"&organisation_head="+organisation_head+"&organisation_address="+organisation_address+"&city="+city+"&contact_no="+contact_no+"&alternate_contact_no="+alternate_contact_no+"&email_id="+email_id+"&alternate_email_id="+alternate_email_id+"&user_type="+user_type+"";
			String path = "http://localhost:8080:8080/jioecg_2612/rest/jioecg/clinicregistration?clinic_id="
					+ URLEncoder.encode(clinic_id)
					+ "&password="
					+ URLEncoder.encode(password)
					+ "&organisation_name="
					+ URLEncoder.encode(organisation_name)
					+ "&organisation_head="
					+ URLEncoder.encode(organisation_head)
					+ "&organisation_address="
					+ URLEncoder.encode(organisation_address)
					+ "&city="
					+ URLEncoder.encode(city)
					+ "&contact_no="
					+ URLEncoder.encode(contact_no)
					+ "&alternate_contact_no="
					+ URLEncoder.encode(alternate_contact_no)
					+ "&email_id="
					+ URLEncoder.encode(email_id)
					+ "&alternate_email_id="
					+ URLEncoder.encode(alternate_email_id) + "&user_type=" + URLEncoder.encode(user_type) + "";
			System.out.println(path);
			HttpPost post = new HttpPost(path);
			// post.setHeader("Content-type", "application/json");
			// post.setEntity(new StringEntity(json.toString(), "UTF-8"));
			DefaultHttpClient client = new DefaultHttpClient();
			HttpResponse httpresponse = client.execute(post);
			BufferedReader br = new BufferedReader(new InputStreamReader(
					httpresponse.getEntity().getContent()));
			String line = br.readLine();

			HttpEntity entity = httpresponse.getEntity();
			System.out.println(line);

			line = line.replace("{", "");
			line = line.replace("}", "");
			line = line.replaceAll("\"", "");

			String a[] = new String[2];
			for (String retval : line.split(",", 0)) {
				// System.out.println(retval);
				String a1 = retval;
				int i = 0;
				for (String a2 : a1.split(":", 0)) {
					a[i] = a2;
					i++;
				}
				data.put(a[0], a[1]);
			}

			System.out.println("json");
			System.out.println(data.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	public JSONArray getDeviceData(String clinic_id) throws JSONException {
		JSONObject data = new JSONObject();
		JSONArray array = new JSONArray();

		try {
			String path = "http://localhost:8080:8080/jioecg_2612/rest/jioecg/devicedata?clinic_id="
					+ clinic_id + "";
			HttpPost post = new HttpPost(path);
			// post.setHeader("Content-type", "application/json");
			// post.setEntity(new StringEntity(json.toString(), "UTF-8"));
			DefaultHttpClient client = new DefaultHttpClient();
			HttpResponse httpresponse = client.execute(post);
			BufferedReader br = new BufferedReader(new InputStreamReader(
					httpresponse.getEntity().getContent()));

			String line = br.readLine();
			// System.out.println(line);
			HttpEntity entity = httpresponse.getEntity();
			// System.out.println(entity.getContent());
			Map<String, String> datamap = new TreeMap<String, String>();

			line = line.replace("{", "");
			// line = line.replace("=", ":");
			line = line.replaceAll("\"", "");
			line = line.replaceAll(" ", "");
			/*
			 * line=line.replaceAll("[", ""); line=line.replaceAll("]", "");
			 */
			line = line.replace("[", "").replace("]", "");

			// System.out.println("line"+line);
			String a[] = new String[2];
			String a5[] = new String[2];
			int k = 0;
			for (String retval1 : line.split("}", 1)) {
				String line1 = retval1;
				// System.out.println(line1);
				line1 = line1.replace("}", "");
				int j = 0;
				for (String retval : line1.split(",", 0)) {
					// System.out.println(retval);
					String a1 = retval;
					// System.out.println("a1"+a1);
					int i = 0;
					/*
					 * a5=a1.split(":"); System.out.println(a5[1]);
					 */
					for (String a2 : a1.split("=", 0)) {
						a[i] = a2;
						i++;
					}
					j++;
					// System.out.println("j"+j);
					data.put(a[0], a[1]);
					// System.out.println(a[0]+"    "+a[1]);
					datamap.put(a[0], a[1]);
					if (j == 5) {
						array.put(k, datamap);
						j = 0;
						k++;
					}
				}
				// System.out.println(array.length());

				// System.out.println("array");
				for (int t = 0; t < array.length(); t++) {
					// System.out.println(array.get(1));
					JSONObject dd = (JSONObject) array.get(t);

					// System.out.println(dd);
				}
			}
			// System.out.println("json");
			// System.out.println(data.toString());
			// System.out.println(datamap.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return array;
	}

	public org.json.JSONObject getPassword(String clinic_id)
			throws JSONException {
		org.json.JSONObject data = new org.json.JSONObject();
		try {
			String path = "http://localhost:8080/jioecg_2612/rest/jioecg/forgotpassword?clinic_id="
					+ clinic_id + "";
			HttpPost post = new HttpPost(path);
			// post.setHeader("Content-type", "application/json");
			// post.setEntity(new StringEntity(json.toString(), "UTF-8"));
			DefaultHttpClient client = new DefaultHttpClient();
			HttpResponse httpresponse = client.execute(post);
			BufferedReader br = new BufferedReader(new InputStreamReader(
					httpresponse.getEntity().getContent()));

			String line = br.readLine();
			System.out.println("line"+line);
			HttpEntity entity = httpresponse.getEntity();

			line = line.replace("{", "");
			line = line.replace("}", "");
			if(line.equalsIgnoreCase("1")){
			data.put("status", "1");}
			else
				{data.put("status", "failed");}

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("data"+data);
		return data;
	}

	public JSONArray getRegClinic() throws JSONException {
		List<String> dl = new ArrayList<String>();
		List<Map<String, String>> datalist = new ArrayList<Map<String, String>>();

		JSONArray array = new JSONArray();
		try {
			String path = "http://localhost:8080:8080/jioecg_2612/rest/jioecg/regclinic";
			HttpPost post = new HttpPost(path);
			// post.setHeader("Content-type", "application/json");
			// post.setEntity(new StringEntity(json.toString(), "UTF-8"));
			DefaultHttpClient client = new DefaultHttpClient();
			HttpResponse httpresponse = client.execute(post);
			BufferedReader br = new BufferedReader(new InputStreamReader(
					httpresponse.getEntity().getContent()));

			String line = br.readLine();
			// System.out.println(line);
			HttpEntity entity = httpresponse.getEntity();
			// System.out.println(entity.getContent());
			Map<String, String> datamap = new TreeMap<String, String>();

			line = line.replace("{", "");
			// line = line.replace("=", ":");
			line = line.replaceAll("\"", "");
			line = line.replaceAll(" ", "");
			/*
			 * line=line.replaceAll("[", ""); line=line.replaceAll("]", "");
			 */
			line = line.replace("[", "").replace("]", "");
			JSONObject data = new JSONObject();
			// System.out.println("line"+line);
			String a[] = new String[2];
			String a5[] = new String[2];
			int k = 0;
			for (String retval1 : line.split("}", 1)) {
				String line1 = retval1;
				int j = 0;
				// System.out.println(line1);
				line1 = line1.replace("}", "");
				for (String retval : line1.split(",", 0)) {
					// System.out.println(retval);
					String a1 = retval;
					int i = 0;
					/*
					 * a5=a1.split(":"); System.out.println(a5[1]);
					 */
					for (String a2 : a1.split("=", 0)) {
						a[i] = a2;
						i++;

					}
					j++;
					data.put(a[0], a[1]);
					// System.out.println(a[0]+"    "+a[1]);
					datamap.put(a[0], a[1]);
					// System.out.println(datamap.toString());
					// System.out.println("j"+j);
					if (j == 12) {
						// System.out.println("k"+k);
						array.put(k, datamap);
						// System.out.println(datamap.toString());
						datalist.add(k, datamap);
						// datamap.clear();
						j = 0;
						k++;
					}
				}

				// System.out.println("array");
				for (int t = 0; t < array.length(); t++) {
					// System.out.println(array.get(1));
					JSONObject dd = (JSONObject) array.get(t);

					// System.out.println(dd);
				}
				/*
				 * System.out.println("enddddd");
				 * System.out.println(datalist.size());
				 */
				dl.addAll(dl);

			}
			// System.out.println("json");
			// System.out.println(data.toString());

			// System.out.println("date"+date+"  time"+time);

			// System.out.println();

			/*
			 * if (datalist!=null && !datalist.isEmpty()) { //for(String em:dl){
			 * for (Map<String, String> employee : datalist) { for
			 * (Iterator<Entry<String, String>> it =
			 * employee.entrySet().iterator(); it.hasNext();) { Entry<String,
			 * String> entry = it.next(); String key = entry.getKey(); Object
			 * value = entry.getValue(); System.out.println(key + " = " +
			 * value); String abc=employee.get("patient_name");
			 * //System.out.println(ecgdata.toString());
			 * //System.out.println("abc"+abc); } System.out.println(); } }
			 */

		} catch (Exception e) {
			e.printStackTrace();
		}
		return array;
	}

	public JSONObject changeDeviceStatus(String clinic_id, String device_id,
			String device_status) throws JSONException {
		JSONObject data = new JSONObject();
		String line="";
		try {
			String path = "http://localhost:8080:8080/jioecg_2612/rest/jioecg/activatedeactivate?clinic_id="+clinic_id+"&device_id="+ device_id+ "&device_status="+ device_status;
			HttpPost post = new HttpPost(path);
			DefaultHttpClient client = new DefaultHttpClient();
			HttpResponse httpresponse = client.execute(post);
			BufferedReader br = new BufferedReader(new InputStreamReader(
					httpresponse.getEntity().getContent()));

			line = br.readLine();
			System.out.println(line);
			HttpEntity entity = httpresponse.getEntity();
		} catch (Exception e) {
			e.printStackTrace();
		}
		data.put("status", line);
		System.out.println("data"+data);
		return data;
	}
}
