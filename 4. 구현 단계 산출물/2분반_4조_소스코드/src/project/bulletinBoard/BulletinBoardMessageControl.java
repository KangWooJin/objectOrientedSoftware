package project.bulletinBoard;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;

import javax.swing.JOptionPane;

public class BulletinBoardMessageControl {
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

   String dbTable = "bulletinboardmessage";
   
   public BulletinBoardMessageControl() {
      // TODO Auto-generated constructor stub
      try {
         Class.forName(driverName); 
         con = DriverManager.getConnection(dbURL,id, passwd);
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   public void insertBulletinBoardMessage(BulletinBoardMessageData bm) {
      if ( bm == null )
         return ;
      
      try {
         String selectQuery = "SELECT * FROM `"+ dbTable +"`" ;
   
         stmt = con.createStatement();
         rs = stmt.executeQuery(selectQuery);

         while (rs.next()) {
            if(bm.bulletinBoardNum == rs.getInt(1))   {
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

         if(bm.bulletinBoardMessage.length() == 0) {
            JOptionPane.showMessageDialog(jp, "제목이 누락 되었습니다.");
            return;
         }
         else if(bm.bulletinBoardMessage.length() > 20) {
            JOptionPane.showMessageDialog(jp, "제목은 20자 이내만 가능합니다.");
            return;
         }
         
         if(bm.name.length() == 0) {
            JOptionPane.showMessageDialog(jp, "작성자가 누락 되었습니다.");
            return;
         }
         else if(bm.name.length() > 8) {
            JOptionPane.showMessageDialog(jp, "작성자는 8자 이내만 가능합니다.");
            return;
         }
         
         if(bm.bulletinBoardMessageContent.length() == 0) {
            JOptionPane.showMessageDialog(jp, "내용이 누락 되었습니다.");
            return;
         }
         else if(bm.bulletinBoardMessageContent.length() > 1000) {
            JOptionPane.showMessageDialog(jp, "내용은 1000자 이내만 가능합니다.");
            return;
         }
         
         pstmt.setInt(1, bm.bulletinBoardNum);
         pstmt.setInt(2, count);
         pstmt.setString(3, bm.bulletinBoardMessageType);
         pstmt.setString(4, bm.bulletinBoardMessage);
         pstmt.setInt(5, time);
         pstmt.setString(6, bm.name);
         pstmt.setString(7, bm.attachment);
         pstmt.setString(8, bm.bulletinBoardMessageContent);

         pstmt.executeUpdate();
         count++;
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }
   
   public void updateBulletinBoardMessage(BulletinBoardMessageData bm) {
      try {
         String sql = "select bulletinboardnum from `" + dbTable +"` where bulletinboardnum = ? and bulletinBoardMessageNum = ?";

         pstmt = con.prepareStatement(sql);
         pstmt.setInt(1, bm.bulletinBoardNum);
         pstmt.setInt(2, bm.bulletinBoardMessageNum);
         rs = pstmt.executeQuery();

         if( rs.next() ) {
            int rId1 = rs.getInt("bulletinBoardNum");
            int rId2 = rs.getInt("bulletinBoardMessageNum");

            if (rId1 == bm.bulletinBoardNum && rId2 == bm.bulletinBoardMessageNum) {
               String updateQuery = "update `" + dbTable + "`set bulletinBoardMessageType = ?, "
                     + "bulletinBoardMessage = ?, createDate = ?, name = ?, attachment = ?, bulletinBoardMessageContent = ?"
                     + "where bulletinBoardNum = ? and  bulletinBoardMessageNum = ?";

               pstmt = con.prepareStatement(updateQuery);

               pstmt.setString(1, bm.bulletinBoardMessageType);
               pstmt.setString(2, bm.bulletinBoardMessage);
               pstmt.setInt(3, bm.createDate);
               pstmt.setString(4, bm.name);
               pstmt.setString(5, bm.attachment);
               pstmt.setString(6, bm.bulletinBoardMessageContent);
               pstmt.setInt(7, bm.bulletinBoardNum);
               pstmt.setInt(8, bm.bulletinBoardMessageNum);

               pstmt.executeUpdate();
            }
         }
      } catch (Exception e) {
         e.printStackTrace();
         System.out.println(e.getMessage());
      }
   }

   public void delete(int bulletinBoardNum, int bulletinBoardMessageNum) {
      if (bulletinBoardNum == 0 || bulletinBoardMessageNum == 0)
         return ;
      
      try {
         String deleteQuery = "delete from `"+ dbTable +"` where bulletinBoardNum = ? and bulletinBoardMessageNum = ?";

         pstmt = con.prepareStatement(deleteQuery);
         pstmt.setInt(1, bulletinBoardNum);
         pstmt.setInt(2, bulletinBoardMessageNum);

         pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
         System.out.println(e.getMessage());
      }
   }

   public ArrayList<BulletinBoardMessageData> selectBulletinBoardMessage() {
      ArrayList<BulletinBoardMessageData> arr = new ArrayList<BulletinBoardMessageData>();
      
      try {
         String selectQuery = "SELECT * FROM `"+ dbTable +"`";

         stmt = con.createStatement();
         rs = stmt.executeQuery(selectQuery);

         while (rs.next()) {
            BulletinBoardMessageData bm = new BulletinBoardMessageData() ;

            bm.bulletinBoardNum = rs.getInt(1);
            bm.bulletinBoardMessageNum = rs.getInt(2);
            bm.bulletinBoardMessageType = rs.getString(3);
            bm.bulletinBoardMessage = rs.getString(4);
            bm.createDate = rs.getInt(5);
            bm.name = rs.getString(6);
            bm.attachment = rs.getString(7);
            bm.bulletinBoardMessageContent = rs.getString(8);

            arr.add(bm);
         }
      }
      catch (Exception e) {            
         System.out.println(e.getMessage());
         e.printStackTrace();
      }
      return arr;
   }

   public BulletinBoardMessageData selectBulletinBoardMessage(String bulletinBoardNum, String bulletinBoardMessageNum) {
      BulletinBoardMessageData bm = new BulletinBoardMessageData();
      
      try {
         String selectQuery = "SELECT * FROM `"+ dbTable + "` where bulletinBoardNum = '" + bulletinBoardNum + "' and bulletinBoardMessageNum = '" + bulletinBoardMessageNum + "'";

         stmt = con.createStatement();
         rs = stmt.executeQuery(selectQuery);

         if (rs.next()) {
            bm.bulletinBoardNum = rs.getInt(1);
            bm.bulletinBoardMessageNum = rs.getInt(2);
            bm.bulletinBoardMessageType = rs.getString(3);
            bm.bulletinBoardMessage = rs.getString(4);
            bm.createDate = rs.getInt(5);
            bm.name = rs.getString(6);
            bm.attachment = rs.getString(7);
            bm.bulletinBoardMessageContent = rs.getString(8);
         }
      }
      catch (Exception e) {            
         System.out.println(e.getMessage());
         e.printStackTrace();
      }
      return bm;
   }
   
   public ArrayList<BulletinBoardMessageData> searchBulletinBoardMessage(String query) {
      ArrayList<BulletinBoardMessageData> arr = new ArrayList<BulletinBoardMessageData>();
      
      try {
         String selectQuery = query;

         stmt = con.createStatement();
         rs = stmt.executeQuery(selectQuery);

         while (rs.next()) {
            BulletinBoardMessageData bm = new BulletinBoardMessageData() ;

            bm.bulletinBoardNum = rs.getInt(1);
            bm.bulletinBoardMessageNum = rs.getInt(2);
            bm.bulletinBoardMessageType = rs.getString(3);
            bm.bulletinBoardMessage = rs.getString(4);
            bm.createDate = rs.getInt(5);
            bm.name = rs.getString(6);
            bm.attachment = rs.getString(7);
            bm.bulletinBoardMessageContent = rs.getString(8);

            arr.add(bm);
         }
      }
      catch (Exception e) {            
         System.out.println(e.getMessage());
         e.printStackTrace();
      }
      return arr;
   }
}