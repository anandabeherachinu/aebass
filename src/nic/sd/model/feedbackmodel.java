package nic.sd.model;

public class feedbackmodel {

	
	private String name ;
	private String email ;
	private String subject ;
	private String comment ;
	@Override
	public String toString() {
		return "feedbackmodel [name=" + name + ", email=" + email + ", subject=" + subject + ", comment=" + comment
				+ ", getName()=" + getName() + ", getEmail()=" + getEmail() + ", getSubject()=" + getSubject()
				+ ", getComment()=" + getComment() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
}
