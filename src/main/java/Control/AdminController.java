package Control;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import Control.MemberDAO;

@Controller
public class AdminController {

	MemberDAO memberDAO;
	public AdminController() throws ClassNotFoundException, SQLException {
		memberDAO = new MemberDAO(); 
	}
	
	//TestCaptue
		@RequestMapping("/capture")
	    public String captue(Model model) throws SQLException {
			return "/TestCapture";
	    }
	
	//index
	@RequestMapping("/")
    public String intdex(Model model) throws SQLException {
		return "/index";
    }
	
	@RequestMapping("/pleaseLogin")
    public String plLogin(Model model) throws SQLException {
		return "/pleaseLogin";
    }
	
	//login
	@RequestMapping(value = "/login" , method = RequestMethod.POST )
	public String Login(Model model, HttpSession session , @RequestParam("member_username") String member_username 
			, @RequestParam("member_password") String member_password) throws SQLException{
		try {
			Member member =  memberDAO.login(member_username, member_password);
			if(member == null) {
				//Login Failed User pass invalid
				model.addAttribute("Error" , "Login Failed !!");
				return "/index";
			} else {
					// Admin
					if(member.getMember_status().equals("A")) {
						session.setAttribute("member_username", member.getMember_username());
						session.setAttribute("member_name", member.getMember_name());
						session.setAttribute("member_email", member.getMember_email());
						session.setAttribute("member_phone", member.getMember_phone());
						session.setAttribute("member_address", member.getMember_address());
						session.setAttribute("member_city", member.getMember_city());
						session.setAttribute("member_country", member.getMember_country());
						session.setAttribute("member_zipcode", member.getMember_zipcode());
						session.setAttribute("member_status", member.getMember_status());
						
						String user = (String) session.getAttribute("member_username");
						Member memberProfile = memberDAO.getMember(user);
						model.addAttribute("memberProfile" , memberProfile);
						return "redirect:/admin/index_admin";
												
					//User	
					}else {
						session.setAttribute("member_username", member.getMember_username());
						session.setAttribute("member_name", member.getMember_name());
						session.setAttribute("member_email", member.getMember_email());
						session.setAttribute("member_phone", member.getMember_phone());
						session.setAttribute("member_address", member.getMember_address());
						session.setAttribute("member_city", member.getMember_city());
						session.setAttribute("member_country", member.getMember_country());
						session.setAttribute("member_zipcode", member.getMember_zipcode());
						session.setAttribute("member_status", member.getMember_status());
						
						String user = (String) session.getAttribute("member_username");
						Member memberProfile = memberDAO.getMember(user);
						model.addAttribute("memberProfile" , memberProfile);
						return "redirect:/User/index_user";
					//Error
					}
				}
			} catch (Exception e) {
				model.addAttribute(e);
				return "index";
			}
		}
	
