package Control;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class checkController {
	PaymentDAO paymentDAO;
	ProofDAO proofDAO;
	MemberDAO memberDAO;
	public checkController()throws  ClassNotFoundException, SQLException{
		paymentDAO = new PaymentDAO();
		proofDAO = new ProofDAO(); 
		memberDAO = new MemberDAO(); 
	}
	
	
	@GetMapping("/checkPayment")
	public String checkPayment(Model model ,HttpSession session) throws SQLException {
		String user = (String)session.getAttribute("member_username");
		String userStatus = (String)session.getAttribute("member_status");
		
		if(user != null && userStatus.equals("A")) { //ถ้า user ไม่มีค่า และ userStatus มีค่าเท่ากับ A 
			ArrayList<Payment> paymentList = paymentDAO.getAllPayment();
			model.addAttribute("paymentList", paymentList);
			
			Member memberProfile = memberDAO.getMember(user);
			model.addAttribute("memberProfile" , memberProfile);			
			return "/admin/checkPayment";
		}else {
			return "redirect:/pleaseLogin";
		}	
	}
	
	//Edit Transport
	@PostMapping("/editTransprot")
	public String editTransprot(@RequestParam("payment_id") int payment_id, @RequestParam("payment_status")String payment_status 
			, @RequestParam("transport_status") String transport_status ,@RequestParam("payment_track")String payment_track, Model model , HttpSession session ) throws SQLException {
		String user = (String)session.getAttribute("member_username");
		String userStatus = (String)session.getAttribute("member_status");
		if(user != null && userStatus.equals("A")) {			
			Payment payment = new Payment(payment_id, "", "", "", "", "", "", "", "", "", 0, "", "", payment_status, transport_status,payment_track);
			paymentDAO.updatePayment(payment);
			return "redirect:/checkPayment";
		}else {
			return "redirect:/pleaseLogin";
		}	
	}
	
	//delete Payment and Proof
	@GetMapping("/deletePayment/{payment_id}")
	public String deletePayment(Model model , HttpSession session , @PathVariable("payment_id") int payment_id
		) throws SQLException{
		String user = (String)session.getAttribute("member_username");
		String userStatus = (String)session.getAttribute("member_status");
		if(user != null && userStatus.equals("A")) {
			paymentDAO.deletePayment(payment_id);
		return "redirect:/checkPayment";
		}else {
			return "redirect:/pleaseLogin";
		}	
	}
	

	
}
