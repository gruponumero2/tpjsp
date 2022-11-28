<%-- 
    Document   : carga
    Created on : 12 nov 2022, 19:33:51
    Author     : Sebastian
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <% 
    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = null;
    
    String insertarProducto = "INSERT INTO tb_prod (nom_prod, desc_prod, cost_prod) VALUES (?,?,?)";
    String prod_sucur = "INSERT INTO tb_prod_sucur (id_sucur, id_prod, stock) VALUES (?, (SELECT id_prod FROM tb_prod WHERE nom_prod = ?), ?)";
    
    PreparedStatement consultaInsercion = null;
    PreparedStatement consultaSucur = null;
        
    
    try{
        conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsptprueba", "root", "");

        consultaInsercion = conexion.prepareStatement(insertarProducto);
        consultaInsercion.setString(1, request.getParameter("Nombre"));
        consultaInsercion.setString(2, request.getParameter("Descripcion"));
        consultaInsercion.setString(3, request.getParameter("Costo"));
        consultaInsercion.execute();
        
        consultaSucur = conexion.prepareStatement(prod_sucur);
        consultaSucur.setString(1, request.getParameter("id_sucur"));
        consultaSucur.setString(2, request.getParameter("Nombre"));
        consultaSucur.setString(3, request.getParameter("stock"));
        consultaSucur.execute();
        
        
            } catch (Exception e) {
                    e.printStackTrace();
                    out.println("exepcion </br>");
                    out.println("detalle de la consulta: </br>");
                    out.println(consultaInsercion + "</br>");
                    out.println(consultaSucur + "</br>");
                    
                  
                } finally {
                    try {           
                        consultaInsercion.close();
                        consultaSucur.close();
                        conexion.close();
                    } catch (Exception e) {
                    }
                }

%>
    </body>
</html>