	//logout
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("member_id");
		session.removeAttribute("member_username");
		session.removeAttribute("member_name");
		session.removeAttribute("member_email");
		session.removeAttribute("member_phone");
		session.removeAttribute("member_address");
		session.removeAttribute("member_city");
		session.removeAttribute("member_country");
		session.removeAttribute("member_zipcode");
		session.removeAttribute("member_status");
		return "redirect:/";
	}
	
	//register
	@PostMapping("/Register")
	public String Register(@RequestParam("member_username") String member_username,@RequestParam("member_password") String member_password,@RequestParam("member_name") String member_name,@RequestParam("member_email") String member_email,@RequestParam("member_phone") String member_phone,@RequestParam("member_address") String member_address,@RequestParam("member_city") String member_city,@RequestParam("member_country") String member_country,@RequestParam("member_zipcode") int member_zipcode, Model model) throws SQLException{
		Member m = new Member(member_username, member_password, member_name, member_email, member_phone, member_address ,member_city, member_country, member_zipcode,"","");  
    	memberDAO.createMember(m);
    	model.addAttribute(m);
		return "redirect:/";
	}
	
	//index_admin
	@GetMapping("/admin/index_admin")
	public String indexAdmin(Model model ,HttpSession session) throws SQLException {
		String user = (String)session.getAttribute("member_username");
		String userStatus = (String)session.getAttribute("member_status");
		
		if(user != null && userStatus.equals("A")) { //ถ้า user ไม่มีค่า และ userStatus มีค่าเท่ากับ A 
			ArrayList<Member> memberList = memberDAO.getAllMember();
			model.addAttribute("memberList", memberList);
			
			Member memberProfile = memberDAO.getMember(user);
			model.addAttribute("memberProfile" , memberProfile);
			return "/admin/index_admin";
		}else {
			return "redirect:/pleaseLogin";
		}	
	}
	
	//index_admin_search
	@RequestMapping("/admin/index_admin/search")
	public String search(@RequestParam("key") String key,Model model , HttpSession session) throws SQLException {
		String user = (String)session.getAttribute("member_username");
		String userStatus = (String)session.getAttribute("member_status");
		
		if(user != null && userStatus.equals("A")) {			
			ArrayList<Member> memberList = memberDAO.getAllMemberSearch(key);
			model.addAttribute("memberList", memberList);
			
			Member memberProfile = memberDAO.getMember(user);
			model.addAttribute("memberProfile" , memberProfile);
			return "/admin/index_admin";
		}else {
			return "redirect:/pleaseLogin";
		}	
	}
	
	//edit_member
	@PostMapping("/editMember")
	public String editMember(
			@RequestParam("member_name") String member_name,
			@RequestParam("member_email") String member_email,@RequestParam("member_phone") String member_phone,
			@RequestParam("member_address") String member_address,@RequestParam("member_city") String member_city
			,@RequestParam("member_country") String member_country,@RequestParam("member_zipcode") int member_zipcode
			,HttpSession session, Model model) throws SQLException{
		String user = (String)session.getAttribute("member_username");
		String userStatus = (String)session.getAttribute("member_status");
		if(user != null && userStatus.equals("A")) {			
			Member member = new Member("","", member_name, member_email, member_phone, member_address, member_city, member_country, member_zipcode, "","");
			memberDAO.updateMember(member);
			return "redirect:/admin/index_admin";
		}else {
			return "redirect:/pleaseLogin";
		}	
	}

		//edit_profile
		@PostMapping("/editProfile")
		public String editProfile(@RequestParam("member_password") String member_password,
				@RequestParam("member_name") String member_name,
				@RequestParam("member_email") String member_email,@RequestParam("member_phone") String member_phone,
				@RequestParam("member_address") String member_address,@RequestParam("member_city") String member_city
				,@RequestParam("member_country") String member_country,@RequestParam("member_zipcode") int member_zipcode
				,HttpSession session, Model model) throws SQLException{
			String user = (String)session.getAttribute("member_username");
			String userStatus = (String)session.getAttribute("member_status");
			
			if(user != null && userStatus.equals("A")) {			
		
			Member memberProfile = memberDAO.getMember(user);
				model.addAttribute("memberProfile" , memberProfile);
				
				Member member = new Member("",member_password, member_name, member_email, member_phone, member_address, member_city, member_country, member_zipcode, "","");
				memberDAO.updateMember(member);
				return "redirect:/admin/index_admin";
			}else {
				return "redirect:/pleaseLogin";
			}	
		}
		
		//delete member
		@GetMapping("/deleteMember/{member_username}")
		public String deletePayment(Model model , HttpSession session , @PathVariable("member_username") int member_username) throws SQLException{
			String user = (String)session.getAttribute("member_username");
			String userStatus = (String)session.getAttribute("member_status");
			
			if(user != null && userStatus.equals("A")) {
			memberDAO.deleteMember(user);
			return "redirect:/admin/index_admin";
			
			}else {
				return "redirect:/pleaseLogin";
			}	
		}
		
		//Upload Profile Pic
		@PostMapping("/uploadProfilePic")
		public String uploadProfilePic(HttpSession session,@RequestParam("member_username")String member_username,
				@RequestParam("member_pic") String member_pic,@RequestParam("member_picFile") MultipartFile member_picFile, Model model) throws SQLException {
			
			String user = (String)session.getAttribute("member_username");
			String userStatus = (String)session.getAttribute("member_status");
			
			if(user != null && userStatus.equals("A")) { //ถ้า user ไม่มีค่า และ userStatus มีค่าเท่ากับ A 
			Member member = new Member(member_username, "", "", "", "", "", "", "", 0, "",member_pic);
			memberDAO.uploadProfilePic(member);
			
			String name1 = member.getMember_username();
			if (!member_picFile.isEmpty()) {
				try {
					byte[] bytes = member_picFile.getBytes();
					// Creating the directory to store file
					//String rootPath = System.getProperty("user.dir");
					//File dir = new File(rootPath +File.separator+ "tmpFiles");
					File dir = new File("src/main/resources/static/memberPic");
					if (!dir.exists())
						dir.mkdirs();

					// Create the file on server
					File serverFile = new File(dir.getAbsolutePath()+ File.separator + name1+".jpg");
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					stream.write(bytes);
					stream.close();

					//logger.info("Server File Location="+ serverFile.getAbsolutePath());
					
					//System.out.println(serverFile.getAbsolutePath());
					model.addAttribute("uploadStatus", "You successfully uploaded file= " +name1+"<br>"+serverFile.getAbsolutePath());
					//return "You successfully uploaded file= " + name+"<br>"+serverFile.getAbsolutePath();
				} catch (Exception e) {
					model.addAttribute("uploadStatus","You failed to upload " + name1 + " => " + e.getMessage());
				}
			} else {
				model.addAttribute("uploadStatus", "You failed to upload " + name1 + " because the file was empty.");
			}
			
			return"redirect:/admin/index_admin";
		}
			else {
				return "redirect:/pleaseLogin";
			}	
		}
		
}

