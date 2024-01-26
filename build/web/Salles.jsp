<%-- 
    Document   : Salles
    Created on : 24 oct. 2023, 22:44:11
    Author     : Ismail
--%>

<%@page import="entities.Salle"%>
<%@page import="services.SalleService"%>
<%@page import="services.MachineService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <form action="SalleController" method="GET">
            <fieldset>
                <legend>Informations Salles</legend>                 
                <table border="0">
                    
                        
                        <tr>
                            <td>Code :</td>
                            <td><input type="text" name="code" value="" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Ajouter" /><input type="reset" value="Annuler" /></td>
                        </tr>
                    </tbody>
                </table>

            </fieldset>
            
        </form>
        <fieldset>
            <legend>Liste Salles</legend>
            <table border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Code</th>
                        <th>Modifier</th>
                        <th>Supprimer</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                            SalleService ss = new SalleService();
                            for(Salle s :ss.findAll()){
                    %>
                    <tr>
                        <td><%= s.getId()%></td>
                        <td><%= s.getCode()%></td>
                        <td><a href="SalleController">Modifier</a></td>
                        <td><a href="SalleController?op=delete&id=<%=s.getId()%>">Supprimer</a></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        
                    </tr>
                    <% }%>
                </tbody>
            </table>

                
            
        </fieldset>
    </body>
</html>
