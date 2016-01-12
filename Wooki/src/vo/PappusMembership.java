package vo;

public class PappusMembership {

	private String id;
	private String pw;
	private String name;
	private String gender;
	private int year;
	private int month;
	private int day;
	private String email;
	private String phoneNum;

	public PappusMembership() {
		name = "¾Æ¹«°³";
	}

	public PappusMembership(String id, String pw, String name, String gender, int year, int month, int day,
			String email, String phoneNum) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.gender = gender;
		this.year = year;
		this.month = month;
		this.day = day;
		this.email = email;
		this.phoneNum = phoneNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
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

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
}
