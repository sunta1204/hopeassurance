package Control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProofDAO {
	private Connection con;
	
	// สร้างเมธอดชื่อเดียวกับคลาส (constructor)
	public ProofDAO() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver"); // โหลด JDBC Driver
		con = DriverManager.getConnection("jdbc:postgresql://ec2-23-21-65-173.compute-1.amazonaws.com:5432/dasv3f8h6p1jmu?characterEncoding=utf-8&sslmode=require", "mvzxqoanypdolk", "a0fb3792d2a352e66029d6f2d1fd20d3e0f5d40708289a4d00b89669c9fdd46a"); // เชื่อมต่อกับฐานข้อมูล
	}
	
	// สร้างเมธอดสำหรับปิดการเชื่อมต่อฐานข้อมูล
	public void closeConnection() throws SQLException {
		con.close();
	}
	
	// สร้างเมธอดสำหรับดึงข้อมูลจาก ResultSet มาเก็บใน JavaBeans
	private Proof mappingProof(ResultSet resultSet) throws SQLException {
		Proof proof= new Proof(
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
					resultSet.getString("transport_status")
					);
				return proof; // ส่งกลับเป็น javabean
		}			
			//create ลง ฐานข้อมูล
			public void createProof (Proof proof) throws SQLException {
				PreparedStatement pStatement = con.prepareStatement("UPDATE payment SET payment_proof = ? WHERE payment_cartype = ? AND payment_plate = ?");
				pStatement.setString(1, proof.getPayment_proof());
				pStatement.setString(2, proof.getPayment_cartype());
				pStatement.setString(3, proof.getPayment_plate());
				pStatement.executeUpdate();				
			}
			
			
}
