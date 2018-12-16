package Control;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {
	MemberDAO memberDAO;
	PaymentDAO paymentDAO;
	ProofDAO proofDAO;
	public UserController() throws ClassNotFoundException, SQLException {
		memberDAO = new MemberDAO(); 
		paymentDAO = new PaymentDAO();
		proofDAO = new ProofDAO();
	}
	@GetMapping("/User/checkTrans")
	public String checkTrans()throws SQLException{
		return "/User/checkTrans";
	}
	
	@PostMapping("/checkTransU")
	public String checkTransport(Model model , HttpSession session , @RequestParam("payment_username") String payment_username 
			, @RequestParam("payment_cartype") String payment_cartype , @RequestParam("payment_picName") String payment_picName
			,@RequestParam("payment_plate")String payment_plate) throws SQLException{
		
	String user = (String)session.getAttribute("member_username");
	String userStatus = (String)session.getAttribute("member_status");
	if(user != null && userStatus.equals("U")) {
		Payment payment = paymentDAO.checkPayment(payment_username, payment_cartype, payment_picName,payment_plate);
		model.addAttribute("payment" , payment);
		return "/User/checkTrans";
	}else {
		return "redirect:/pleaseLogin";
	}	
	}
	
		//index_user
		@GetMapping("/User/index_user")
		public String indexUser(Model model ,HttpSession session) throws SQLException {
			String user = (String)session.getAttribute("member_username");
			String userStatus = (String)session.getAttribute("member_status");
			
			if(user != null && userStatus.equals("U")) { //ถ้า user ไม่มีค่า และ userStatus มีค่าเท่ากับ U 
										
				Member memberProfile = memberDAO.getMember(user);
				model.addAttribute("memberProfile" , memberProfile);
				
				return "/User/index_user";
			}else {
				return "redirect:/pleaseLogin";
			}	
		}
		
			//edit_profile
			@PostMapping("/editProfileU")
			public String editProfile(@RequestParam("member_password") String member_password,
					@RequestParam("member_name") String member_name,
					@RequestParam("member_email") String member_email,@RequestParam("member_phone") String member_phone,
					@RequestParam("member_address") String member_address,@RequestParam("member_city") String member_city
					,@RequestParam("member_country") String member_country,@RequestParam("member_zipcode") int member_zipcode
					,HttpSession session, Model model) throws SQLException{
				String user = (String)session.getAttribute("member_username");
				String userStatus = (String)session.getAttribute("member_status");
				
				if(user != null && userStatus.equals("U")) {			
			
				Member memberProfile = memberDAO.getMember(user);
					model.addAttribute("memberProfile" , memberProfile);
					
					Member member = new Member("",member_password, member_name, member_email, member_phone, member_address, member_city, member_country, member_zipcode, "","");
					memberDAO.updateMember(member);
					return "redirect:/User/index_user";
				}else {
					return "redirect:/pleaseLogin";
				}	
			}
}
