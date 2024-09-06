package nic.sd.model;

import org.hibernate.validator.constraints.NotEmpty;

public class LoginModel {
	private String loginid ;
	public String getLoginid() {
		return loginid;
	}
	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}
	private String password;
	private String captcha;
	private String salt;
	private String roleId;
	private String userName;
	private String aadhaar;
	private String courseName;
	private int countdays;

	
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCaptcha() {
		return captcha;
	}
	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	private String avdmDeviceInfo;
	private String pidOption;
	private String piddata;
	private String txtData;
	private String txtDataRd;
	
	public String getAvdmDeviceInfo() {
		return avdmDeviceInfo;
	}
	public void setAvdmDeviceInfo(String avdmDeviceInfo) {
		this.avdmDeviceInfo = avdmDeviceInfo;
	}
	public String getPidOption() {
		return pidOption;
	}
	public void setPidOption(String pidOption) {
		this.pidOption = pidOption;
	}
	public String getPiddata() {
		return piddata;
	}
	public void setPiddata(String piddata) {
		this.piddata = piddata;
	}
	
	private String rollId;
	public String getRollId() {
		return rollId;
	}
	public void setRollId(String rollId) {
		this.rollId = rollId;
	}
	private String data;
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getTxtData() {
		return txtData;
	}
	public void setTxtData(String txtData) {
		this.txtData = txtData;
	}
	public String getTxtDataRd() {
		return txtDataRd;
	}
	public void setTxtDataRd(String txtDataRd) {
		this.txtDataRd = txtDataRd;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	private String txtRDSInfo;
	private String txtDeviceInfo;
	private String txtPidData;
	
	public String getTxtRDSInfo() {
		return txtRDSInfo;
	}
	public void setTxtRDSInfo(String txtRDSInfo) {
		this.txtRDSInfo = txtRDSInfo;
	}
	public String getTxtDeviceInfo() {
		return txtDeviceInfo;
	}
	public void setTxtDeviceInfo(String txtDeviceInfo) {
		this.txtDeviceInfo = txtDeviceInfo;
	}
	public String getTxtPidData() {
		return txtPidData;
	}
	public void setTxtPidData(String txtPidData) {
		this.txtPidData = txtPidData;
	}
	private String studentName;
	private String instituteCode;
	private String gender;
	private String attendDate;
	private String inTime;
	private String oldPassword;
	private String newPassword;
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public String getCnewPassword() {
		return cnewPassword;
	}
	public void setCnewPassword(String cnewPassword) {
		this.cnewPassword = cnewPassword;
	}
	private String cnewPassword;


	
	private String date;
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getInstituteCode() {
		return instituteCode;
	}
	public void setInstituteCode(String instituteCode) {
		this.instituteCode = instituteCode;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAttendDate() {
		return attendDate;
	}
	public void setAttendDate(String attendDate) {
		this.attendDate = attendDate;
	}
	public String getInTime() {
		return inTime;
	}
	public void setInTime(String inTime) {
		this.inTime = inTime;
	}
	public String getOutTime() {
		return outTime;
	}
	public void setOutTime(String outTime) {
		this.outTime = outTime;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	private String outTime;
	private String mobileNumber;
	private String fathername;
	private String email;
	
/*	@NotEmpty(message = "Please select an date.")
*/	private String dob;
	private String mothername;
	private String academicYear;

	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getInstituteName() {
		return instituteName;
	}
	public void setInstituteName(String instituteName) {
		this.instituteName = instituteName;
	}
	private String instituteName;
	private String semestar;
	
	public String getSemestar() {
		return semestar;
	}
	public void setSemestar(String semestar) {
		this.semestar = semestar;
	}
	public String getFathername() {
		return fathername;
	}
	public void setFathername(String fathername) {
		this.fathername = fathername;
	}
	public String getAadhaar() {
		return aadhaar;
	}
	public void setAadhaar(String aadhaar) {
		this.aadhaar = aadhaar;
	}
	public String getMothername() {
		return mothername;
	}
	public void setMothername(String mothername) {
		this.mothername = mothername;
	}
	public String getAcademicYear() {
		return academicYear;
	}
	public void setAcademicYear(String academicYear) {
		this.academicYear = academicYear;
	}
    private String photo;
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}

	private String agree;
	public String getAgree() {
		return agree;
	}
	public void setAgree(String agree) {
		this.agree = agree;
	}
	
	private String month;
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	private String day1=null,day2=null,day3=null,day4=null,day5=null,day6=null,day7=null,day8=null,day9=null,day10=null,day11=null,day12=null
			,day13=null,day14=null,day15=null,day16=null,day17=null,day18=null,day19=null,day20=null,day21=null,day22=null,day23=null,day24=null
			,day25=null,day26=null,day27=null,day28=null,day29=null,day30=null,day31=null;
	public String getDay1() {
		return day1;
	}
	public void setDay1(String day1) {
		this.day1 = day1;
	}
	public String getDay2() {
		return day2;
	}
	public void setDay2(String day2) {
		this.day2 = day2;
	}
	public String getDay3() {
		return day3;
	}
	public void setDay3(String day3) {
		this.day3 = day3;
	}
	public String getDay4() {
		return day4;
	}
	public void setDay4(String day4) {
		this.day4 = day4;
	}
	public String getDay5() {
		return day5;
	}
	public void setDay5(String day5) {
		this.day5 = day5;
	}
	public String getDay6() {
		return day6;
	}
	public void setDay6(String day6) {
		this.day6 = day6;
	}
	public String getDay7() {
		return day7;
	}
	public void setDay7(String day7) {
		this.day7 = day7;
	}
	public String getDay8() {
		return day8;
	}
	public void setDay8(String day8) {
		this.day8 = day8;
	}
	public String getDay9() {
		return day9;
	}
	public void setDay9(String day9) {
		this.day9 = day9;
	}
	public String getDay10() {
		return day10;
	}
	public void setDay10(String day10) {
		this.day10 = day10;
	}
	public String getDay11() {
		return day11;
	}
	public void setDay11(String day11) {
		this.day11 = day11;
	}
	public String getDay12() {
		return day12;
	}
	public void setDay12(String day12) {
		this.day12 = day12;
	}
	public String getDay13() {
		return day13;
	}
	public void setDay13(String day13) {
		this.day13 = day13;
	}
	public String getDay14() {
		return day14;
	}
	public void setDay14(String day14) {
		this.day14 = day14;
	}
	public String getDay15() {
		return day15;
	}
	public void setDay15(String day15) {
		this.day15 = day15;
	}
	public String getDay16() {
		return day16;
	}
	public void setDay16(String day16) {
		this.day16 = day16;
	}
	public String getDay17() {
		return day17;
	}
	public void setDay17(String day17) {
		this.day17 = day17;
	}
	public String getDay18() {
		return day18;
	}
	public void setDay18(String day18) {
		this.day18 = day18;
	}
	public String getDay19() {
		return day19;
	}
	public void setDay19(String day19) {
		this.day19 = day19;
	}
	public String getDay20() {
		return day20;
	}
	public void setDay20(String day20) {
		this.day20 = day20;
	}
	public String getDay21() {
		return day21;
	}
	public void setDay21(String day21) {
		this.day21 = day21;
	}
	public String getDay22() {
		return day22;
	}
	public void setDay22(String day22) {
		this.day22 = day22;
	}
	public String getDay23() {
		return day23;
	}
	public void setDay23(String day23) {
		this.day23 = day23;
	}
	public String getDay24() {
		return day24;
	}
	public void setDay24(String day24) {
		this.day24 = day24;
	}
	public String getDay25() {
		return day25;
	}
	public void setDay25(String day25) {
		this.day25 = day25;
	}
	public String getDay26() {
		return day26;
	}
	public void setDay26(String day26) {
		this.day26 = day26;
	}
	public String getDay27() {
		return day27;
	}
	public void setDay27(String day27) {
		this.day27 = day27;
	}
	public String getDay28() {
		return day28;
	}
	public void setDay28(String day28) {
		this.day28 = day28;
	}
	public String getDay29() {
		return day29;
	}
	public void setDay29(String day29) {
		this.day29 = day29;
	}
	public String getDay30() {
		return day30;
	}
	public void setDay30(String day30) {
		this.day30 = day30;
	}
	public String getDay31() {
		return day31;
	}
	public void setDay31(String day31) {
		this.day31 = day31;
	}
	@Override
	public String toString() {
		return "LoginModel [loginid=" + loginid + ", password=" + password + ", captcha=" + captcha + ", salt=" + salt
				+ ", roleId=" + roleId + ", userName=" + userName + ", aadhaar=" + aadhaar + ", courseName="
				+ courseName + ", countdays=" + countdays + ", avdmDeviceInfo=" + avdmDeviceInfo + ", pidOption="
				+ pidOption + ", piddata=" + piddata + ", txtData=" + txtData + ", txtDataRd=" + txtDataRd + ", rollId="
				+ rollId + ", data=" + data + ", txtRDSInfo=" + txtRDSInfo + ", txtDeviceInfo=" + txtDeviceInfo
				+ ", txtPidData=" + txtPidData + ", studentName=" + studentName + ", instituteCode=" + instituteCode
				+ ", gender=" + gender + ", attendDate=" + attendDate + ", inTime=" + inTime + ", oldPassword="
				+ oldPassword + ", newPassword=" + newPassword + ", cnewPassword=" + cnewPassword + ", date=" + date
				+ ", outTime=" + outTime + ", mobileNumber=" + mobileNumber + ", fathername=" + fathername + ", email="
				+ email + ", dob=" + dob + ", mothername=" + mothername + ", academicYear=" + academicYear
				+ ", instituteName=" + instituteName + ", semestar=" + semestar + ", photo=" + photo + ", agree="
				+ agree + ", month=" + month + ", day1=" + day1 + ", day2=" + day2 + ", day3=" + day3 + ", day4=" + day4
				+ ", day5=" + day5 + ", day6=" + day6 + ", day7=" + day7 + ", day8=" + day8 + ", day9=" + day9
				+ ", day10=" + day10 + ", day11=" + day11 + ", day12=" + day12 + ", day13=" + day13 + ", day14=" + day14
				+ ", day15=" + day15 + ", day16=" + day16 + ", day17=" + day17 + ", day18=" + day18 + ", day19=" + day19
				+ ", day20=" + day20 + ", day21=" + day21 + ", day22=" + day22 + ", day23=" + day23 + ", day24=" + day24
				+ ", day25=" + day25 + ", day26=" + day26 + ", day27=" + day27 + ", day28=" + day28 + ", day29=" + day29
				+ ", day30=" + day30 + ", day31=" + day31 + ", traineeName=" + traineeName + ", gardianName="
				+ gardianName + ", applicationNo=" + applicationNo + ", itiName=" + itiName + ", trade=" + trade
				+ ", catagory=" + catagory + ", misItiCode=" + misItiCode + "]";
	}
	public String getOldPassword() {
		return oldPassword;
	}
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
	

	/*private String studentName;
	private String studentName;*/
	


	private String traineeName;
	private String gardianName;
	private String applicationNo;
	private String itiName;
	private String trade;
	private String catagory;
	private String misItiCode;

	public String getMisItiCode() {
		return misItiCode;
	}
	public void setMisItiCode(String misItiCode) {
		this.misItiCode = misItiCode;
	}
	public String getTraineeName() {
		return traineeName;
	}
	public void setTraineeName(String traineeName) {
		this.traineeName = traineeName;
	}
	public String getGardianName() {
		return gardianName;
	}
	public void setGardianName(String gardianName) {
		this.gardianName = gardianName;
	}
	public String getApplicationNo() {
		return applicationNo;
	}
	public void setApplicationNo(String applicationNo) {
		this.applicationNo = applicationNo;
	}
	public String getItiName() {
		return itiName;
	}
	public void setItiName(String itiName) {
		this.itiName = itiName;
	}
	public String getTrade() {
		return trade;
	}
	public void setTrade(String trade) {
		this.trade = trade;
	}
	public String getCatagory() {
		return catagory;
	}
	public void setCatagory(String catagory) {
		this.catagory = catagory;
	}
	public int getCountdays() {
		return countdays;
	}
	public void setCountdays(int countdays) {
		this.countdays = countdays;
	}





	

}
