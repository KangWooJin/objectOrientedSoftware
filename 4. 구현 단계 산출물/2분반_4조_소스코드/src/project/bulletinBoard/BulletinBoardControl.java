package project.bulletinBoard;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;

import javax.swing.JOptionPane;

public class BulletinBoardControl {
   static final String id = "root";
   static final String passwd = "7942";
   static final String driverName = "com.mysql.jdbc.Driver";
   static final String dbURL = "jdbc:mysql://localhost:3306/software";

   int count = 1;
   private JOptionPane jp = new JOptionPane();

   Connection con = null;
   Statement stmt = null;
   ResultSet rs = null;
   PreparedStatement pstmt = null;

   String dbTable = "bulletinboard";
   
   public BulletinBoardControl() {
      // TODO Auto-generated constructor stub
      try {
         Class.forName(driverName);
         con = DriverManager.getConnection(dbURL,id, passwd);
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   public void insertBulletinBoard(BulletinBoardData b) {
      if ( b == null )
         return ;
      
      try {
         String selectQuery = "SELECT * FROM `"+ dbTable +"`" ;
   
         stmt = con.createStatement();
         rs = stmt.executeQuery(selectQuery);

         while (rs.next()) {
            if(count == rs.getInt(1)) {
               count++;
            }
         }
      } catch (Exception e) {
         System.out.println(e.getMessage());
         e.printStackTrace();
      }
      
      try {
         String insertQuery = "INSERT INTO `"+ dbTable + "` VALUES(?, ?, ?, ?, ?, ?, ?)";
         
         pstmt = con.prepareStatement(insertQuery);
         
         Calendar nowTime = Calendar.getInstance();
         int time = (10000*nowTime.get(Calendar.YEAR)) + (100*(nowTime.get(Calendar.MONTH)+1)) + nowTime.get(Calendar.DAY_OF_MONTH);
         
         if(b.bulletinBoard.length() == 0) {
            JOptionPane.showMessageDialog(jp, "게시판 명이 누락 되었습니다.");
            return;
         }
         else if(b.bulletinBoard.length() > 20) {
            JOptionPane.showMessageDialog(jp, "게시판 명은 20자 이내만 가능합니다.");
            return;
         }
         
         System.out.println(b.creator);
         
         if(b.creator.length() == 0) {
            JOptionPane.showMessageDialog(jp, "작성자가 누락 되었습니다.");
            return;
         }
         else if(b.creator.length() > 8) {
            JOptionPane.showMessageDialog(jp, "작성자는 8자 이내만 가능합니다.");
            return;
         }
         
         pstmt.setInt(1, count);
         pstmt.setString(2, b.bulletinBoard);
         pstmt.setInt(3, time);
         pstmt.setInt(4, 20491231);
         pstmt.setString(5, b.kindOfbulletinBoard);
         pstmt.setString(6, b.creator);
         pstmt.setString(7, b.closer);
         
         pstmt.executeUpdate();
         count++;
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }

   public void updateBulletinBoard(BulletinBoardData b) {
      try {
         String sql = "select bulletinboardnum from `" + dbTable +"` where bulletinboardnum = ?";

         pstmt = con.prepareStatement(sql);
         pstmt.setInt(1, b.bulletinBoardNum);
         rs = pstmt.executeQuery();

         if(rs.next()) {
            int rId= rs.getInt("bulletinBoardNum");

            if (rId == b.bulletinBoardNum) {
               String updateQuery = "update `"+ dbTable +"` set bulletinBoard = ?"
                     + ", openingDate = ?, closingDate = ?, kindOfbulletinBoard = ?, creator = ?"
                     + ", closer = ? where bulletinboardnum = ? ";

               pstmt = con.prepareStatement(updateQuery);
               
               Calendar nowTime = Calendar.getInstance();
               int time = (10000*nowTime.get(Calendar.YEAR)) + (100*(nowTime.get(Calendar.MONTH)+1)) + nowTime.get(Calendar.DAY_OF_MONTH);

               pstmt.setString(1, b.bulletinBoard);
               pstmt.setInt(2, time);
               pstmt.setInt(3, 20491231);
               pstmt.setString(4, b.kindOfbulletinBoard);
               pstmt.setString(5, b.creator);
               pstmt.setString(6, b.closer);
               pstmt.setInt(7, b.bulletinBoardNum);

               pstmt.executeUpdate();
            }
         }
      } catch (Exception e) {
         e.printStackTrace();
         System.out.println(e.getMessage());
      }
   }

   public ArrayList<BulletinBoardData> selectBulletinBoard() {
      ArrayList<BulletinBoardData> arr = new ArrayList<BulletinBoardData>();
      
      try {
         String selectQuery = "SELECT * FROM `"+ dbTable +"`" ;
         
         stmt = con.createStatement();
         rs = stmt.executeQuery(selectQuery);

         while (rs.next()) {
            BulletinBoardData b = new BulletinBoardData() ;

            b.bulletinBoardNum = rs.getInt(1);
            b.bulletinBoard = rs.getString(2);
            b.openingDate = rs.getInt(3);
            b.closingDate = rs.getInt(4);
            b.kindOfbulletinBoard = rs.getString(5);
            b.creator = rs.getString(6);
            b.closer = rs.getString(7);

            arr.add(b);
         }
      }
      catch (Exception e) {            
         System.out.println(e.getMessage());
         e.printStackTrace();
      }
      return arr;
   }

   public BulletinBoardData selectBulletinBoard(String bulletinBoardNum) {
      BulletinBoardData b = new BulletinBoardData();
      
      try {
         String selectQuery = "SELECT * FROM `"+ dbTable + "` where bulletinBoardNum = '" + bulletinBoardNum + "'";

         stmt = con.createStatement();
         rs = stmt.executeQuery(selectQuery);

         if (rs.next()) {
            b.bulletinBoardNum = rs.getInt(1);
            b.bulletinBoard = rs.getString(2);
            b.openingDate = rs.getInt(3);
            b.closingDate = rs.getInt(4);
            b.kindOfbulletinBoard = rs.getString(5);
            b.creator = rs.getString(6);
            b.closer = rs.getString(7);
         }
      }
      catch (Exception e) {            
         System.out.println(e.getMessage());
         e.printStackTrace();
      }
      return b;
   }
}