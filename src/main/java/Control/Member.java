package Control;

public class Member {
	private String member_username;
	private String member_password;
	private String member_name;
	private String member_email;
	private String member_phone;
	private String member_address;
	private String member_city;
	private String member_country;
	private int member_zipcode;
	private String member_status;
	private String member_pic;
	
	
	public Member(String member_username,String member_password ,String member_name  ,String member_email ,String member_phone ,String member_address ,String member_city ,String member_country ,int member_zipcode ,String member_status, String member_pic) {
		this.member_username = member_username;
		this.member_password = member_password;
		this.member_name = member_name;
		this.member_email = member_email;
		this.member_phone = member_phone;
		this.member_address = member_address;
		this.member_city = member_city;
		this.member_country = member_country;
		this.member_zipcode = member_zipcode;
		this.member_status = member_status;
		this.member_pic = member_pic;
	}


	public String getMember_pic() {
		return member_pic;
	}


	public void setMember_pic(String member_pic) {
		this.member_pic = member_pic;
	}


	public String getMember_username() {
		return member_username;
	}


	public void setMember_username(String member_username) {
		this.member_username = member_username;
	}


	public String getMember_password() {
		return member_password;
	}


	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}


	public String getMember_name() {
		return member_name;
	}


	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}


	public String getMember_email() {
		return member_email;
	}


	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}


	public String getMember_phone() {
		return member_phone;
	}


	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}


	public String getMember_address() {
		return member_address;
	}


	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}


	public String getMember_city() {
		return member_city;
	}


	public void setMember_city(String member_city) {
		this.member_city = member_city;
	}


	public String getMember_country() {
		return member_country;
	}


	public void setMember_country(String member_country) {
		this.member_country = member_country;
	}


	public int getMember_zipcode() {
		return member_zipcode;
	}


	public void setMember_zipcode(int member_zipcode) {
		this.member_zipcode = member_zipcode;
	}


	public String getMember_status() {
		return member_status;
	}


	public void setMember_status(String member_status) {
		this.member_status = member_status;
	}
	
	
}
