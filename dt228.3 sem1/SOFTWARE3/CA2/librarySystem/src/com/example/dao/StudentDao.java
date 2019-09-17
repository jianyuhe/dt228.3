package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.example.business.student;
import com.example.exceptions.DaoException;


public class StudentDao extends Dao {


	public String name(String sid) throws DaoException {
		String Sname;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        student u = null;
        try {
            con = this.getConnection();
            
            String query = "SELECT * FROM Student WHERE studentId = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, sid);
            
            rs = ps.executeQuery();
            if (rs.next()) {
            	String studnetId = rs.getString("studentId");
                String studentname = rs.getString("studentName");
                String borrow = rs.getString("borrow");
                String returned = rs.getString("returned");
                
                u = new student(studnetId, studentname, borrow, returned);
            }
            Sname = u.getStudentName();
        } catch (SQLException e) {
            throw new DaoException("findStudentId " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                throw new DaoException("findStudentId" + e.getMessage());
            }
        }
        return Sname;     // u may be null 
    }
	
	
	
	public String stateB(String sid) throws DaoException {
		String Sborrow;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        student u = null;
        try {
            con = this.getConnection();
            
            String query = "SELECT * FROM Student WHERE studentId = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, sid);
            
            rs = ps.executeQuery();
            if (rs.next()) {
            	String studnetId = rs.getString("studentId");
                String studentname = rs.getString("studentName");
                String borrow = rs.getString("borrow");
                String returned = rs.getString("returned");
                
                u = new student(studnetId, studentname, borrow, returned);
            }
             Sborrow = u.getBorrow();
        } catch (SQLException e) {
            throw new DaoException("findStudentId " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                throw new DaoException("findStudentId" + e.getMessage());
            }
        }
        return Sborrow;     // u may be null 
    }
	
	public String stateR(String sid) throws DaoException {
		String Sreturn;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        student u = null;
        try {
            con = this.getConnection();
            
            String query = "SELECT * FROM Student WHERE studentId = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, sid);
            
            rs = ps.executeQuery();
            if (rs.next()) {
            	String studnetId = rs.getString("studentId");
                String studentname = rs.getString("studentName");
                String borrow = rs.getString("borrow");
                String returned = rs.getString("returned");
                
                u = new student(studnetId, studentname, borrow, returned);
            }
             Sreturn = u.getReturn();
        } catch (SQLException e) {
            throw new DaoException("findStudentId " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                throw new DaoException("findStudentId" + e.getMessage());
            }
        }
        return Sreturn;     // u may be null 
    }
	
	
    public student findStudentId(String sid) throws DaoException {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        student u = null;
        try {
            con = this.getConnection();
            
            String query = "SELECT * FROM Student WHERE studentId = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, sid);
            
            rs = ps.executeQuery();
            if (rs.next()) {
            	String studnetId = rs.getString("studentId");
                String studentname = rs.getString("studentName");
                String borrow = rs.getString("borrow");
                String returned = rs.getString("returned");
                
                u = new student(studnetId, studentname, borrow, returned);
            }
        } catch (SQLException e) {
            throw new DaoException("findStudentId " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                throw new DaoException("findStudentId" + e.getMessage());
            }
        }
        return u;     // u may be null 
    }
    
    public void doBorrow(String sid) throws DaoException {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            con = this.getConnection();
            
            String query = "UPDATE Student SET borrow = 'T', returned = 'F' where studentId = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, sid);
            
             ps.executeUpdate();
            
        } catch (SQLException e) {
            throw new DaoException("doBorrow " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                throw new DaoException("doBorrow" + e.getMessage());
            }
        }

    }
   
    
    public void returned(String sid) throws DaoException {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            con = this.getConnection();
            
            String query = "UPDATE Student SET borrow = 'F', returned = 'T' where studentId = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, sid);
            
             ps.executeUpdate();
            
        } catch (SQLException e) {
            throw new DaoException("doBorrow " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                throw new DaoException("doBorrow" + e.getMessage());
            }
        }

    }
    
}   

   
            
    
