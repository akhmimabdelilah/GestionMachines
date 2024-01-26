<%-- 
    Document   : Recherche
    Created on : 24 oct. 2023, 22:44:11
    Author     : Ismail
--%>

<%@page import="services.SalleService"%>
<%@page import="entities.Salle"%>
<%@page import="entities.Machine"%>
<%@page import="services.MachineService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <form action="RechercheController" method="POST">
            <fieldset>
                <legend>Informations Machine Par Salle</legend>                 

                <label for="salle_id">Code de Salle :</label>
                <select name="salle_id">
                    <%
                        SalleService cs = new SalleService();
                        for (Salle c : cs.findAll()) {
                    %>
                    <option  value="<%= c.getId()%>"><%= c.getCode()%></option>
                    <% } %>

                </select>

                <input type="submit" value="Rechercher" />

            </fieldset>

        </form>
        <fieldset>
            <legend>Liste Machines</legend>
            <table border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Reference</th>
                        <th>Marque</th>
                        <th>Prix</th>
                        <th>Salle</th>

                    </tr>
                </thead>
                <tbody>

                    <%
                        MachineService ms = new MachineService();
                        System.out.println("Machines");
                        int id = 0;
                        System.out.println("Id:" + request.getParameter("salle_id"));

                        if (request.getParameter("salle_id") != null) {
                            System.out.println("Salles");
                            id = Integer.parseInt(request.getParameter("salle_id"));
                            System.out.println(id);

                            for (Machine m : ms.findAll()) {
                                System.out.println("Machine Id" + m.getId());
                                System.out.println("Salle Id" + m.getSalle().getId());
                                if (m.getSalle().getId() == id) {
                    %>
                    <tr>
                        <td><%= m.getId()%></td>
                        <td><%= m.getRef()%></td>
                        <td><%= m.getMarque()%></td>
                        <td><%= m.getPrix()%></td>
                        <td><%= m.getSalle().getCode()%></td>
                    </tr>
                    <%}
                            }
                        }%>

                    <%
//                        MachineService ms = new MachineService();

                        System.out.println("Machines");
                        int ID = 1;
                        System.out.println("Id:" + request.getParameter("salle_id"));

                        if (request.getParameter("salle_id") != null) {
                            System.out.println("Salles");

                            System.out.println(ID);

                            for (Machine m : ms.findAll()) {
                                System.out.println("Machine Id" + m.getId());
                                System.out.println("Salle Id" + m.getSalle().getId());
                                if (m.getSalle().getId() == ID) {
                    %>
                    <tr>
                        <td><%= m.getId()%></td>
                        <td><%= m.getRef()%></td>
                        <td><%= m.getMarque()%></td>
                        <td><%= m.getPrix()%></td>
                        <td><%= m.getSalle().getCode()%></td>
                    </tr>
                    <%}
                            }
                        }%>

                </tbody>
            </table>
        </fieldset>
    </body>
</html>
