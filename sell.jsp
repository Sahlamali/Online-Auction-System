<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import= "javax.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="style.css" rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="HandheldFriendly" content="true" />
<meta name="MobileOptimized" content="width" />

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="mystyle.css" media="screen" type="text/css">

  <meta charset="utf-8">
<meta name="viewport" content="width=device-width initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <title>Purchase</title>
<style>
#links{
float:right; 
padding:15px; 

color:#352c31;
background-color:white;
margin:5px;
text-decoration:none;
 }


#links:hover{

background-color:#352c31; 
color:white;


}
 

</style>



</head>

<body style="margin-left:10px;">
<br>   
  <span class="h1" style="color:#352c31;"><b>Online Auction Wizard</b></span>
<a href="home.html"><b id="links">HOME</b></a>
<a href="seller.jsp"><b id="links">BACK</b></a>
<hr>
<br>
<br>
        
 <% 
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/project", "root" , "Ya1@Rahman" );
Statement stmt = conn.createStatement();

ResultSet rs = stmt.executeQuery("SELECT buyeramount.amount,buyeramount.pid,buyeramount.bid,buyer.buyername,productseller.pname FROM buyeramount,buyer,productseller where buyeramount.bid=buyer.bid and buyeramount.pid=productseller.pid and buyeramount.amount=(select max(amount) from buyeramount) " );
String sid = (String)session.getAttribute("myId");
//out.println("Product sold to the buyer with highest bid amount<br>"); 

if(rs.next()){
            //Retrieve by column name
			
			String amount = rs.getString(1);
			String p = rs.getString(2);
			String b = rs.getString(3);
            String n= rs.getString(4);
            String pname= rs.getString(5);
		    out.println(amount+p+b+n+pname+sid); 
			//out.println("<br>Product Name:"+pname); 
			//out.println("<br>Buyer Name:"+name); 
			//out.println("<br>");
			//i=i+1;
			// int i = stmt.executeUpdate("insert into transaction (pid,sid,bid,amount,pname) values('"+p+"','"+sid+"','"+b+"','"+amount+"','"+pname+"');");
			 int i=stmt.executeUpdate("insert into transaction (pid,pname,sid,bid,amount)values('"+p+"','"+pname+"','"+sid+"','"+b+"','"+amount+"')");
			//int j = stmt.executeUpdate("delete from productseller where pid="+p);
       out.println("<h4>The product "+pname+" sold to the buyer "+n+"(BuyerID:"+b +")"+" with highest bid amount "+amount +".<br></h4>"); 
    
    }
%>