package nic.sd.dao;

import java.util.Date;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

import nic.sd.model.LoginModel;

public interface LoginDao {

	String getAadhar(String rollId);

	String callUIDI(String rdInfo, String pidBlockData, String aadhar);

	String getauthresponse(String authRequestData);

	String getUserName(String loginid);

	int checkLoginAdmin(LoginModel lg);

	String retriverole(String loginid);

	boolean loginquery(LoginModel lg);

	String getRoleidd(String loginid);

	String getUserName(String userID, String roleID);

	String logintime();

	int getPasswordChangedStatus(String loginid);

	

	String candAttendanceMainRD(String regNo, Date in_time) throws JSONException;

	List<LoginModel> successdata(String regNo, String itime);

	List<LoginModel> getAllInstituteList();

	List<LoginModel> getSemesterList();

	List<LoginModel> viewData(String selectedInstitute, String selectedSemester);

	String callUIDIA(String deviceInfo, String rdData, String aadhar);

	String insertData(JSONObject jo);

	List<LoginModel> getStudentData(JSONObject re);

	int savetxnDetails(JSONObject re) throws JSONException;

	String checkRegNo(String regNo);

	List<LoginModel> getStudentData(String regNo);

	/*int savetxnDetails(String studentName, String email, String semester, String regNo, String gender, String fatherName,
			String motherName, String mobile, String instituteCode, String academicYear, String dob,
			String instituteName) throws JSONException;*/

	int savetxnDetailss(LoginModel lg, String studentName, String email, String semester, String regNo, String gender,
			String fatherName, String motherName, String mobile, String instituteCode, String academicYear, String dob,
			String instituteName, long referenceNo, String studentPhoto,String ipFromHeader, String courseName);

	String getreferenceNo(String regNo);
	List<LoginModel> sucessview(String regNo, Date in_time);

	List<LoginModel> sucessview(String regNo, String in_time);

	LoginModel viewDeptBatchDetails(String regNo, Date in_time);

	String logouttime();

	String checkInstituteAndStudent(String regNo);

	List<LoginModel> getMonthList();

	List<LoginModel> viewDataSemesterwise(String selectedInstitute, String selectedSemester, String selectedMonth);

	List<LoginModel> getCandidateHostelAtten(String selectedInstitute, String selectedSemester, String selectedMonth);


	List<LoginModel> getCountTheStudentCollegeWisePresent(String attendate);

	List<LoginModel> getCountTheStudentCollegeWiseabsent(String attendate);

	List<LoginModel> getTotalCountTheStudentPresent(String attendate);

	List<LoginModel> getTotalCountTheStudentabsent(String attendate);

	List<LoginModel> getCountTheStudentCollegeWiseAbsentPresent(String attendate);

	List<LoginModel> getCountTheStudentCollegeWiseAbsentAbsent(String attendate);

	List<LoginModel> getAllstudentList();

	LoginModel getAllStudent();

	LoginModel getAllCollege();

	List<LoginModel> getAllCollegeList();
	LoginModel getTotalCountTheStudentPresentd(String attendate);

	List<LoginModel> getAllPresentstudentList(String attendate);

	//int checkLoginAdmine(LoginModel lg);

	int checkLoginAdmin(String loginid, LoginModel lg);

	List<LoginModel> getCollegeWisesStudentList(String loginid);

	LoginModel getcollegewiseStudent(String loginid);

	LoginModel getTotalCountTheStudentPresentcollegewise(String loginid, String attendate);

	List<LoginModel> getAllPresentstudentListCollegeWise(String loginid, String attendate);


	int insertCollegeDetails(String instituteCode, String principalName, String instituteType, String instituteName);

	List<LoginModel> getTotalCountTheStudentPercentage(String attendate);

	int insertCourseDetails(String instituteCode, String principalName, String instituteType, String instituteName,
			String courseCode, String courseName);

	List<LoginModel> getBranchList();

	List<LoginModel> getCandidateHostel(String selectedInstitute, String selectedSemester, String selectedMonth,
			String course);

	List<LoginModel> getCandidateHostelAttend(String instituteCode,String selectedSemester, String selectedMonth );

	List<LoginModel> getInstituteList(String loginid);

	List<LoginModel> getCandidatebranch(String instituteCode, String selectedSemester, String selectedMonth,
			String course);

	List<LoginModel> getAllInstituteListt(String loginid);

	String getuserid(String loginid);

	List<LoginModel> getAllRole();

