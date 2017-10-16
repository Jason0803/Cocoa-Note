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
	public Member registerMember(Member member) throws SQLException, DuplicateIdException {
		Connection conn = null;
		PreparedStatement ps = null;
		Member returnMember = member;
		
		try {
			conn = connection();
				
			if( !doesExist(member.getId(), conn) ){
				conn = connection();
				System.out.println("connection");
						
				ps = conn.prepareStatement(StringQuery.REGISTER_MEMBER);
				System.out.println("[MemberDAO]@registerMember Executed !");
				
				ps.setString(1, member.getId());
				ps.setString(2, member.getPassword());
				ps.setString(3, member.getName());
				ps.setInt(4, member.getAccountPlan());
				ps.setInt(5, member.getTheme());
				
				int row = ps.executeUpdate();
				System.out.println("[MemberDAO]@registerMember : Sucess ? :" + row);
			} else  {
				throw new DuplicateIdException("Already Existing ID !");
			}
		} finally {
			System.out.println("[MemberDAO]@registerMember : Adding member done");
			try{
				closeAll(ps, conn);
			} catch(SQLException e) {
				System.out.println("[MemberDAO]@registerMember : SQLException Catched !");
				e.printStackTrace();
			}
		}
		returnMember.setPassword(null);
		
		return returnMember;
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

	public Member updateMember(Member member) throws SQLException {

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		conn = connection();
		
		try {
			ps = conn.prepareStatement(StringQuery.UPDATE_MEMBER);
			ps.setString(1, member.getId());
			ps.setString(2, member.getPassword());
			ps.setString(3, member.getName());
			ps.setInt(4, member.getAccountPlan());
			ps.setInt(5, member.getTheme());
			
			int result = ps.executeUpdate();
			System.out.println(result + "update OK!");
			
		}finally {
			System.out.println("[MemberDAO]@updateMember : updating member done");
			closeAll(ps, conn, rs);
		}
		return member;
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
