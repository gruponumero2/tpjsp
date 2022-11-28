<% 
Class.forName("com.mysql.jdbc.Driver");
Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/escuela", "root", "");
preparedStatement a = conexion.preparedStatement();
 PreparedStatement consultaEjercicio =null;
 try{
request.setCharacterEncoding("utf-8");
String insercion = "INSERT INTO productos (nombre, descripcion, costo)values ('" 
        + request.getParameter("nombre")
        + "'," + request.getParameter(("descripcion"))
        + ",'" + Integer.valueOf(request.getParameter("costo"))
        + "')";
a.execute(insercion);
    }
catch{
conexion.close();
    }
 


%>

<% 

/*Connection conexion2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/escuela", "root", "");
Statement e = conexion.createStatement();
request.setCharacterEncoding("utf-8");
String insercion2 = "INSERT INTO sucursales(nombre, direccion)values ('" 
        + request.getParameter("nombre")
        + "'," +  request.getParameter("direccion"))
        + "')";
e.execute(insercion2);
conexion2.close();*/
 
%>

<% 

Connection conexion3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/escuela", "root", "");
preparedStatement i = conexion.preparedStatement();
request.setCharacterEncoding("utf-8");
try{
String insercion3 = "INSERT INTO productos_sucursales (id_sucursal, id_producto, stock)values ('" 
        + request.getParameter("id_sucursal")
        + "'," + Integer.valueOf(request.getParameter("id_producto"))
        + ",'" + Integer.valueOf(request.getParameter("stock"))
        + "')";
i.execute(insercion3);}
catch{
conexion3.close();
    } 


%>
</body>
</html>