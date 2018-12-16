package Control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Control.Member;
import Control.MemberDAO;

public class MemberDAO {
	private Connection con;
	
	// สร้างเมธอดชื่อเดียวกับคลาส (constructor)
		public MemberDAO() throws SQLException, ClassNotFoundException {
			Class.forName("com.mysql.jdbc.Driver"); // โหลด JDBC Driver
			con = DriverManager.getConnection("jdbc:postgresql://ec2-23-21-65-173.compute-1.amazonaws.com:5432/dasv3f8h6p1jmu?characterEncoding=utf-8&sslmode=require", "mvzxqoanypdolk", "a0fb3792d2a352e66029d6f2d1fd20d3e0f5d40708289a4d00b89669c9fdd46a"); // เชื่อมต่อกับฐานข้อมูล
		}
		
		// สร้างเมธอดสำหรับปิดการเชื่อมต่อฐานข้อมูล
		public void closeConnection() throws SQLException {
			con.close();
		}
		

		// สร้างเมธอดสำหรับดึงข้อมูลจาก ResultSet มาเก็บใน JavaBeans
		private Member mappingMember(ResultSet resultSet) throws SQLException {
			Member member = new Member(
					resultSet.getString("member_username"),
					resultSet.getString("member_password"), 
					resultSet.getString("member_name"), 
					resultSet.getString("member_email"), 
					resultSet.getString("member_phone"), 
					resultSet.getString("member_address"), 
					resultSet.getString("member_city"),
					resultSet.getString("member_country"), 
					resultSet.getInt("member_zipcode"),
					resultSet.getString("member_status"),
					resultSet.getString("member_pic"));
			return member; // ส่งกลับเป็น javabean
		}	

		// สร้างเมธอดที่ทำงานกับฐานข้อมูล
		public Member getMember(String member_username) throws SQLException {		
			Member member = null;
			
			PreparedStatement pStatement = con.prepareStatement("SELECT * FROM member WHERE member_username = ?"); // เตรียมคำสั่ง SQL
			pStatement.setString(1, member_username);		
			ResultSet resultSet = pStatement.executeQuery(); // ส่งคำสั่ง SQL ไปยังฐานข้อมูล		
			if (resultSet.next()) // ถ้าพบข้อมูล
				member = mappingMember(resultSet); // นำผลลัพธ์ที่ฐานข้อมูลส่งกลับแปลงเป็น object
			
			return member; 	// ส่งกลับเป็น javabean
		}
		
		//Login
		public Member login(String member_username , String member_password) throws SQLException{
			Member member = null;
			PreparedStatement pStatement = con.prepareStatement("SELECT * FROM member WHERE member_username = ? AND member_password = ?");
			pStatement.setString(1, member_username);
			pStatement.setString(2, member_password);
			ResultSet resultSet = pStatement.executeQuery();
			if(resultSet.next())
				member = mappingMember(resultSet);
			return member;
		}
		
		public ArrayList<Member> getAllMember() throws SQLException {
			ArrayList<Member> memberList = new ArrayList<Member>();  // ประกาศอาร์เรย์เปล่าสำหรับเก็บ javabeans
			PreparedStatement pStatement = con.prepareStatement("SELECT * FROM member"); // เตรียมคำสั่ง SQL		
			ResultSet resultSet = pStatement.executeQuery();  // ส่งคำสั่ง SQL ไปยังฐานข้อมูล
			// วนลูปอ่านผลลัพธ์ทีละแถว
			while (resultSet.next()) {
				Member m = mappingMember(resultSet); // แปลงข้อมูลเป็น javabean
				memberList.add(m); // เก็บ javabean ในอาร์เรย์
			}
			return memberList; // ส่งกลับเป็นอาร์เรย์ของ javabean
		}
			
