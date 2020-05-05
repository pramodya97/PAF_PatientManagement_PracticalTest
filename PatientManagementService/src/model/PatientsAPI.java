package model;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Patient;


@WebServlet("/PatientsAPI")
public class PatientsAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Patient patient = new Patient();
    
    public PatientsAPI() {
        super();
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String output = patient.registerPatients(request.getParameter("patientID"),
				request.getParameter("firstName"), 
				request.getParameter("email"),
				request.getParameter("sex"),
				request.getParameter("dob"),
				request.getParameter("height"), 
				request.getParameter("weight"), 
				request.getParameter("contactNumber"), 
				request.getParameter("maritalStatus"), 
				request.getParameter("streetAddL1"), 
				request.getParameter("postalCode"), 
				request.getParameter("password"), 
				request.getParameter("emergencyCNanme"), 
				request.getParameter("emergencyCrelationship"), 
				request.getParameter("emergencynumber"), 
				request.getParameter("takeMedication"), 
				request.getParameter("currentMedication"));
		response.getWriter().write(output);
	}

	
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map paras = getParasMap(request);
		
		 
		 String output = patient.updatePatient(paras.get("hidPatientIDSave").toString(), 
				 paras.get("patientID").toString(), 
				 paras.get("firstName").toString().replace('+', ' '), 
				 paras.get("email").toString().replace('%', '@'), 
				 paras.get("sex").toString(), 
				 paras.get("dob").toString(), 
				 paras.get("weight").toString(), 
				 paras.get("height").toString(),
				 paras.get("contactNumber").toString(),
				 paras.get("maritalStatus").toString(), 
				 paras.get("streetAddL1").toString().replace('%', ' '), 
				 paras.get("postalCode").toString(), 
				 paras.get("password").toString()).replace('%', ' ');
		 
		response.getWriter().write(output); 
	}

	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Map paras = getParasMap(request);
		 String output = patient.deletePatient(paras.get("id").toString());
		response.getWriter().write(output);
	}
	
	private static Map getParasMap(HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
			String queryString = scanner.hasNext() ? scanner.useDelimiter("\\A").next() : "";
			scanner.close();
			String[] params = queryString.split("&");
			for (String param : params) {
				String[] p = param.split("=");
				map.put(p[0], p[1]);
			}
		} catch (Exception e) {
		}
		return map;
	}
	

}
