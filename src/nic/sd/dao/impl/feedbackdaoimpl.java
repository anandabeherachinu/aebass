package nic.sd.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import nic.sd.dao.LoginDao;
import nic.sd.dao.feedbackdao;
import nic.sd.model.feedbackmodel;
import nic.sd.utility.ConnectionDB;

@Repository
public class feedbackdaoimpl implements feedbackdao {
	
	@Autowired
	JdbcTemplate jt;
	
	
	ConnectionDB con =new ConnectionDB();
	
	@Override
	public int insertFeedback(feedbackmodel fd) {
		String qry = "INSERT INTO aa_feedback(name, email, subject,comment) VALUES (?, ?, ?,?)";
		int feedback = jt.update(qry,new Object[] {fd.getName(),fd.getEmail(),fd.getSubject(),fd.getComment()});
		
		return feedback;
	}


}
