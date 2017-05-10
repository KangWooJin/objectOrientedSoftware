package project.bulletinBoard;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;

import javax.swing.JOptionPane;

public class CommentControl {
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

   String dbTable = "comment";
   
   public CommentControl() {
      // TODO Auto-generated constructor stub
      try {
         Class.forName(driverName); 
         con = DriverManager.getConnection(dbURL,id, passwd);
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   public void insertComment(CommentData c) {
      if ( c == null )
         return ;
      
      try {
         String selectQuery = "SELECT * FROM `"+ dbTable +"`" ;
   
         stmt = con.createStatement();
         rs = stmt.executeQuery(selectQuery);

         while (rs.next()) {
            if(c.bulletinBoardNum == rs.getInt(1) && c.bulletinBoardMessageNum == rs.getInt(2)) {
               count++;
            }
         }
      } catch (Exception e) {            
         System.out.println(e.getMessage());
         e.printStackTrace();
      }
      
      try {
         String insertQuery = "INSERT INTO `"+ dbTable + "` VALUES(?, ?, ?, ?, ?, ?, ?, ?)";

         pstmt = con.prepareStatement(insertQuery);

         Calendar nowTime = Calendar.getInstance();
         int time = (10000*nowTime.get(Calendar.YEAR)) + (100*(nowTime.get(Calendar.MONTH)+1)) + nowTime.get(Calendar.DAY_OF_MONTH);
         
         if(c.commentContent.length() == 0) {
            JOptionPane.showMessageDialog(jp, "내용이 누락 되었습니다.");
            return;
         }
         else if(c.commentContent.length() > 1000) {
            JOptionPane.showMessageDialog(jp, "내용은 1000자 이내만 가능합니다.");
            return;
         }
         
         if(c.creator.length() == 0) {
            JOptionPane.showMessageDialog(jp, "작성자가 누락 되었습니다.");
            return;
         }
         else if(c.creator.length() > 8) {
            JOptionPane.showMessageDialog(jp, "작성자는 8자 이내만 가능합니다.");
            return;
         }
         
         pstmt.setInt(1, c.bulletinBoardNum);
         pstmt.setInt(2, c.bulletinBoardMessageNum);
         pstmt.setInt(3, count);
         pstmt.setString(4, c.commentContent);
         pstmt.setString(5, "1");
         pstmt.setString(6, c.creator);
         pstmt.setString(7, c.attachFile);
         pstmt.setInt(8, time);

         pstmt.executeUpdate();
         count++;
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }
   
   public void updateComment(CommentData c) {
      try {
         String sql = "select bulletinboardnum from `" + dbTable +"` where bulletinboardnum = ? and bulletinBoardMessageNum = ? and commentNum = ?";

         pstmt = con.prepareStatement(sql);
         pstmt.setInt(1, c.bulletinBoardNum);
         pstmt.setInt(2, c.bulletinBoardMessageNum);
         pstmt.setInt(3, c.commentNum);
         rs = pstmt.executeQuery();

         if( rs.next() ) {
            int rId1 = rs.getInt("bulletinBoardNum");
            int rId2 = rs.getInt("bulletinBoardMessageNum");
            int rId3 = rs.getInt("commentNum");

            if (rId1 == c.bulletinBoardNum && rId2 == c.bulletinBoardMessageNum && rId3 == c.commentNum) {
               String updateQuery = "update `" + dbTable + "`set commentContent = ?, "
                     + "privacyScope = ?, creator = ?, attachFile = ?, openingDate = ?, "
                     + "where bulletinBoardNum = ? and  bulletinBoardMessageNum = ? and commentNum = ?";

               pstmt = con.prepareStatement(updateQuery);
               
               pstmt.setString(1, c.commentContent);
               pstmt.setString(2, c.privacyScope);
               pstmt.setString(3, c.creator);
               pstmt.setString(4, c.attachFile);
               pstmt.setInt(5, c.openingDate);
               pstmt.setInt(6, c.bulletinBoardNum);
               pstmt.setInt(7, c.bulletinBoardMessageNum);
               pstmt.setInt(8, c.commentNum);

               pstmt.executeUpdate();
            }
         }
      } catch (Exception e) {
         e.printStackTrace();
         System.out.println(e.getMessage());
      }
   }

   public void delete(int bulletinBoardNum, int bulletinBoardMessageNum, int commentNum) {
      if (bulletinBoardNum == 0 || bulletinBoardMessageNum == 0 || commentNum == 0 )
         return ;
      
      try {
         String deleteQuery = "delete from `"+ dbTable +"` where bulletinBoardNum = ? and bulletinBoardMessageNum = ? and commentNum = ?";

         pstmt = con.prepareStatement(deleteQuery); 
         pstmt.setInt(1, bulletinBoardNum);
         pstmt.setInt(2, bulletinBoardMessageNum);
         pstmt.setInt(3, commentNum);

         pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
         System.out.println(e.getMessage());
      }
   }

   public ArrayList<CommentData> selectComment() {
      ArrayList<CommentData> arr = new ArrayList<CommentData>();
      
      try {
         String selectQuery = "SELECT * FROM `"+ dbTable +"`" ;

         stmt = con.createStatement();
         rs = stmt.executeQuery(selectQuery);

         while (rs.next())
         {
            CommentData c = new CommentData() ;

            c.bulletinBoardNum = rs.getInt(1);
            c.bulletinBoardMessageNum = rs.getInt(2);
            c.commentNum = rs.getInt(3);
            c.commentContent = rs.getString(4);
            c.privacyScope = rs.getString(5);
            c.creator = rs.getString(6);
            c.attachFile = rs.getString(7);
            c.openingDate = rs.getInt(8);

            arr.add(c);
         }
      }
      catch (Exception e) {            
         System.out.println(e.getMessage());
         e.printStackTrace();
      }
      return arr;
   }

   public CommentData selectComment(String bulletinBoardNum, String bulletinBoardMessageNum, String commentNum) {
      CommentData c = new CommentData();
      
      try {
         String selectQuery = "SELECT * FROM `"+ dbTable + "` where bulletinBoardNum = '" + bulletinBoardNum + "' and bulletinBoardMessageNum = '" + bulletinBoardMessageNum + "' and commentNum = " + commentNum;

         stmt = con.createStatement();
         rs = stmt.executeQuery(selectQuery);

         if (rs.next()) {
            c.bulletinBoardNum = rs.getInt(1);
            c.bulletinBoardMessageNum = rs.getInt(2);
            c.commentNum = rs.getInt(3);
            c.commentContent = rs.getString(4);
            c.privacyScope = rs.getString(5);
            c.creator = rs.getString(6);
            c.attachFile = rs.getString(7);
            c.openingDate = rs.getInt(8);
         }
      }
      catch (Exception e) {            
         System.out.println(e.getMessage());
         e.printStackTrace();
      }
      return c;
   }
}