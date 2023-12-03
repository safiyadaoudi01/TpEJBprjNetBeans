<%@page import="entities.Ville"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
            integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
            crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
          crossorigin="anonymous">
<!--    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">-->
    <meta charset="UTF-8">
    <title>Villes List</title>
    <style>


.modal-content {
    background-color: #fff;
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 20px;
}
.btn-light-purple {
    background-color: #7066E0; /* Use your desired light purple color code */
    color: #fff; /* Set text color to contrast with the background */
}

.btn-light-purple:hover {
    background-color: #655cca; /* Change the color on hover if desired */
    color: #fff;
}
.modal-header
 {
     padding:9px 15px;
     border-bottom:1px solid #eee;
    
 }

 .modal-header h3{margin:0;line-height:30px}
.modal-footer {
    background-color: #f8f9fa;
}
#ModifyvilleModalTitle {
    color: #4CAF50; /* Choose your desired color */
}
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: #e3f2fd;">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item" style="margin-right: 100px;">
                    <a class="nav-item" href="">
                        <img src="docs/administration.png" alt="" width="40" height="40" class="d-inline-block align-text-top">
                    </a>
                </li>
                <li class="nav-item" style="margin-right: 30px;">
                  <a class="nav-link" href="/EnterpriseApplication2-war/VilleController">
                        <img src="docs/cityscape.png" alt="" width="30" height="30" class="d-inline-block align-text-top">
                        Ville
                   </a>
                </li>
                <li class="nav-item" style="margin-right: 30px;">
                    <a class="nav-link" href="/EnterpriseApplication2-war/HotelController">
                        <img src="docs/hotel.png" alt="" width="30" height="30" class="d-inline-block align-text-top">            
                        Hotel
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/EnterpriseApplication2-war/HotelVilleController">
                        <img src="docs/hparv.png" alt="" width="30" height="30" class="d-inline-block align-text-top">            
                        Hotels par Ville
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>



<div class="container">
     
    <div class="d-flex justify-content-center align-items-center mb-4">
    <h2 class="display-5"><strong>Gestion des
        <small class="text-muted">Villes
        </small>
    </strong></h2>
</div>


    <!-- Add ville Modal -->
    <div class="modal fade" id="villeModalCenter" tabindex="-1">
        <div class="modal-dialog">
            <form action="VilleController" method="post">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title"><strong>Ajouter une Ville</strong></h5>
                        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <label class="custom-modal-label" for="Name">Nom</label>
                        <input type="text" name="nom" class="form-control" required><br><br>
                    </div>
                    <div class="modal-footer">
                        <input type="submit" class="btn btn-light-purple" value="Enregistrer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- update ville Modal -->
    <div class="modal fade" id="ModifyvilleModal" tabindex="-1">
        <div class="modal-dialog">
            <form action="VilleController" method="post">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title"><strong>Modifier une ville</strong></h5>
                        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>                           
                        </button>
                    </div>
                    <div class="modal-body">

                        <label class="custom-modal-label" for="Name">Nom</label>
                        <input type="text" name="nom" class="form-control" id="modalvilleName" required><br><br>

                        <input type="hidden" name="action" value="edit">
                        <input type="hidden" name="id" id="modalvilleId">
                    </div>
                    <div class="modal-footer">
                        <input type="submit" class="btn btn-light-purple" value="Enregistrer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    
    <div class="d-flex justify-content-between align-items-center mb-4">
    <a href="" ></a>
        <button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#villeModalCenter">
                    Ajouter une Ville
        </button>
    </div>
    <!--  voir tous les villes-->
    <table class="table table-bordered border-primary table-striped">
        <thead class="thead-light">
            <tr>
                <th>ID</th>

                <th>Nom</th>
                <th>Supprimer</th>
                <th>Modifier</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${villes}" var="ville">
            <tr>
                <td>${ville.id}</td>

                <td>${ville.nom}</td>
                <td>
                    <button type="submit" class="btn btn-danger" onclick="confirmDelete('${ville.id}')">Supprimer</button>                   
                </td>
                <td >
                   <button type="button" class="btn btn-success" data-toggle="modal" data-target="#ModifyvilleModal" data-ville-id="${ville.id}" data-ville-name="${ville.nom}">
                    Modifier
                    </button>
                </td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
    
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>
    $('#ModifyvilleModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var villeId = button.data('ville-id');          
        var villeName = button.data('ville-name');
        var modal = $(this);
        modal.find('#modalvilleName').val(villeName);          
        modal.find('#modalvilleId').val(villeId);
    });
    function confirmDelete(id) {
            Swal.fire({
                title: 'Confirmation de suppression',
                text: 'Êtes-vous sûr de vouloir supprimer cette ville ?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Oui, supprimer',
                cancelButtonText: 'Annuler'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = 'VilleController?action=delete&id=' + id;
                }
            });
        }
</script>


</body>
</html>