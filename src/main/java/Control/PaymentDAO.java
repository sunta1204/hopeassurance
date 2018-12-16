package Control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PaymentDAO {
	private Connection con;
	
	// สร้างเมธอดชื่อเดียวกับคลาส (constructor)
		public PaymentDAO() throws SQLException, ClassNotFoundException {
			Class.forName("org.postgresql.Driver"); // โหลด JDBC Driver
			String username = "mvzxqoanypdolk";
			String password = "a0fb3792d2a352e66029d6f2d1fd20d3e0f5d40708289a4d00b89669c9fdd46a";
			String dbUrl = "jdbc:postgresql://" + "ec2-23-21-65-173.compute-1.amazonaws.com:5432"
					+ "/dasv3f8h6p1jmu?sslmode=require";
			con = DriverManager.getConnection(dbUrl , username , password); // เชื่อมต่อกับฐานข้อมูล
		}
		
		// สร้างเมธอดสำหรับปิดการเชื่อมต่อฐานข้อมูล
		public void closeConnection() throws SQLException {
			con.close();
		}
		
		// สร้างเมธอดสำหรับดึงข้อมูลจาก ResultSet มาเก็บใน JavaBeans
		private Payment mappingPayment(ResultSet resultSet) throws SQLException {
			Payment payment= new Payment(
						resultSet.getInt("payment_id"), 
						resultSet.getString("payment_cartype"),
						resultSet.getString("payment_plate"),
						resultSet.getString("payment_username"),
						resultSet.getString("payment_name"),
						resultSet.getString("payment_email"), 
						resultSet.getString("payment_phone"), 
						resultSet.getString("payment_address"), 
						resultSet.getString("payment_city"), 
						resultSet.getString("payment_country"), 
						resultSet.getInt("payment_zipcode"), 
						resultSet.getString("payment_picName"),	
						resultSet.getString("payment_proof"),
						resultSet.getString("payment_status"),
						resultSet.getString("transport_status"),
						resultSet.getString("payment_track")
						);
					return payment; // ส่งกลับเป็น javabean
			}	
		
		// สร้างเมธอดที่ทำงานกับฐานข้อมูล
					//เรียก proof_id ที่ ??? มา
					public Payment getPaymentId(int payment_id) throws SQLException {		
						Payment payment = null;
						
						PreparedStatement pStatement = con.prepareStatement("SELECT * FROM payment WHERE payment_id = ?"); // เตรียมคำสั่ง SQL
						pStatement.setInt(1, payment_id);		
						ResultSet resultSet = pStatement.executeQuery(); // ส่งคำสั่ง SQL ไปยังฐานข้อมูล		
						if (resultSet.next()) // ถ้าพบข้อมูล
							payment =  mappingPayment(resultSet); // นำผลลัพธ์ที่ฐานข้อมูลส่งกลับแปลงเป็น object
						
						return payment; 	// ส่งกลับเป็น javabean
					}
					
					//create ลง ฐานข้อมูล
					public void createPayment (Payment payment) throws SQLException {
						PreparedStatement pStatement = con.prepareStatement("INSERT INTO payment (payment_username,payment_cartype ,payment_plate, payment_name,payment_email,payment_phone,payment_address,payment_city,payment_country,payment_zipcode,payment_picName) VALUES (?,?,?,?,?,?,?,?,?,?,?)");
						pStatement.setString(1, payment.getPayment_username());
						pStatement.setString(2, payment.getPayment_cartype());
						pStatement.setString(3, payment.getPayment_plate());
						pStatement.setString(4, payment.getPayment_name());
						pStatement.setString(5, payment.getPayment_email());
						pStatement.setString(6, payment.getPayment_phone());
						pStatement.setString(7, payment.getPayment_address());
						pStatement.setString(8, payment.getPayment_city());
						pStatement.setString(9, payment.getPayment_country());
						pStatement.setInt(10, payment.getPayment_zipcode());
						pStatement.setString(11, payment.getPayment_picName());
						pStatement.executeUpdate();							
					}
					
					public ArrayList<Payment> getAllPayment() throws SQLException {
						ArrayList<Payment> paymentList = new ArrayList<Payment>();  // ประกาศอาร์เรย์เปล่าสำหรับเก็บ javabeans
						PreparedStatement pStatement = con.prepareStatement("SELECT * FROM payment "); // เตรียมคำสั่ง SQL		
						ResultSet resultSet = pStatement.executeQuery();  // ส่งคำสั่ง SQL ไปยังฐานข้อมูล
						// วนลูปอ่านผลลัพธ์ทีละแถว
						while (resultSet.next()) {
							Payment m = mappingPayment(resultSet); // แปลงข้อมูลเป็น javabean
							paymentList.add(m); // เก็บ javabean ในอาร์เรย์
						}
						return paymentList; // ส่งกลับเป็นอาร์เรย์ของ javabean
					}
					
					public Payment getPayment(int payment_id) throws SQLException {		
						Payment payment = null;
						
						PreparedStatement pStatement = con.prepareStatement("SELECT * FROM payment WHERE payment_id = ?"); // เตรียมคำสั่ง SQL
						pStatement.setInt(1, payment_id);		
						ResultSet resultSet = pStatement.executeQuery(); // ส่งคำสั่ง SQL ไปยังฐานข้อมูล		
						if (resultSet.next()) // ถ้าพบข้อมูล
							payment = mappingPayment(resultSet); // นำผลลัพธ์ที่ฐานข้อมูลส่งกลับแปลงเป็น object
						
						return payment; 	// ส่งกลับเป็น javabean
					}
					
					public void updatePayment (Payment payment) throws SQLException {	 
				        PreparedStatement pStatement = con.prepareStatement("UPDATE payment SET payment_status = ?  ,transport_status = ? , payment_track = ?  WHERE payment_id = ?");	        	      
						pStatement.setString(1, payment.getPayment_status());
						pStatement.setString(2, payment.getTransport_status());
						pStatement.setString(3, payment.getPayment_track());
						pStatement.setInt(4, payment.getPayment_id());			
				        pStatement.executeUpdate();			   
					}
					
					public void deletePayment(int payment_id) throws SQLException {	 
				        PreparedStatement pStatement = con.prepareStatement("DELETE FROM payment WHERE payment_id = ? ");
				        pStatement.setInt(1, payment_id);
				        pStatement.executeUpdate();
					}
					
					public Payment checkPayment(String payment_username , String payment_cartype , String payment_picName , String payment_plate) throws SQLException{
						Payment payment = null;
						PreparedStatement pStatement = con.prepareStatement("SELECT * FROM payment WHERE payment_username = ? AND payment_cartype = ? AND payment_picName = ? AND payment_plate = ?");
						pStatement.setString(1, payment_username);
						pStatement.setString(2, payment_cartype);
						pStatement.setString(3, payment_picName);
						pStatement.setString(4, payment_plate);
						ResultSet resultSet = pStatement.executeQuery(); // ส่งคำสั่ง SQL ไปยังฐานข้อมูล		
						if (resultSet.next()) // ถ้าพบข้อมูล
							payment = mappingPayment(resultSet); // นำผลลัพธ์ที่ฐานข้อมูลส่งกลับแปลงเป็น object
						
						return payment; 	// ส่งกลับเป็น javabean
					}
}
