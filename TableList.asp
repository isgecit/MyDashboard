<!DOCTYPE HTML>
<HTML> 
<TITLE> </TITLE>     
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  
  
</head>
<BODY>
 
<div class="container-fluid">
<table class="table table-hover">   
<%
DIM vSQL
DIM vDataSource
vDataSource = Request.QueryString("datasource")(1)
vSQL = Request.QueryString("sql")(1)
set conn=Server.CreateObject("ADODB.Connection")
IF vDataSource = "BaaN" THEN
conn.Open ="File Name=C:\inetpub\wwwroot\MyDashboard\baan.udl"
ELSE
conn.Open ="File Name=C:\inetpub\wwwroot\MyDashboard\joomla.udl"
END IF

set rs = Server.CreateObject("ADODB.recordset")
'rs.Open "Select firstname AS [FIRST NAME], lastname AS [LAST NAME], email AS [EMAIL ID] from asp.dbo.bootstrap", conn
rs.Open vSQL, conn
    Response.Write("     <thead>")
	Response.Write("     <tr>")
	FOR i = 0 TO rs.Fields.Count-1
		Response.Write("      <th>"& rs.Fields(i).name &"</th>")
	NEXT   
	Response.Write("    </tr>")
    Response.Write("     </thead>")
    Response.Write("     <tbody>")
do until rs.EOF
		Response.Write("<tr>")
		FOR i = 0 TO rs.Fields.Count-1
			Response.Write(" <th>" & rs.Fields(i).value & "</th>") 
		NEXT
       Response.Write(" </tr> ") 
    Response.Write("     </tbody>")


rs.MoveNext
loop

rs.close
conn.close
%>
  </table>
</div>

</BODY>
</HTML>
