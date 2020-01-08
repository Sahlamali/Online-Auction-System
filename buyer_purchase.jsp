<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import= "javax.sql.*" %>
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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
     <br>   
  <span class="h1" style="color:#352c31;"><b>Online Auction Wizard</b></span>
<a href="home.html"><b id="links">HOME</b></a>
<a href="buyer.jsp"><b id="links">BACK</b></a>
<hr>
<br>
<br>
<% 
//String p = (String)session.getAttribute("demo");
//String bname = (String)session.getAttribute("myName");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/project", "root" , "Ya1@Rahman" );
Statement stmt = conn.createStatement();
String bid = (String)session.getAttribute("myId");
String p = request.getParameter("shop");
//out.println(p);
ResultSet rs = stmt.executeQuery("SELECT productseller.pid,productseller.pname,productseller.pimg,productseller.pdescription,productseller.price,productseller.sid,max(amount) FROM productseller,buyeramount where productseller.pid=buyeramount.pid and  productseller.pid="+p );

if(rs.next()){
String pid = rs.getString(1);
String sid = rs.getString(6);
String pimg = rs.getString(3);
String pname = rs.getString(2);
String pdescription = rs.getString(4);
String price = rs.getString(5);
String amount = rs.getString(7);
//out.println(amount);
%>
<center>
<img src='<%=pimg%>' class="img-thumbnail"/>
<br><br>
<%
out.println(pname+"<br><br>");
out.println(pdescription+"<br><br>");
out.println("Price:Rs "+price+"/-<br><br>");
//out.println(pname);

	
	//String sid="Hai";
//out.println("Successfully deleted the following"+sid);
  out.println("The highest bidding amount:"+amount+"<br><br>");

session.setAttribute("demo",pid);
session.setAttribute("product",bid);
   %>

<br>







<form action="purchase.jsp">
Enter your BID Amount:<input type="text"  name="amount">
<br>
<%
 session.setAttribute("PID",pid);
 session.setAttribute("SID",sid);
session.setAttribute("PRICE",price);
session.setAttribute("PImg",pimg);
	%>
<br>
<input type="Submit" value="Confirm the Amount">
</form>
<%
//ResultSet rr = stmt.executeQuery("select max(amount) from buyeramount where pid="+p);	
//String high = rr.getString(1);
//out.println(high);

}


%>
</center>

