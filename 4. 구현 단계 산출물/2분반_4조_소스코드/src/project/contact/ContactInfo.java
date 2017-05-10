package project.contact;

import project.member.NormalMemberData;

public class ContactInfo extends NormalMemberData{
	private String name;
	private String email;
	private String id;
	private String pw;
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
	public ContactInfo() { }
	public void setName(String name) { this.name = name; }
	public String getName() { return name; }
	public void setEmail(String email) { this.email = email; }
	public String getEmail() { return email; }
}