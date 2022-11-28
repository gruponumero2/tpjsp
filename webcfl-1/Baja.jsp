<%-- 
    Document   : Baja
    Created on : 25 nov. 2022, 10:57:50
    Author     : COMPU05
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
        String delete = "DELETE FROM tb_prod_sucur WHERE id_sucur = ? AND id_prod = ?";
        PreparedStatement consultaDelete = null;
        
        try{
        conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsptprueba", "root", "");
            consultaDelete = conexion.prepareStatement(delete);
            consultaDelete.setString(1, request.getParameter("id_sucur"));
            consultaDelete.setString(2, request.getParameter("id_prod"));
            consultaDelete.execute();
            %>
            <p><%out.print("El producto se ha eliminado");%></p>
            <%
            }
          catch (Exception e) {
                    e.printStackTrace();
                    out.println("exepcion </br>");
                    out.println("detalle de la consulta: </br>");
                    out.println(consultaDelete + "</br>");
                    
                  
                }   finally {
                    try {           
                        consultaDelete.close();
                        conexion.close(); 
                    } catch (Exception e) {
                    }
                }
        %>
    </body>
</html>
