package kr.ac.sumin.computereng.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import kr.ac.sumin.computereng.dto.AttachFile;
import kr.ac.sumin.computereng.dto.BoardVO;
import kr.ac.sumin.computereng.dto.Criteria;
import kr.ac.sumin.webprograming.Connector;

public class BoardDao {
	private int no=-1;
	
	public BoardVO read(int no) {
		BoardVO board = null;
		try {
			Connection conn = Connector.getConnection();
			Statement stat = conn.createStatement();
			String sql = "SELECT NO, TITLE, WRITER, CONTENTS, CREATE_DATE, ATTACH_FILE "
					+"FROM BOARD "
					+"WHERE NO="+no;
			ResultSet result = stat.executeQuery(sql);
			result.next();
			
			board = new BoardVO(
					result.getInt(1),
					result.getString(2),
					result.getString(3),
					result.getString(4),
					result.getDate(5),
					null
				);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return board;
	}
	
	public int count(Criteria criteria) {
		try {
			Connection conn = Connector.getConnection();
			Statement stat = conn.createStatement();
			String sql = "SELECT count(*) "
					+"FROM BOARD "
					+makeWhereSql(criteria);
			ResultSet result = stat.executeQuery(sql);
			result.next();
			return result.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public AttachFile getAttachFile(int no) {
		AttachFile attachFile = null;
		try {
			Connection conn = Connector.getConnection();
			Statement stat = conn.createStatement();
			String sql = "SELECT NEW_NAME, OLD_NAME "
					+ "FROM ATTACHFILE "
					+ "WHERE NO="+no;
			ResultSet result = stat.executeQuery(sql);
			result.next();
			attachFile = new AttachFile(null, result.getString(2), result.getString(1));
		}catch (Exception e) {
			// TODO: handle exception
		}
		return attachFile;
		
	}
	
	public void write(String title, String writer, String contents, Date createDate, AttachFile attachFile) {
		try {
			Connection conn = Connector.getConnection();
			Statement stat = conn.createStatement();
			this.no=getLastNo();
			String sql = "INSERT BOARD "
					+"VALUES ("
					+this.no+", "
					+"'"+title+"', "
					+"'"+writer+"', "
					+"'"+contents+"', "
					+"'"+getFormatDate(new Date())+"', "
					+"'"+attachFile+"')";
			stat.executeUpdate(sql);
			System.out.println(attachFile);
			System.out.println(attachFile);
			System.out.println(attachFile);
			if(attachFile != null) {
				sql = "INSERT ATTACHFILE "
						+"VALUES ("
						+"'"+attachFile.getSaveFileName()+"', "
						+"'"+attachFile.getOriginalFileName()+"', "
						+"'"+ getFormatDate(new Date()) + "', "
						+"'"+ no + "')";
				stat.executeUpdate(sql);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	
	public void update(int no, String title, String contents, AttachFile attachFile) {
		try {
			Connection conn = Connector.getConnection();
			Statement stat = conn.createStatement();
			String sql = "UPDATE BOARD SET "
					+"TITLE='"+title+"',"
					+"CONTENTS='"+contents+"', "
					+"ATTACH_FILE='"+attachFile+"'"
					+"WHERE NO="+no;
			stat.executeUpdate(sql);
			
			if(attachFile != null) {			
				sql = "DELETE FROM ATTACHFILE "
					 +"WHERE NO="+no;
				stat.executeUpdate(sql);
				
				sql = "INSERT ATTACHFILE "
						+"VALUES ("
						+"'"+attachFile.getSaveFileName()+"', "
						+"'"+attachFile.getOriginalFileName()+"', "
						+"'"+ getFormatDate(new Date()) + "', "
						+"'"+ no + "')";
				stat.executeUpdate(sql);
				
				
				sql = "UPDATE ATTACHFILE SET "
						+"NEW_NAME='"+attachFile.getSaveFileName()+"', "
						+"OLD_NAME='"+attachFile.getOriginalFileName()+"' "
						+"WHERE NO="+no;
				stat.executeUpdate(sql);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delete(int no) {
		try {
			Connection conn = Connector.getConnection();
			Statement stat = conn.createStatement();
			String sql = "DELETE FROM BOARD "
					+"WHERE NO="+no;
			stat.executeUpdate(sql);
			
			sql = "DELETE FROM ATTACHFILE "
					+"WHERE NO="+no;
			stat.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<BoardVO> list(Criteria criteria) {
		List<BoardVO> board = new ArrayList<BoardVO>();
		try {
			Connection conn = Connector.getConnection();
			Statement stat = conn.createStatement();
			
			String sql = "SELECT NO, TITLE, WRITER, CONTENTS, CREATE_DATE, ATTACH_FILE "
					+"FROM BOARD "
					+ makeWhereSql(criteria)
					+"ORDER BY NO DESC LIMIT "+(criteria.getPage()-1)*criteria.getPerPage()+", "+criteria.getPerPage();
			ResultSet result = stat.executeQuery(sql);
			while(result.next()) {
				board.add(new BoardVO(
						result.getInt(1),
						result.getString(2),
						result.getString(3),
						result.getString(4),
						result.getDate(5),
						null
						));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return board;
	}
	
	public int getNo() {
		return no;
	}
	

	static public int getLastNo() {
		int n=-1;
		try {
			Connection conn = Connector.getConnection();
			Statement stat = conn.createStatement();
			ResultSet no = stat.executeQuery("SELECT IFNULL(MAX(NO), 0)+1 FROM BOARD");
			no.next();
			n=no.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return n;
	}

	private String getFormatDate(Date date) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM-dd");
		return simpleDateFormat.format(date);
	}
	
	private String makeWhereSql(Criteria criteria) {
		String where="";
		if(criteria.getOption() != null && criteria.getKeyword() != null) {
			if(criteria.getOption().equals("1")) {
				where = "WHERE TITLE LIKE '%"+criteria.getKeyword()+"%' ";
			} else if(criteria.getOption().equals("2")) {
				where = "WHERE CONTENTS LIKE '%"+criteria.getKeyword()+"%' ";
			} else if(criteria.getOption().equals("3")) {
				where = "WHERE TITLE LIKE '%"+criteria.getKeyword()+"%' "
						+" || "
						+"CONTENTS LIKE '%"+criteria.getKeyword()+"%' ";	
			} else if(criteria.getOption().equals("4")) {
				where = "WHERE WRITER LIKE '%"+criteria.getKeyword()+"%' ";
			}
		}
		return where;
	}
}
