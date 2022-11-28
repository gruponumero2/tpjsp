<%-- 
    Document   : InputDelete
    Created on : 25 nov. 2022, 11:05:53
    Author     : COMPU05
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="Baja.jsp">
            
        
        Producto </br>
        <input type = "text" name = "id_prod" /></br>
        <input type = "hidden" name = "id_sucur" value = "<%out.print(request.getParameter("id"));%>"/></br>

        </br>


        
        <input type="submit" value="Aceptar">
    </body>
</html>