		//searchMember
			public ArrayList<Member> getAllMemberSearch(String key) throws SQLException {
				ArrayList<Member> memberList = new ArrayList<Member>();  // ประกาศอาร์เรย์เปล่าสำหรับเก็บ javabeans
				PreparedStatement pStatement = con.prepareStatement("SELECT * FROM member WHERE  member_username LIKE '%"+ key +"%' OR member_name LIKE '%"+ key +"%'  OR member_email LIKE '%"+ key +"%' OR member_phone LIKE '%"+ key +"%' OR member_address LIKE '%"+ key +"%' OR member_city LIKE '%"+ key +"%' OR member_country LIKE '%"+ key +"%' OR member_zipcode LIKE '%"+ key +"%'"); // เตรียมคำสั่ง SQL		
				ResultSet resultSet = pStatement.executeQuery();  // ส่งคำสั่ง SQL ไปยังฐานข้อมูล
				// วนลูปอ่านผลลัพธ์ทีละแถว
				while (resultSet.next()) {
					Member m = mappingMember(resultSet); // แปลงข้อมูลเป็น javabean
					memberList.add(m); // เก็บ javabean ในอาร์เรย์
				}			
			return memberList; // ส่งกลับเป็นอาร์เรย์ของ javabean
		}
		 
		
		

		public void createMember (Member member) throws SQLException {
			PreparedStatement pStatement = con.prepareStatement("INSERT INTO member (member_username,member_password ,member_name  ,member_email ,member_phone ,member_address ,member_city , member_country , member_zipcode) VALUES (?, ?,?,?,?,?,?,?,?)");
			pStatement.setString(1, member.getMember_username());
			pStatement.setString(2,member.getMember_password() );
			pStatement.setString(3, member.getMember_name());
			pStatement.setString(4, member.getMember_email());
			pStatement.setString(5, member.getMember_phone());
			pStatement.setString(6, member.getMember_address());
			pStatement.setString(7, member.getMember_city());
			pStatement.setString(8, member.getMember_country());
			pStatement.setInt(9, member.getMember_zipcode());
			pStatement.executeUpdate();
			
		}
		

		public void updateMember (Member member) throws SQLException {	 
	        PreparedStatement pStatement = con.prepareStatement("UPDATE member SET member_name = ?,member_email = ?,member_phone = ?,member_address = ?,member_city = ?,member_country = ?,member_zipcode = ?  WHERE member_username = ?");	        	      
			pStatement.setString(1, member.getMember_name());
			pStatement.setString(2, member.getMember_email());
			pStatement.setString(3, member.getMember_phone());
			pStatement.setString(4, member.getMember_address());
			pStatement.setString(5, member.getMember_city());
			pStatement.setString(6, member.getMember_country());
			pStatement.setInt(7, member.getMember_zipcode());
	        pStatement.executeUpdate();
	   
		}

		public void deleteMember (String member_username) throws SQLException {	 
	        PreparedStatement pStatement = con.prepareStatement("DELETE FROM member WHERE member_username = ?");
	        pStatement.setString(1, member_username);
	        pStatement.executeUpdate();
		}
		
		public void uploadProfilePic(Member member)throws SQLException{
			PreparedStatement pStatement = con.prepareStatement("UPDATE member SET member_pic = ?  WHERE member_username = ?");	        	      
			pStatement.setString(1, member.getMember_pic());
			pStatement.setString(2, member.getMember_username());	
	        pStatement.executeUpdate();
		}
		
		
		
		// ควรสร้างเมธอด main สำหรับรันทดสอบ ก่อนนำไปใช้จริงใน servlet
		public static void main(String[] args) {
			try {
				// ก่อนใช้เมธอดต่างๆใน DAO ต้องสร้าง object ก่อน 
				// ในที่นี้จะเรียกเมธอด ProductDAO() ซึ่งมีการโหลด JDBC Driver และเชื่อมต่อฐานข้อมูล
				MemberDAO memberDAO = new MemberDAO(); 
				
				// ดึงข้อมูลตามรหัสสินค้า
				//Member oneMember = MemberDAO.getMember();
				//System.out.println(oneMember.getMember_firstname() + " " + oneMember.getMember_lastname());
				
				// ดึงข้อมูลสินค้าทั้งหมด
				//ArrayList<Member> list = memberDAO.getAllMember();
				//for (Member member : list) {
					//System.out.println(member.getMember_firstname()+ " " + member.getMember_lastname());
				//}
				
				// เพิ่มข้อมูล
				//Product newProduct = new Product(0, "นาฬิกาใหม่", "ดูเวลา + ดูอัตราเผาผลาญ", 350);			
				//productDAO.createProduct(newProduct);
				
				// แก้ไขข้อมูล
				//Product oldProduct = new Product(1, "Update Centrum", "สูตรใหม่", 400);
				//productDAO.updateProduct(oldProduct);
				
				// ลบข้อมูล
				//productDAO.deleteProduct(20);
				
				// ปิดการเชื่อมต่อ
				memberDAO.closeConnection();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
}
