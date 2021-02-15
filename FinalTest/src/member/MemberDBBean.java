package member;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

public class MemberDBBean {
	 private Connection getConnection() throws Exception
	 {
	  Connection con=null;
	  String url="jdbc:mysql://localhost:3306/userdb?serverTimezone=UTC";
	  String user="root";
	  String pwd="1234";
	  
	  Class.forName("com.mysql.jdbc.Driver");
	  con=DriverManager.getConnection(url,user,pwd);
	  return con;
	 }
	 
	 //DB에 회원 가입으로 인한 회원정보 입력 시 사용
	 public void insertMember(MemberDataBean member)
	 {
	  Connection con=null;
	  PreparedStatement pstmt=null;
	  String sql="";
	  try {
	   con=getConnection();

	   sql="insert into member(id,passwd,name,email) values(?,?,?,?)";
	   pstmt=con.prepareStatement(sql);
	   pstmt.setString(1, member.getId());
	   pstmt.setString(2, member.getPasswd());
	   pstmt.setString(3, member.getName());
	   pstmt.setString(4, member.getEmail());
	   pstmt.executeUpdate();
	  } 
	  catch (Exception e) 
	  {
	   e.printStackTrace();
	  }
	  finally
	  {
		   if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
		   if(con!=null)try{con.close();}catch(SQLException ex){}
	  }
	 }
	 
	 //DB에 회원 삭제로 인한 회원정보 삭제 시 활용
	 public int deleteMember(String id, String passwd)
	 {
	  int check=0;
	  Connection con=null;
	  PreparedStatement pstmt=null;
	  String sql="";
	  ResultSet rs=null;
	  try
	  {
	   con=getConnection();
	   sql = "select passwd from member where id=?";
	   
	   pstmt = con.prepareStatement(sql);
	   pstmt.setString(1, id);

	   rs = pstmt.executeQuery();
	   if(rs.next()){
	    String dbPass=rs.getString("passwd");
	    //비밀번호가 id와 일치하는 경우에만 정보를 제거할 수 있습니다
	    if(passwd.equals(dbPass)){
	     sql = "delete from member where id=?";
	     pstmt = con.prepareStatement(sql);
	     pstmt.setString(1, id);
	     pstmt.executeUpdate();
	     check = 1;
	    }
	    else{
	     check = 0;
	    }
	   }   
	  }
	  catch (Exception e) 
	  {
	   e.printStackTrace();
	  }
	  finally
	  {
		   if(rs!=null)try{rs.close();}catch(SQLException ex){}
		   if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
		   if(con!=null)try{con.close();}catch(SQLException ex){}
	  }
	  return check;
	 }
	 
	 //해당 유저에 관한 검증을 합니다. 존재하는 아이디를 입력한 것인지, 존재하는 아이디가 맞다면 해당하는 비밀번호를 입력한 것인지..
	 public int userCheck(String id,String passwd)
	 {
	  int check=-1;
	  Connection con=null;
	  PreparedStatement pstmt=null;
	  String sql="";
	  ResultSet rs=null;
	  try {
	   con=getConnection();
	   sql="select passwd from member where id=?";
	   pstmt=con.prepareStatement(sql);
	   pstmt.setString(1, id);
	   rs=pstmt.executeQuery();

	   if(rs.next())
	   {
		    //아이디가 있긴함
		    String dbPass=rs.getString("passwd");
		    if(passwd.equals(dbPass))
		    {
		     //비밀번호가 일치하여 check에 1이 저장됩니다
		     check = 1;
		    }
		    else
		    {
		     //아이디는 있지만 비밀번호가 틀려서 check에 0이 저장됩니다
		     check = 0;
		    }
	   }
	   else
		   {
		    //아이디가 아예 없습니다.
		    check = -1;
		   }
	  } 
	  catch (Exception e) 
	  {
		  e.printStackTrace();
	  }
	  finally
	  {
		   if(rs != null)try{rs.close();}catch(SQLException ex){}
		   if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
		   if(con != null)try{con.close();}catch(SQLException ex){}
	  }
	  
	  return check;
	 }
	 
