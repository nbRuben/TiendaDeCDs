<%@ page session="true"
	import="shopping.Conexion, java.util.ArrayList"
%>
<html>
<head>
<title>Music Without Borders</title>
</head>
<body bgcolor="#33CCFF">
	<font face="Times New Roman,Times" size="+3"> Music Without
		Borders </font>
	<hr>
	<p>
	<center>
		<form name="shoppingForm" action="/TiendaDeCDs/ShoppingServlet"
			method="POST">
			<b>CD:</b> <select name=CD>
				
				<% 
					//creamos una nueva conexion y hacemos una peticion a la base de datos pidiendo todos los cds que contenga
					//luego los insertamos en un arraylist y los añadimos a options mezclando java y html
					Conexion con = new Conexion();
					con.getConexion("jdbc/MusicaDB");
					
					ArrayList<String> listaCds = new ArrayList<String>();
					
					listaCds = con.getListaCDs("select * from cds");
					
					for(int i=0; i<listaCds.size();i++){
						
						%><option><%=listaCds.get(i)%></option><%
					}
				%>
			</select> <b>Quantity: </b><input type="text" name="qty" SIZE="3" value=1>
			<input type="hidden" name="action" value="ADD"> <input
				type="submit" name="Submit" value="Add to Cart">
		</form>
	</center>
	<p>
		<jsp:include page="Cart.jsp" flush="true" />
</body>
</html>