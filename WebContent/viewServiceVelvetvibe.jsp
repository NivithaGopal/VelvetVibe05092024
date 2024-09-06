<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="bean.ServiceVelvetvibeBean" %>
<%@ page import="dao.ServiceVelvetvibeDAO" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<title>View Services - VELVETVIBE</title>
<style>
    body {
        background-color: #e9ecef;
        font-family: 'Arial', sans-serif;
    }
    .container {
        margin-top: 2rem;
    }
    .table-container {
        background-color: #ffffff;
        border-radius: 15px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        padding: 1rem;
    }
    .btn-custom {
        background-color: #343a40;
        border-color: #343a40;
        color: #fff;
    }
    .btn-custom:hover {
        background-color: #495057;
        border-color: #495057;
    }
</style>
</head>
<body>
<div class="container">
    <div class="table-container">
        <h2 class="text-center mb-4">Services</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Service Name</th>
                    <th scope="col">Category Name</th>
                    <th scope="col">Description</th>
                    <th scope="col">Image 1</th>
                    <th scope="col">Image 2</th>
                    <th scope="col">Image 3</th>
                    <th scope="col">Amount From</th>
                    <th scope="col">Amount To</th>
                    <th scope="col">Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ServiceVelvetvibeDAO dao = new ServiceVelvetvibeDAO();
                    List<ServiceVelvetvibeBean> services = dao.getAllServiceVelvetvibe();
                    for (ServiceVelvetvibeBean service : services) {
                %>
                <tr>
                    <td><%= service.getServicevv_id() %></td>
                    <td><%= service.getService_name() %></td>
                    <td><%= service.getCategoryName() %></td>
                    <td><%= service.getDescription() %></td>
                    <td><%= service.getImage1() %></td>
                    <td><%= service.getImage2() %></td>
                    <td><%= service.getImage3() %></td>
                    <td><%= service.getAmount_from() %></td>
                    <td><%= service.getAmount_to() %></td>
                    <td>
                        <a href="editServiceVelvetvibe.jsp?id=<%= service.getServicevv_id() %>" class="btn btn-custom btn-sm"><i class="bi bi-pencil"></i></a>
                        <a href="deleteServiceVelvetvibe.jsp?id=<%= service.getServicevv_id() %>" class="btn btn-danger btn-sm"><i class="bi bi-trash"></i></a>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
