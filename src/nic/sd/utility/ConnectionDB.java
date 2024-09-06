package nic.sd.utility;

import java.sql.Connection;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;




public class ConnectionDB {
	
	
	 public JdbcTemplate  getConnection()
	 
	 {
		 
	//local
		System.out.println("fdgfhj"); 
	DriverManagerDataSource dataSource = new DriverManagerDataSource();
    dataSource.setDriverClassName("org.postgresql.Driver");
    dataSource.setUrl("jdbc:postgresql://localhost:5432/aadharauthentication");
    dataSource.setUsername("postgres");
    dataSource.setPassword("ananda123");
     JdbcTemplate template = new JdbcTemplate(dataSource);
     
     
     
   //live
		 
/*     DriverManagerDataSource dataSource = new DriverManagerDataSource();
     dataSource.setDriverClassName("org.postgresql.Driver");
     dataSource.setUrl("jdbc:postgresql://10.150.150.64:5444/aebatdnce");
     dataSource.setUsername("uaebatdnce");
     dataSource.setPassword("B3cms0YhuIjeg8B6N9Hwv91");
      JdbcTemplate template = new JdbcTemplate(dataSource);
     System.out.println("inside connection:");*/
     
	return template;
     
	}
	 
	 
	  @SuppressWarnings("unused")
		public static Connection getConnection1() {
			Context context = null;
			//DataSource dataSource = null;
			DriverManagerDataSource dataSource = new DriverManagerDataSource();
			Connection conn = null;
			 ConnectionDB db=null;
			 int i=0;
			 try{
				 i++;
				 	if(db==null) 
					{	
						db=new ConnectionDB();
					}
				 context = new InitialContext();
			      if(context == null ) 
			          throw new Exception("Boom - No Context");
			      dataSource = (DriverManagerDataSource)context.lookup("java:comp/env/jdbc/ds1");
			      if(dataSource == null)
			    	  throw new Exception("No data source found..");
			      if (dataSource != null) {
			    	  //System.out.println("connection successfull frMission");
			     return dataSource.getConnection();
			      }
			     else {
			            System.out.println("Connection status : " + conn.toString());
			        }
			      
			    }catch(Exception e) {
			      e.printStackTrace();
			    }
			return conn; 
	    }

}