	 //해당 id의 회원정보를 DB에서부터 가져옵니다
	 public MemberDataBean getMember(String id)
	 {
	  Connection con=null;
	  PreparedStatement pstmt=null;
	  ResultSet rs=null;
	  String sql="";
	  MemberDataBean member=null;
	  
	  try 
	  {
	   con=getConnection();
	   sql="select * from member where id=?";
	   pstmt=con.prepareStatement(sql);
	   pstmt.setString(1, id);
	   rs=pstmt.executeQuery();

	   if(rs.next())
	   {
	    member=new MemberDataBean();
	    member.setId(rs.getString("id"));
	    member.setPasswd(rs.getString("passwd"));
	    member.setName(rs.getString("name"));
	    member.setEmail(rs.getString("email"));
	   }
	  } 
	  catch (Exception e) 
	  {
	   e.printStackTrace();
	  }
	  finally
	  {
		   if(rs != null)try{rs.close();}catch(SQLException ex){}
		   if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
		   if(con != null)try{con.close();}catch(SQLException ex){}
	  }
	  return member;
	 }

	//해당 회원의 정보를 수정하는 데 사용합니다. DB에 있는 정보 또한 수정됩니다.
	 public int updateMember(MemberDataBean member)
	 {
	  Connection con=null;
	  PreparedStatement pstmt=null;
	  ResultSet rs=null;
	  String sql="";
	  int check=-1;
	  try 
	  {
	   con=getConnection();
	   sql="select passwd from member where id=?";
	   pstmt=con.prepareStatement(sql);
	   pstmt.setString(1, member.getId());
	   rs=pstmt.executeQuery();

	   if(rs.next())
	   {
	    String dbPass=rs.getString("passwd");
	    if(member.getPasswd().equals(dbPass))
	    {
	     check=1;
	     sql="update member set name=? where id=?";
	     pstmt = con.prepareStatement(sql);
	     pstmt.setString(1, member.getName());
	     pstmt.setString(2, member.getId());
	     pstmt.executeUpdate();
	     sql="update member set email=? where id=?";
	     pstmt = con.prepareStatement(sql);
	     pstmt.setString(1, member.getEmail());
	     pstmt.setString(2, member.getId());
	     pstmt.executeUpdate();
	    }
	    else
	    {
	     check=0;
	    }
	   }
	  } 
	  catch (Exception e) 
	  {
		  e.printStackTrace();
	  }
	  finally
	  {
		   if(rs != null)try{rs.close();}catch(SQLException ex){}
		   if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
		   if(con != null)try{con.close();}catch(SQLException ex){}
	  }
	  return check;
	 }
	 
	 //회원들의 총 리스트를 가져옵니다.
	 public List getMemberList(){
	  List memberList = new ArrayList<>();
	  
	  Connection con = null;
	  String sql="";
	  PreparedStatement pstmt=null;
	  ResultSet rs = null;
	  try {
	   con = getConnection();
	   sql="select * from member";
	   pstmt = con.prepareStatement(sql);
	   rs=pstmt.executeQuery();
	   
	   //LIST 자료형을 이용하여 member 정보를 먼저 하나 가져온 후, 다음 member가 남아있다면 가져올 정보들이 없을 때까지 가져옵니다.
	   while(rs.next())
	   { 
	    MemberDataBean member = new MemberDataBean();
	    member.setId(rs.getString("id"));
	    member.setPasswd(rs.getString("passwd"));
	    member.setName(rs.getString("name"));
	    member.setEmail(rs.getString("email"));
	    memberList.add(member);
	   }
	  } 
	  catch (Exception e) 
	  {
	   e.printStackTrace();
	  }
	  finally
	  {
	   
	  }
	  
	  return memberList;
	 }    
	}