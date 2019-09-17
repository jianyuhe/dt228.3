package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.example.business.librarian;

import com.example.exceptions.DaoException;


public class librarianDao extends Dao {

    public librarian login(String lid, String sname) throws DaoException {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        librarian u = null;
        try {
            con = this.getConnection();
            
            String query = "SELECT * FROM Librarian WHERE librarianId = ? and librarianName = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, lid);
            ps.setString(2, sname);
            
            rs = ps.executeQuery();
            if (rs.next()) {
            	String lId = rs.getString("librarianId");
                String lname = rs.getString("librarianName");
                String check = rs.getString("isStudent");
                
                u = new librarian(lId, lname, check);
            }
        } catch (SQLException e) {
            throw new DaoException("login " + e.getMessage());
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
                throw new DaoException("login " + e.getMessage());
            }
        }
        return u;     // u may be null 
    }

   
}   

   
            
    
