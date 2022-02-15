package examination;

public class UserInfo {
	private String code;
	private String name;
	private String date;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public UserInfo(String code, String name, String date) {
		super();
		this.code = code;
		this.name = name;
		this.date = date;
	}
	
}
