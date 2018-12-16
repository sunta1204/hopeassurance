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
public class ProofController {
	ProofDAO proofDAO;
	PaymentDAO paymentDAO;
	public ProofController() throws ClassNotFoundException, SQLException {
		proofDAO = new ProofDAO(); 
		paymentDAO = new PaymentDAO();
	}
	
	//For admin Login
	@PostMapping("/uploadProofA" )
	public String uploadProofAdmin(HttpSession session,@RequestParam("payment_plate")String payment_plate,
			@RequestParam("payment_username") String payment_username,@RequestParam("payment_picName") String payment_picName
			,@RequestParam("payment_cartype") String payment_cartype,@RequestParam("proof_file") MultipartFile proof_file
			,@RequestParam("payment_proof") String payment_proof, Model model) throws SQLException {
		
		String user = (String)session.getAttribute("member_username");
		String userStatus = (String)session.getAttribute("member_status");
		
		if(user != null && userStatus.equals("A")) { //ถ้า user ไม่มีค่า และ userStatus มีค่าเท่ากับ A 
		Proof proof = new Proof(0, payment_cartype, payment_plate, payment_username, payment_picName, "", "", "", "", "", 0, "", payment_proof, "", "");			
		proofDAO.createProof(proof);
		
		String name1 = proof.getPayment_proof();
		String name2 = proof.getPayment_cartype();
		String name3 = proof.getPayment_plate();
		if (!proof_file.isEmpty()) {
			try {
				byte[] bytes = proof_file.getBytes();
				// Creating the directory to store file
				//String rootPath = System.getProperty("user.dir");
				//File dir = new File(rootPath +File.separator+ "tmpFiles");
				File dir = new File("src/main/resources/static/proof");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()+ File.separator + name1+"_"+name2+"_"+name3+".jpg");
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				//logger.info("Server File Location="+ serverFile.getAbsolutePath());
				
				//System.out.println(serverFile.getAbsolutePath());
				model.addAttribute("uploadStatus", "You successfully uploaded file= " +name1+name2+name3+"<br>"+serverFile.getAbsolutePath());
				//return "You successfully uploaded file= " + name+"<br>"+serverFile.getAbsolutePath();
			} catch (Exception e) {
				model.addAttribute("uploadStatus","You failed to upload " + name1 +name2+name3+ " => " + e.getMessage());
			}
		} else {
			model.addAttribute("uploadStatus", "You failed to upload " + name1 +name2+name3+ " because the file was empty.");
		}
		
		return"redirect:/admin/index_admin";
	}
		else {
			return "redirect:/pleaseLogin";
		}	
	}
	
	//For User Login
	@PostMapping("/uploadProofU" )
	public String uploadProofUser(HttpSession session,@RequestParam("payment_plate")String payment_plate,
			@RequestParam("payment_username") String payment_username,@RequestParam("payment_picName") String payment_picName
			,@RequestParam("payment_cartype") String payment_cartype,@RequestParam("proof_file") MultipartFile proof_file
			,@RequestParam("payment_proof") String payment_proof, Model model) throws SQLException {
		
		String user = (String)session.getAttribute("member_username");
		String userStatus = (String)session.getAttribute("member_status");
		
		if(user != null && userStatus.equals("U")) { //ถ้า user ไม่มีค่า และ userStatus มีค่าเท่ากับ U
		Proof proof = new Proof(0, payment_cartype, payment_plate, payment_username, payment_picName, "", "", "", "", "", 0, "", payment_proof, "", "");
		proofDAO.createProof(proof);
		
		String name1 = proof.getPayment_proof();
		String name2 = proof.getPayment_cartype();
		String name3 = proof.getPayment_plate();
		if (!proof_file.isEmpty()) {
			try {
				byte[] bytes = proof_file.getBytes();
				// Creating the directory to store file
				//String rootPath = System.getProperty("user.dir");
				//File dir = new File(rootPath +File.separator+ "tmpFiles");
				File dir = new File("src/main/resources/static/proof");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()+ File.separator +name1+"_"+name2+"_"+name3+".jpg");
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				//logger.info("Server File Location="+ serverFile.getAbsolutePath());
				
				//System.out.println(serverFile.getAbsolutePath());
				model.addAttribute("uploadStatus", "You successfully uploaded file= " + name1+name2+name3+"<br>"+serverFile.getAbsolutePath());
				//return "You successfully uploaded file= " + name+"<br>"+serverFile.getAbsolutePath();
			} catch (Exception e) {
				model.addAttribute("uploadStatus","You failed to upload " + name1 +name2+name3+ " => " + e.getMessage());
			}
		} else {
			model.addAttribute("uploadStatus", "You failed to upload " + name1 +name2+name3+ " because the file was empty.");
		}
		
		return"redirect:/User/index_user";
	}
		else {
			return "redirect:/pleaseLogin";
		}	
	}
}
