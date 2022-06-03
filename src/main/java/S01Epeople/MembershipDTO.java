package S01Epeople;

public class MembershipDTO {
	
	// 멤버 변수 ( membership Table )
	private String serial_num;
	private String id;
	private String password;
	private String name;
	private String gender;
	private String birthday;
	private String zipcode;
	private String address;
	private String email_address;
	private String mobile_number;
	private String phone_number;
	private String regidate;
	
	public MembershipDTO() {
		super();
	}
	// constructor
	public MembershipDTO(String id, String password, String name, String gender, String birthday,
			String zipcode, String address, String email_address, String mobile_number, String phone_number) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.zipcode = zipcode;
		this.address = address;
		this.email_address = email_address;
		this.mobile_number = mobile_number;
		this.phone_number = phone_number;
	}
	// getter() / setter()	
	public String getSerial_num() {
		return serial_num;
	}
	public void setSerial_num(String serial_num) {
		this.serial_num = serial_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail_address() {
		return email_address;
	}
	public void setEmail_address(String email_address) {
		this.email_address = email_address;
	}
	public String getMobile_number() {
		return mobile_number;
	}
	public void setMobile_number(String mobile_number) {
		this.mobile_number = mobile_number;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getRegidate() {
		return regidate;
	}
	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}
	
	
}
