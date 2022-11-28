<%-- 
    Document   : Conexion
    Created on : 12 nov 2022, 12:33:21
    Author     : Sebastian
--%>

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
            String selectProd = "SELECT * FROM tb_sucur"
            String selectSucur = "SELECT id_sucur FROM tb_sucur"
            PreparedStatement consultaProd = null;
            PreparedStatement consultaSucur = null;
            ResultSet listaSucur = null;
            
            
            try{
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsptprueba", "root", "")
            consultaProd = conexion.prepareStatement(selectProd);
            consultaProd.setString(1, request.getParameter("nom_prod"));
            consultaProd.execute();
            
            
            consultaSucur = conexion.preparedStatement(selectSucur);
            consultaSucur.setString(1, request.getParameter("nom_sucur"));
            consultaSucur.execute();
            listaSucur = consultaSucur.executeQuery();
            
            while(listaSucur.next()){
            %>
            <p><%out.print(listaSucur.getString("nom_prod"));%></p>
            <ul>
                
                    <li><a href="index1-carga.jsp?id=<%out.print(listaSucur.getString("id_sede"));%>">Carga</a></li>
                    <li><a href="index1-carga.jsp?id=<%out.print(listaSucur.getString("id_sede")%>">Consulta</li>
                   <li>Elimina</li>
            </ul>
           <%
         }
         

            }
            catch (Exception e) {
                    e.printStackTrace();
                    out.println("exepcion </br>");
                    out.println("detalle de la consulta: </br>");
                    out.println(consultaAlus + "</br>");
                    out.println(consultaRel + "</br>");
                  
                }   finally {
                    try {           
                        consultaProd.close();
                        consultaSucur.close(); 
                        conexion.close();
                    } catch (Exception e) {
                    }
        %>
    </body>
</html>
