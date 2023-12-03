<%@page import="entities.Ville"%>
<%@page import="entities.Hotel"%>
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
        <h2 class="display-5"><strong>Liste des
            <small class="text-muted">Hotels par Ville
            </small>
        </strong></h2>
    </div>
    
    <main style="margin-top: 58px;">
        <div class="container border mt-4 py-4">
            <form action="HotelVilleController" class="mb-4"
                    onsubmit="return validateForm()" method="post">
                <div class="row">
                    <div class="col">
                        <select class="form-select" aria-label="Default select example"
                                name="ville">
                            <option selected value="">Sélectionner une ville</option>

                            <c:forEach items="${villes}" var="v">
                                    <option value="${v.id}">${v.nom}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col">
                            <input type="submit" class="btn btn-outline-primary" value="Chercher" />
                    </div>
                </div>
            </form>
            <table class="table table-bordered border-primary table-striped">
                <thead class="thead-light">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Nom</th>
                        <th scope="col">Télephone</th>
                        <th scope="col">Adresse</th>

                        <th scope="col">Ville</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${hotels}" var="v">
                        <tr>
                            <th scope="row">${v.id}</th>
                            <td>${v.nom}</td>
                            <td>${v.telephone}</td>
                            <td>${v.adresse}</td>

                            <td>${v.ville.nom}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </main>
<script type="text/javascript">
    function validateForm() {
            var ville = document.getElementsByName("ville")[0].value;

            if (ville.trim() === '') {
                    alert("Selectionner une ville d'abbord.");
                    return false;
            }
            return true;
    }
</script>
</body>
</html>
