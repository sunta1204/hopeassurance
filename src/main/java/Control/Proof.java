package Control;

public class Proof {
	private int payment_id ;
	private String payment_cartype ;
	private String payment_plate;
	private String payment_username;
	private String payment_name ;
	private String payment_email ;
	private String payment_phone ;
	private String payment_address ;
	private String payment_city ;
	private String payment_country ;
	private int payment_zipcode ;
	private String payment_picName ;
	private String payment_proof;
	private String payment_status ;
	private String transport_status ;


	
	public Proof(int payment_id, String payment_cartype,String payment_plate,String payment_username ,String payment_name ,String payment_email , String payment_phone ,
				String payment_address ,String payment_city ,String payment_country ,int payment_zipcode ,
				String payment_picName,String payment_proof,String payment_status,String transport_status ) {
		
		this.payment_id = payment_id;
		this.payment_cartype = payment_cartype;
		this.payment_plate = payment_plate;
		this.payment_username = payment_username;
		this.payment_name =payment_name;
		this.payment_email = payment_email;
		this.payment_phone = payment_phone;
		this.payment_address = payment_address;
		this.payment_city = payment_city;
		this.payment_country = payment_country;
		this.payment_zipcode = payment_zipcode;
		this.payment_picName = payment_picName;
		this.payment_proof = payment_proof;
		this.payment_status = payment_status;
		this.transport_status = transport_status;
	}



	public String getPayment_plate() {
		return payment_plate;
	}



	public void setPayment_plate(String payment_plate) {
		this.payment_plate = payment_plate;
	}



	public String getPayment_proof() {
		return payment_proof;
	}



	public void setPayment_proof(String payment_proof) {
		this.payment_proof = payment_proof;
	}



	public String getPayment_username() {
		return payment_username;
	}



	public void setPayment_username(String payment_username) {
		this.payment_username = payment_username;
	}



	public String getTransport_status() {
		return transport_status;
	}



	public void setTransport_status(String transport_status) {
		this.transport_status = transport_status;
	}



	public int getPayment_id() {
		return payment_id;
	}



	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}



	public String getPayment_cartype() {
		return payment_cartype;
	}



	public void setPayment_cartype(String payment_cartype) {
		this.payment_cartype = payment_cartype;
	}



	public String getPayment_name() {
		return payment_name;
	}



	public void setPayment_name(String payment_name) {
		this.payment_name = payment_name;
	}



	public String getPayment_email() {
		return payment_email;
	}



	public void setPayment_email(String payment_email) {
		this.payment_email = payment_email;
	}



	public String getPayment_phone() {
		return payment_phone;
	}



	public void setPayment_phone(String payment_phone) {
		this.payment_phone = payment_phone;
	}



	public String getPayment_address() {
		return payment_address;
	}



	public void setPayment_address(String payment_address) {
		this.payment_address = payment_address;
	}



	public String getPayment_city() {
		return payment_city;
	}



	public void setPayment_city(String payment_city) {
		this.payment_city = payment_city;
	}



	public String getPayment_country() {
		return payment_country;
	}



	public void setPayment_country(String payment_country) {
		this.payment_country = payment_country;
	}



	public int getPayment_zipcode() {
		return payment_zipcode;
	}



	public void setPayment_zipcode(int payment_zipcode) {
		this.payment_zipcode = payment_zipcode;
	}



	public String getPayment_picName() {
		return payment_picName;
	}



	public void setPayment_picName(String payment_picName) {
		this.payment_picName = payment_picName;
	}



	public String getPayment_status() {
		return payment_status;
	}



	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}
	
	
}
