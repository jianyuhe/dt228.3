package com.example.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



import com.example.business.library;
import com.example.business.student;
import com.example.exceptions.DaoException;





public class libraryDao extends Dao {

    public void borrowed(String borrower,int bs, String bid) throws DaoException {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        library u = null;
        try {
            con = this.getConnection();
            
            String query = "UPDATE Library SET borrower = ?, bookStock = ? - 1 where bookId = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, borrower);
            ps.setInt(2, bs);
            ps.setString(3, bid);
            
             ps.executeUpdate();
            
        } catch (SQLException e) {
            throw new DaoException("borrowed " + e.getMessage());
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
                throw new DaoException("borrowed" + e.getMessage());
            }
        }
        
    }

    public void returned(String bid) throws DaoException {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        library u = null;
        try {
            con = this.getConnection();
            
            String query = "UPDATE Library SET borrower = null, bookStock = bookStock + 1 where bookId = ?";
            ps = con.prepareStatement(query);
       
            ps.setString(1, bid);
            
             ps.executeUpdate();
            
        } catch (SQLException e) {
            throw new DaoException("returned " + e.getMessage());
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
                throw new DaoException("returned" + e.getMessage());
            }
        }
        
    }
    
    public library allBook() throws DaoException {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        library u = null;
        try {
            con = this.getConnection();
            
            String query = "SELECT * FROM library ";
            ps = con.prepareStatement(query);
            
            rs = ps.executeQuery();
            if (rs.next()) {
            	String bookId = rs.getString("bookId");
                String bookT = rs.getString("bookTitle");
                int bookS = rs.getInt("bookStock");
                String borrower = rs.getString("borrower");
                
                u = new library(bookId, bookT, bookS, borrower);
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
   
}   

   
            
    
