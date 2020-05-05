package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import util.DBConnection;

public class Patient {

	DBConnection dbCon = new DBConnection();

	
	
	// View Patient Details ------------------------------
	public String readPatientDetails() {
		String output = "";
		try {
			Connection con = dbCon.connect();
			if (con == null) {
				return "Error while connecting to the database for reading.";
			}
			// Prepare the html table to be displayed
			output = "<table border='0'><tr><th>PatientID</th> <th>Name</th><th>Email</th><th>Sex</th><th>DOB</th>"
					+ "<th>Height</th><th>Weight</th><th>Contact Number</th><th>Marital Status</th><th>Address</th><th>Postal Code</th><th>Password</th>" + "<th>Update</th><th>Remove</th></tr>";

			String query = "select * from patientdetails";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			// iterate through the rows in the result set
			while (rs.next()) {
				String id = Integer.toString(rs.getInt("id"));
				String patientID = rs.getString("patientID");
				String firstName = rs.getString("firstName");
				String email = rs.getString("email");
				String sex = rs.getString("sex");
				String dob = rs.getString("dob");
				String height = Float.toString(rs.getFloat("height"));
				String weight = Float.toString(rs.getFloat("weight"));
				String contactNumber = Integer.toString(rs.getInt("contactNumber"));
				String maritalStatus = rs.getString("maritalStatus");
				String streetAddL1 = rs.getString("streetAddL1");
				String postalCode = Integer.toString(rs.getInt("postalCode"));
				String password = rs.getString("password");
			
				// Add into the html table
				output += "<tr><td><input id='hidItemIDUpdate'" + " name='hidItemIDUpdate' " 
						+ " type='hidden' value='"
								+ id + "'>" + patientID + "</td>";
				
				output += "<td>" + firstName + "</td>";
				output += "<td>" + email + "</td>";
				output += "<td>" + sex + "</td>";
				output += "<td>" + dob + "</td>";
				output += "<td>" + height + "</td>";
				output += "<td>" + weight + "</td>";
				output += "<td>" + contactNumber + "</td>";
				output += "<td>" + maritalStatus + "</td>";
				output += "<td>" + streetAddL1 + "</td>";
				output += "<td>" + postalCode + "</td>";
				output += "<td>" + password + "</td>";
				// buttons
				output += "<td><input name='btnUpdate'" + " type='button' value='Update'"
						+ "class='btnUpdate btn btn-secondary'></td>" + "<td><input name='btnRemove'"
						+ "type='button' value='Remove'" + " class='btnRemove btn btn-danger'" + " data-itemid='"
						+ id + "'>" + "</td></tr>";
			}
			con.close();
			// Complete the html table
			output += "</table>";
		} catch (Exception e) {
			output = "Error while reading the items.";
			System.err.println(e.getMessage());
		}
		return output;
	}
	
	
	// Insert Patients -----------------------------
	
	public String registerPatients(String patientID, String firstName, String email,
			String sex, String dob, String weight, String height, String contactNumber, String maritalStatus,
			String streetAddL1, String postalCode, String password,
			String emergencyCNanme, String emergencyCrelationship, String emergencynumber, String takeMedication,
			String currentMedication) {
		String output = "";
		try {
			Connection con = dbCon.connect();
			if (con == null) {
				return "Error while connecting to the database for inserting.";
			}
			// create a prepared statement
			String query = "INSERT INTO patientdetails (id, patientID, firstName, "
					+ "email, sex, dob, height, weight, contactNumber, maritalStatus, streetAddL1, "
					+ "postalCode, password, emergencyCNanme, emergencyCrelationship, "
					+ "emergencynumber, takeMedication, currentMedication) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setInt(1, 0);
			preparedStmt.setString(2,patientID);
			preparedStmt.setString(3, firstName);
			preparedStmt.setString(4, email);
			preparedStmt.setString(5, sex);
			preparedStmt.setString(6, dob);
			preparedStmt.setFloat(7, Float.parseFloat(height));
			preparedStmt.setFloat(8, Float.parseFloat(weight));
			preparedStmt.setInt(9, Integer.parseInt(contactNumber));
			preparedStmt.setString(10, maritalStatus);
			preparedStmt.setString(11, streetAddL1);
			preparedStmt.setInt(12, Integer.parseInt(postalCode));
			preparedStmt.setString(13, password);
			preparedStmt.setString(14, emergencyCNanme);
			preparedStmt.setString(15, emergencyCrelationship);
			preparedStmt.setInt(16, Integer.parseInt(emergencynumber));
			preparedStmt.setString(17, takeMedication);
			preparedStmt.setString(18, currentMedication);
			
			// execute the statement
			preparedStmt.execute();
			con.close();
			
			String newItems = readPatientDetails();
			output = "{\"status\":\"success\", \"data\": \"" + newItems + "\"}";
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\": \"Error while inserting the item.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}
	
	
	
	//Update Patient Details --------------------------------------
	
	public String updatePatient(String id, String patientID, String firstName, String email,
			String sex, String dob, String weight, String height, String contactNumber, String maritalStatus,
			String streetAddL1, String postalCode, String password) {
		String output = "";
		try {
			Connection con = dbCon.connect();
			if (con == null) {
				return "Error while connecting to the database for updating.";
			}
			// create a prepared statement
			String query = "UPDATE patientdetails SET patientID =?, firstName=?, email=?, sex=?, dob=?, height=?,"
					+ " weight=?, contactNumber=?, maritalStatus=?, streetAddL1=?, postalCode=?, password=? WHERE id = ?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setString(1, patientID);
			preparedStmt.setString(2, firstName);
			preparedStmt.setString(3, email);
			preparedStmt.setString(4, sex);
			preparedStmt.setString(5, dob);
			preparedStmt.setFloat(6, Float.parseFloat(height));
			preparedStmt.setFloat(7, Float.parseFloat(weight));
			preparedStmt.setInt(8, Integer.parseInt(contactNumber));
			preparedStmt.setString(9, maritalStatus);
			preparedStmt.setString(10, streetAddL1);
			preparedStmt.setInt(11, Integer.parseInt(postalCode));
			preparedStmt.setString(12, password);
			preparedStmt.setInt(13,  Integer.parseInt(id));
			// execute the statement
			preparedStmt.execute();
			con.close();
			
			String newItems = readPatientDetails();
			output = "{\"status\":\"success\", \"data\": \"" + newItems + "\"}";
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\":\"Error while updating the item.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}
	
	
	// Delete Patients -----------------------------------
	
	public String deletePatient(String id) {
		String output = "";
		try {
			Connection con = dbCon.connect();
			if (con == null) {
				return "Error while connecting to the database for deleting.";
			}

			// create a prepared statement
			String query = "DELETE FROM patientdetails WHERE id=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setInt(1, Integer.parseInt(id));
			// execute the statement
			System.out.println("Methanata enawa2");
			preparedStmt.execute();
			con.close();
			
			String newItems = readPatientDetails();
			output = "{\"status\":\"success\", \"data\": \"" + newItems + "\"}";
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\": \"Error while deleting the item.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}
		
	
}
