package Control;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class PaymentController {
	PaymentDAO paymentDAO;
	MemberDAO memberDAO;
	public PaymentController()throws  ClassNotFoundException, SQLException{
		paymentDAO = new PaymentDAO();
		memberDAO = new MemberDAO();
	}
	
	
	//For admin login
	@PostMapping("/insertPaymentA" )
	public String insertPaymentAmin(HttpSession session,@RequestParam("payment_cartype") String payment_cartype,@RequestParam("payment_plate") String payment_plate,@RequestParam("payment_username") String payment_username
			,@RequestParam("payment_name") String payment_name,@RequestParam("payment_email") String payment_email
			,@RequestParam("payment_phone") String payment_phone,@RequestParam("payment_address") String payment_address
			,@RequestParam("payment_city")String payment_city,@RequestParam("payment_country")String payment_country
			,@RequestParam("payment_zipcode") int payment_zipcode,@RequestParam("payment_picName")String payment_picName
			,@RequestParam("payment_pic") MultipartFile payment_pic, Model model) throws SQLException {
		
		String user = (String)session.getAttribute("member_username");
		String userStatus = (String)session.getAttribute("member_status");
		
		if(user != null && userStatus.equals("A")) { //ถ้า user ไม่มีค่า และ userStatus มีค่าเท่ากับ A
			Payment payment = new Payment(0, payment_cartype,payment_plate,payment_username, payment_name, payment_email, payment_phone, payment_address, payment_city, payment_country, payment_zipcode, payment_picName,"", "","","");
		paymentDAO.createPayment(payment);
		
		String name1 = payment.getPayment_picName();
		String name2 = payment.getPayment_cartype();
		String name3 = payment.getPayment_plate();
		if (!payment_pic.isEmpty()) {
			try {
				byte[] bytes = payment_pic.getBytes();
				// Creating the directory to store file
				//String rootPath = System.getProperty("user.dir");
				//File dir = new File(rootPath +File.separator+ "tmpFiles");
				File dir = new File("src/main/resources/static/payment");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()+ File.separator + name1+"_"+name2+"_"+name3+".jpg");
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				//logger.info("Server File Location="+ serverFile.getAbsolutePath());
				
				//System.out.println(serverFile.getAbsolutePath());
				model.addAttribute("uploadStatus", "You successfully uploaded file= " + name1+name2+name3+"<br>"+serverFile.getAbsolutePath());
				//return "You successfully uploaded file= " + name+"<br>"+serverFile.getAbsolutePath();
			} catch (Exception e) {
				model.addAttribute("uploadStatus","You failed to upload " +name1+name2+name3+ " => " + e.getMessage());
			}
		} else {
			model.addAttribute("uploadStatus", "You failed to upload " + name1 +name2+name3+" because the file was empty.");
		}
		
		return"redirect:/admin/index_admin";
	}else {
		return "redirect:/pleaseLogin";
	}	
}
	//For User login
	@PostMapping("/insertPaymentU" )
	public String insertPaymentUser(HttpSession session,@RequestParam("payment_cartype") String payment_cartype,@RequestParam("payment_plate")String payment_plate,@RequestParam("payment_username") String payment_username
			,@RequestParam("payment_name") String payment_name,@RequestParam("payment_email") String payment_email
			,@RequestParam("payment_phone") String payment_phone,@RequestParam("payment_address") String payment_address
			,@RequestParam("payment_city")String payment_city,@RequestParam("payment_country")String payment_country
			,@RequestParam("payment_zipcode") int payment_zipcode,@RequestParam("payment_picName")String payment_picName
			,@RequestParam("payment_pic") MultipartFile payment_pic, Model model) throws SQLException {
		
		String user = (String)session.getAttribute("member_username");
		String userStatus = (String)session.getAttribute("member_status");
		
		if(user != null && userStatus.equals("U")) { //ถ้า user ไม่มีค่า และ userStatus มีค่าเท่ากับ U
			Payment payment = new Payment(0, payment_cartype,payment_plate,payment_username, payment_name, payment_email, payment_phone, payment_address, payment_city, payment_country, payment_zipcode, payment_picName,"", "","","");
			paymentDAO.createPayment(payment);
		
		String name1 = payment.getPayment_picName();
		String name2 = payment.getPayment_cartype();
		String name3 = payment.getPayment_plate();
		if (!payment_pic.isEmpty()) {
			try {
				byte[] bytes = payment_pic.getBytes();
				// Creating the directory to store file
				//String rootPath = System.getProperty("user.dir");
				//File dir = new File(rootPath +File.separator+ "tmpFiles");
				File dir = new File("src/main/resources/static/payment");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()+ File.separator + name1+"_"+name2+"_"+name3+".jpg");
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				//logger.info("Server File Location="+ serverFile.getAbsolutePath());
				
				//System.out.println(serverFile.getAbsolutePath());
				model.addAttribute("uploadStatus", "You successfully uploaded file= " + name1+name2+name3+"<br>"+serverFile.getAbsolutePath());
				//return "You successfully uploaded file= " + name+"<br>"+serverFile.getAbsolutePath();
			} catch (Exception e) {
				model.addAttribute("uploadStatus","You failed to upload " +name1+name2+name3+ " => " + e.getMessage());
			}
		} else {
			model.addAttribute("uploadStatus", "You failed to upload " + name1 +name2+name3+" because the file was empty.");
		}
		
		return"redirect:/User/index_user";
	}
		else {
			return "redirect:/pleaseLogin";
		}	
	}
}
