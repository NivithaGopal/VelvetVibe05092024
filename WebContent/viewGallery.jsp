<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="dao.GalleryDAO" %>
<%@ page import="bean.GalleryBean" %>
<%@ page import="java.util.List" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>View Gallery - VELVETVIBE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            color: #333;
            font-family: 'Arial', sans-serif;
        }
        .container {
            max-width: 1200px;
            margin-top: 50px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .gallery-image {
            width: 100%;
            height: auto;
        }
       .icon-btn {
            border: none;
            background: none;
            padding: 5px;
            cursor: pointer;
        }
        .icon-btn:hover {
            color: #007bff;
        }
         h3 {
            font-size: 2rem;
            font-weight: bold;
            color: #212529;
            text-align: center;
        }
       .add-btn {
            margin-bottom: 20px;
            background-color: #495057;
            border-color: #495057;
        } 
    </style>
</head>
<body>
    <div class="container">
    	<h3>VELVETVIBE</h3>
        <h4 class="text-center">Gallery Images</h4><br>
                <a href="addGallery.jsp" class="btn btn-primary add-btn">Add New</a>
        
        <div class="row">
            <%
                GalleryDAO galleryDAO = new GalleryDAO();
                List<GalleryBean> galleries = galleryDAO.getAllGalleries(); // Ensure this method is defined correctly
                if (galleries != null && !galleries.isEmpty()) {
                    for (GalleryBean gallery : galleries) {
            %>
            <div class="col-md-4 mb-4">
                <div class="card">
                    <div>
                        <img src="<%= gallery.getImage1() %>/images/<%= gallery.getImage1() %>" class="card-img-top gallery-image" alt="Image 1">
                    </div>
                    <div>
                        <img src="<%= gallery.getImage2() %>/images/<%= gallery.getImage2() %>" class="card-img-top gallery-image" alt="Image 2">
                    </div>
                    <div class="d-flex justify-content-around mt-2">
                        <form action="editGallery.jsp" method="get">
                            <input type="hidden" name="galleryId" value="<%= gallery.getGalleryId() %>">
                            <button type="submit" class="icon-btn" title="Edit">
                                <i class="fas fa-edit"></i>
                            </button>
                        </form>
                        <form action="deleteGallery.jsp" method="post" onsubmit="return confirm('Are you sure you want to delete this gallery?');">
                            <input type="hidden" name="galleryId" value="<%= gallery.getGalleryId() %>">
                            <button type="submit" class="icon-btn" title="Delete">
                                <i class="fas fa-trash-alt"></i>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
            <%
                    }
                } else {
            %>
            <p class="text-center">No gallery images available.</p>
            <%
                }
            %>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
