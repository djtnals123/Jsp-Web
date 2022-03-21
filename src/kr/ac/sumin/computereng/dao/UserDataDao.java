package kr.ac.sumin.computereng.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import kr.ac.sumin.computereng.dto.Criteria;
import kr.ac.sumin.computereng.dto.UserDatatype;
import kr.ac.sumin.webprograming.Connector;

public class UserDataDao {

	private boolean invalidID = false;
	private boolean incorrectPW = false;
	private boolean duplicateID = false;
	private boolean nullID = false;
	private boolean agree = false;
	private boolean admin = false;
	
	public UserDatatype loginCheck(String id, String pw) {
		UserDatatype user = null;
		if(id == null) {
			nullID = true;
			return null;
		} else {
			try {
				Connection conn = Connector.getConnection();
				Statement stat = conn.createStatement();
				String sql = "SELECT USER_ID, PASS, EMAIL, NAME, HOSPITAL, ROLE "
						+"FROM USER "
						+"WHERE USER_ID='"+id+"'";
				
				ResultSet result = stat.executeQuery(sql);
				
				while(result.next()) {
					invalidID = true;
					if(pw.equals(result.getString(2))) {
						if(result.getString(6).contains("1")) admin = true;
						incorrectPW = true;
						user = new UserDatatype(
								result.getString(1),
								result.getString(2),
								result.getString(3),
								result.getString(4),
								result.getString(5),
								result.getString(6).split(","),
								null
							);
					}
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return user;
	}
	
	public int count(Criteria criteria) {
		try {
			Connection conn = Connector.getConnection();
			Statement stat = conn.createStatement();
			String sql = "SELECT count(*) "
						+"FROM USER ";
			ResultSet result = stat.executeQuery(sql);
			result.next();
			return result.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public void join(String id, String pw, String email, String name, String hospital, String[] roles) {
		String roleStr = arrayJoin(roles);
		try {
			Connection conn = Connector.getConnection();
			Statement stat = conn.createStatement();

			agree = true;
			String sql = "INSERT INTO USER "
						+"(USER_ID, PASS, EMAIL, NAME, HOSPITAL, ROLE, DATE) "
						+"VALUES "
						+"('"+id+"','"+pw+"','"+email+"','"+name+"','"+hospital+"','"+roleStr+"','"+getFormatDate(new Date())+"')";
			stat.executeUpdate(sql);
			
		} catch (com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException e) {
			duplicateID = true;
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void update(UserDatatype user) {
		String roleStr = arrayJoin(user.getRoles());
		try {
			Connection conn = Connector.getConnection();
			Statement stat = conn.createStatement();
			String sql = "UPDATE USER SET "
					+"PASS='"+user.getPass()+"',"
					+"EMAIL='"+user.getEmail()+"',"
					+"NAME='"+user.getName()+"',"
					+"HOSPITAL='"+user.getHospital()+"',"
					+"ROLE='"+roleStr+"' "
					+"WHERE USER_ID='"+user.getId()+"'";
			stat.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<UserDatatype> list(Criteria criteria) {
		List<UserDatatype> user = new ArrayList<UserDatatype>();
		try {
			Connection conn = Connector.getConnection();
			Statement stat = conn.createStatement();
			String sql = "SELECT USER_ID, PASS, EMAIL, NAME, HOSPITAL, ROLE, DATE "
					+"FROM USER "
					+"ORDER BY DATE DESC LIMIT "+(criteria.getPage()-1)*criteria.getPerPage()+", "+criteria.getPerPage();
			ResultSet result = stat.executeQuery(sql);
			while(result.next()) {
				user.add(new UserDatatype(
						result.getString(1),
						result.getString(2),
						result.getString(3),
						result.getString(4),
						result.getString(5),
						result.getString(6).split(","),
						result.getDate(7)
						));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	private String arrayJoin(String[] roles) {
		String roleStr = "";
		if(roles != null) {
			int idx = 0;
			for(String role : roles) {
				if(++idx < roles.length) {
					roleStr += role+",";
				} else {
					roleStr += role;
				}
			}
		}
		return roleStr;
	}
	
	private String getFormatDate(Date date) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM-dd");
		return simpleDateFormat.format(date);
	}
	
	public boolean isInvalidID() { return invalidID; }	
	public boolean isIncorrectPW() { return incorrectPW; }
	public boolean isDuplicateID() { return duplicateID; }	
	public boolean isNullID() { return nullID; }	
	public boolean isAdmin() { return admin; }	
	public boolean isAgree() { return agree; }	
}
