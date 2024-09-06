package nic.sd.model;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class reportmodel {
	
	
	@NotEmpty(message = "Institute code cannot be blank")
    @Size(max = 50, message = "Institute code should not exceed 50 characters")
    @Pattern(regexp = "^[a-zA-Z0-9\\s]*$", message = "Institute code must not contain any special characters")
private String instituteCode;
	
	
	@NotEmpty(message = "semestar cannot be blank")
    @Size(max = 50, message = "semestar should not exceed 50 characters")
    @Pattern(regexp = "^[0-9\\s]*$", message = "semestarmust not contain any special characters")
	private String semestar;
	
	
	private String dob;
	
	@NotEmpty(message = "branch cannot be blank")
    @Size(max = 50, message = "branch should not exceed 50 characters")
    @Pattern(regexp = "^[a-zA-Z\\s]*$", message = "branch not contain any special characters")
	private String branch;
	
	
	@NotEmpty(message = "month cannot be blank")
    @Size(max = 50, message = "month should not exceed 50 characters")
	private String month;
	


	
	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	@NotEmpty(message = "course cannot be blank")
    @Size(max = 50, message = "course should not exceed 50 characters")
    @Pattern(regexp = "^[a-zA-Z\\s]*$", message = "course not contain any special characters")
	private String courseName;
	



	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getInstituteCode() {
		return instituteCode;
	}

	public void setInstituteCode(String instituteCode) {
		this.instituteCode = instituteCode;
	}

	public String getSemestar() {
		return semestar;
	}

	public void setSemestar(String semestar) {
		this.semestar = semestar;
	}

	@Override
	public String toString() {
		return "reportmodel [instituteCode=" + instituteCode + ", semestar=" + semestar + ", dob=" + dob + ", branch="
				+ branch + ", month=" + month + ", courseName=" + courseName + "]";
	}


}