	String featchcollegecode(String loginid);

	List<LoginModel> getInstitute(String collegecode);

	List<LoginModel> getRegisteredStudent(String collegecode);

	List<LoginModel> getAllPresentstudentListCollegeWise1(String loginid, String attendate);

	List<LoginModel> getAllCollegeadmin();

	List<LoginModel> viewData1(String selectedInstitute, String selectedSemester, String date);

	List<LoginModel> viewData2(String collegecode, String selectedSemester, String selectedbranch, String date);

	int insertlogin(String selectedinstitute, String selectedmonth, String selectedpassword, String selectedusename);

	int checkPreviousPassword(LoginModel admin);

	String isMatchingNewAndConfirmPwd(LoginModel admin);

	int checkconfirmandoldpass(LoginModel admin);

	int adminUpdateChangePassword(LoginModel admin, String password);

	int getauditlogs(String loginid, String ip, String attendate, String action, String status);

	String checkRegNoIti(String regNo);

	List<LoginModel> checkRegNoItistudent(String regnoITI);

	int savetxnDetailIti(LoginModel lg, String studentName, String regNo, String fatherName, String dob,
			String instituteName, String trade, String category,String misiticode ,long referenceNo, String ip);

	String checkRegNoItiregisterornot(String regnoITI);

	List<LoginModel> getCountTheStudentCollegeWisePresentGovtpolyBar(String attendate);

	List<LoginModel> getCountTheStudentCollegeWisePresentITI(String attendate);

	List<LoginModel> getCountTheStudentCollegeWisepolypiebar(String attendate);

	List<LoginModel> getCountTheStudentCollegeWiseITIpiebar(String attendate);

	List<LoginModel> getcollegetype();

	List<LoginModel> getAllCollegeadmin(String selectedInstitutetype);

	List<LoginModel> getsemesterAjax(String institutecode);

	List<LoginModel> getAllCollegeListiti();

	List<LoginModel> viewDataITIPresent(String selectedInstitute, String date);

	List<LoginModel> getSemesterListt(String collegecode);

	List<LoginModel> getBranchListt(String collegecode);

	List<LoginModel> viewData3(String collegecode, String selectedbranch, String date);

	List<LoginModel> getAllstudentListcollegeTypewise(String instituteType);

	List<LoginModel> getTotalCountTheStudentPOLY(String attendate);

	List<LoginModel> getTotalCountTheStudentITI(String attendate);

	List<LoginModel> getCountTheStudentCollegeWiseGovtpolyBardivided1(String attendate);

	List<LoginModel> getCountTheStudentCollegeWiseGovtpolyBardivided2(String attendate);

	List<LoginModel> getCountTheStudentCollegeWiseITIBardivided1(String attendate);


	List<LoginModel> getCountTheStudentCollegeWiseITIBardivided2(String attendate);

	List<LoginModel> getCountTheStudentCollegeWiseITIBardivided3(String attendate);

	List<LoginModel> getCountTheStudentCollegeWiseITIBardivided4(String attendate);

	List<LoginModel> getBranchListitireport(String collegecode);

	List<LoginModel> getMonthListitireport(String collegecode);

	List<LoginModel> getCandidatebranchITI(String collegecode, String selectedMonth, String course);

	List<LoginModel> getbranchAjax(String institutecode);

	List<LoginModel> getmonthAjax(String institutecode,String branch);

	List<LoginModel> viewDatacoursewiseadminITI(String selectedInstitute, String selectedcourse, String selectedMonth);

	List<LoginModel> getTotalCountTheStudent(String attendate);

	List<LoginModel> getAllCollegeadminstudent(String selectedInstitutetype);

	List<LoginModel> getTotalCountTheStudentinstitutewise(String attendate, String collegecode);

	List<LoginModel> getTotalCountTheStudentcollegebarchart(String attendate, String collegecode);

	List<LoginModel> getcollegelistcountsemesterwise(String institutecode);

	List<LoginModel> getstudentlistcountsemesterwise(String instituteCode, String semester);

	String featchinstitutetype(String institutecode);

	List<LoginModel> getcollegelistcountbranchwise(String institutecode);

	List<LoginModel> getstudentlistcountbranchwise(String instituteCode, String courseName);

	List<LoginModel> getcollegestudentlistcountbranchwise(String collegecode);

	String getcollegeType(String regNo);

	String candAttendanceMainRD(String regNo, Date in_time, String instituteCode, String semester, String courseName) throws JSONException;









}
