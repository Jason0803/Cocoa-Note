package dao.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import jdbc.exception.DuplicateIdException;
import jdbc.exception.RecordNotFoundException;
import model.MemberVO;
import sql.StringQuery;
import vo.member.Member;



public class MemberDAO {
	// ---------------------------- Sigleton  ----------------------------- //
	private static MemberDAO dao = new MemberDAO();
	private DataSource ds;
	
	private MemberDAO() {
		try {
			InitialContext ic = new InitialContext();
			ds = (DataSource)ic.lookup("java:comp/env/jdbc/oracleDB");
			System.out.println("DataSource..LookUp Success !");
			
		} catch (NamingException e) {
			System.out.println("DataSource..LookUp Fail :( ");
			e.printStackTrace();
		}
	}
	public static MemberDAO getInstance() {
		return dao;
	}
	
	// ---------------------------------- for connection ----------------------------------//
	public Connection connection() {
		Connection conn = null;
		try {
			conn = ds.getConnection();
			System.out.println("Hello, DB Connected w/ DataSource ");
		} catch (SQLException e) {
			System.out.println("DB Disconnected !");
		}
	
		return conn;
	}
	// ---------------------------------- for close ----------------------------------//
	public void closeAll(PreparedStatement ps, Connection conn) throws SQLException {
		ps.close();
		conn.close();
	}
	public void closeAll(PreparedStatement ps, Connection conn, ResultSet rs) throws SQLException {
		rs.close();
		closeAll(ps, conn);
	}
	
	// ---------------------------------- for INSERT ---------------------------------- //
	public void registerMember(Member member) throws SQLException, DuplicateIdException {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = connection();
				
			if( !doesExist(member.getName(), conn) ){
				conn = connection();
				System.out.println("connection");
						
				ps = conn.prepareStatement(StringQuery.REGISTER_MEMBER);
				//System.out.println("ps");
				ps.setString(1, member.getName());
				// ps.setInt(2, member.getUserClass());
				ps.setString(3, member.getPassword());
						
				int row = ps.executeUpdate();
				System.out.println("Sucess ? :" + row);
			} else  {
				throw new DuplicateIdException("Already Existing ID !");
			}
		} finally {
					
			System.out.println("Adding student done");
			try{
				closeAll(ps, conn);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}		
	}
			
	// ---------------------------------- for Search ---------------------------------- //
	public boolean doesExist(String id, Connection conn) throws SQLException {
		PreparedStatement ps = 
				conn.prepareStatement(StringQuery.ISEXIST_MEMBER);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();

		return rs.next();
	}
	// ---------------------------------- for Update ---------------------------------- //
	public boolean updateUser(Student student) throws RecordNotFoundException {
		boolean result = false;
		Connection conn = null;
		
		conn = connection();
		try {
			if(doesExist(student.getName(), conn)) {
				PreparedStatement ps = 
						conn.prepareStatement("UPDATE student"
								+ " SET sid = ?, classno = ?, password = ?"
								+ " WHERE sid = ?");
		
				ps.setString(1, student.getName());
				ps.setInt(2, student.getUserClass());
				ps.setString(3, student.getPassword());
				ps.setString(4, student.getName());
					
				ps.executeUpdate();
				System.out.println("[DAO - UPDATE] User Information Updated !!");
				result = true;
				closeAll(ps, conn);
				System.out.println("[DAO - UPDATE] PS & RS Successfully closed !");
				return result;
			} else throw new RecordNotFoundException("[DAO - UPDATE] WARNING : No Such User Found !");
		} catch (SQLException e) {
			System.out.println("[DAO - UPDATE] WARNING : SQLException !");
			e.printStackTrace();

		} 
		return result;
	}
	
	// ---------------------------------- for Login ---------------------------------- //
	
	public Member login(String id, String password) throws SQLException{
		Member member = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		conn = connection();
		
		try {
		
			
		}finally {
			
		}
		
		
		
	}
	
	
	
	
}
