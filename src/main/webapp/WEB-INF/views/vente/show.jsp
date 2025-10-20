<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Lot" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Equida - Détails de la vente</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
    <style>
        body {
            padding-top: 50px;
        }
        .special {
            padding-top: 50px;
        }
        .form-container {
            background-color: #f8f9fa;
            border-radius: 5px;
            padding: 20px;
            margin-top: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .detail-row {
            margin-bottom: 15px;
        }
        .detail-label {
            font-weight: bold;
            color: #555;
        }
        .detail-value {
            padding-top: 7px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="<%= request.getContextPath() %>/cheval-servlet/list">
                Gestion des ventes
            </a>
        </div>
    </div>
</nav>

<div class="container special">
    <div class="header-actions">
        <h2 class="h2">Liste des lots : </h2>
    </div>

    <div class="row">
        <div class="col-md-8 col-md-offset-2">

            <div class="table-responsive">
                <p><% ArrayList<Lot> lesLots = (ArrayList)request.getAttribute("pLesLots"); %></p>
                <table class="table table-striped table-sm">
                    <thead>
                    <tr>
                        <th>Numero</th>
                        <th>Sexe</th>
                        <th>Race</th>
                        <th>Nom</th>
                        <th>Prix de départ</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (Lot l : lesLots) { %>
                    <tr>
                        <td><a href="<%= request.getContextPath() %>/vente-servlet/show?idVente=<%= l.getId() %>"><%= l.getNumLot() %></a></td>

                        <td><%= l.getCheval().getSexe() %></td>
                        <td><%= l.getCheval().getRace().getNom() %></td>
                        <td><%= l.getCheval().getNom() %></td>
                        <td><%= l.getPrixDepart() %>€</td>


                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>

<!-- Bootstrap JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>