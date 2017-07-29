
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Admin Panel</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- Graph CSS -->
<link href="css/lines.css" rel='stylesheet' type='text/css' />
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<!----webfonts--->
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
<!---//webfonts--->  
<!-- Nav CSS -->
<link href="css/custom.css" rel="stylesheet">
<!-- Metis Menu Plugin JavaScript -->
<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>
<!-- Graph JavaScript -->
<script src="js/d3.v3.js"></script>
<script src="js/rickshaw.js"></script>
</head>
<body>
<div id="wrapper">
     <!-- Navigation -->
        <nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <%@ include file ="include/header.jsp" %>
            <%@ include file ="include/sidebar.jsp" %>
            
            <!-- /.navbar-static-side -->
        </nav>
        <div id="page-wrapper">
        <div class="graphs">
      <div class="xs">
  	    <h3>Manage Movies</h3>
  	    <div class="well1 white">
        <form class="form-floating ng-pristine ng-invalid ng-invalid-required ng-valid-email ng-valid-url ng-valid-pattern" method="post" action="addtheater.jsp" ng-submit="submit()">
          <fieldset>
       <%   Class.forName("oracle.jdbc.driver.OracleDriver");  
  
          Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cinema","12345");  
  %>
              <table width="100%" border="1" cellpadding="10" cellspacing="10">
                  <tr align="align='center'"><th>S.no</th><th>Movie Name</th><th>Image</th><th>Cast</th><th>Category</th><th>Option</th></tr>
             <%     PreparedStatement stmt=con.prepareStatement("select * from film");  
                     ResultSet rs=stmt.executeQuery();  
                     int num=1;
                  while(rs.next()){  
                  out.print("<tr align='center'><td>"+ num+"</td><td>"+rs.getString(2)+"</td><td><img src='images/movies/"+rs.getString(3)+"' height='150px' width='200px'/></td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+"update/delete"+"</td></tr>");
                     num++;
                  }  
               %>   
                  
              </table>
              
              
              
              
          </fieldset>
        </form>
      </div>
    </div>
    
		<%@ include file ="include/footer.jsp" %>
		</div>
       </div>
      <!-- /#page-wrapper -->
   </div>
    <!-- /#wrapper -->
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>