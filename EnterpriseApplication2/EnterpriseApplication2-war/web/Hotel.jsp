<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
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
    <title>Hotels List</title>
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
                            <img src="docs/administration.png" alt="" width="40" height="40" class="d-inline-block align-text-top">
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
                <small class="text-muted">Hotels</small>
            </strong></h2>
        </div>
        <div class="d-flex justify-content-between align-items-center mb-4">
        <a href="" ></a>
            <button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#exampleModalCenter">
                Ajouter un Hotel
            </button>
         </div>
      
        <!-- Add hotel Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1">
            <div class="modal-dialog">
                <form action="HotelController" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title"><strong>Ajouter un Hotel</strong></h5>
                            <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <label class="custom-modal-label" for="nom">Nom</label>
                            <input type="text" name="nom" class="form-control" required><br><br>

                            <label class="custom-modal-label" for="telephone">Telephone</label>
                            <input type="text" name="telephone" class="form-control" required><br><br>
                            <label class="custom-modal-label" for="adresse">Adresse</label>
                            <input type="text" name="adresse" class="form-control" required><br><br>

                            <label class="custom-modal-label" for="ville">Ville</label>
                            <select name="ville" class="form-control" required>
                                <option value="" disabled selected>Sélectionner une ville</option>
                                <c:forEach items="${villes}" var="ville">
                                    <option value="${ville.id}">${ville.nom}</option>
                                </c:forEach>
                            </select>
                            
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-light-purple" value="Enregistrer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        
        <!-- Update hotel Modal -->
        <div class="modal fade" id="ModifyStudentModal" tabindex="-1">
            <div class="modal-dialog">
                <form action="HotelController" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title"><strong>Modifier un hotel</strong></h5>
                            <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <label class="custom-modal-label" for="nom">Nom</label>
                            <input type="text" name="nom" class="form-control" id="modalStudentnom" required><br><br>

                            <label class="custom-modal-label" for="telephone">Telephone</label>
                            <input type="text" name="telephone" class="form-control" id="modalStudentTelephone" required><br><br>

                            <label class="custom-modal-label" for="adresse">Adresse</label>
                            <input type="text" name="adresse" class="form-control" id="modalStudentadresse" required><br><br>

                           
                            <label class="custom-modal-label" for="ville">Ville</label>
                            <select name="ville" class="form-control" id="modalStudentville" required>                              
                                <c:forEach items="${villes}" var="ville">
                                    <option value="${ville.id}">${ville.nom}</option>
                                </c:forEach>
                            </select>

                            <input type="hidden" name="action" value="edit">
                            <input type="hidden" name="id" id="modalStudentId">
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-light-purple" value="Enregistrer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <table class="table table-bordered border-primary table-striped">
            <thead class="thead-light">
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                   
                    <th>Telephone</th>
                    <th>Adresse</th>
                    
                    <th>Ville</th>
                   
                    <th>Supprimer</th>
                    <th>Modifier</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${hotels}" var="hotel">
                    <tr>
                        <td>${hotel.id}</td>
                        <td>${hotel.nom}</td>
                        <td>${hotel.telephone}</td>
                        <td>${hotel.adresse}</td>                    
                        
                        <td>${hotel.ville.nom}</td>
                       
                        <td>
                            <button type="submit" class="btn btn-danger" onclick="confirmDelete('${hotel.id}')">Supprimer</button>                   
                        </td>
                        <td>
                            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#ModifyStudentModal"
                                    data-student-id="${hotel.id}" data-student-adresse="${hotel.adresse}"
                                     data-student-nom="${hotel.nom}"
                                    data-student-telephone="${hotel.telephone}" data-student-ville="${hotel.ville.id}">
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
        $('#ModifyStudentModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var studentId = button.data('student-id');
            var studentadresse = button.data('student-adresse');


            var studentnom = button.data('student-nom');
            var studentTelephone = button.data('student-telephone');
            var studentvilleId = button.data('student-ville');
            var modal = $(this);

            modal.find('#modalStudentadresse').val(studentadresse);
          
            modal.find('#modalStudentnom').val(studentnom);
            modal.find('#modalStudentTelephone').val(studentTelephone);
            modal.find('#modalStudentville option[value="' + studentvilleId + '"]').prop('selected', true);
            modal.find('#modalStudentId').val(studentId);
        });

        $('#AssignRoleModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var studentId = button.data('student-id');
            var modal = $(this);

            modal.find('#modalAssignRoleStudentId').val(studentId);
        });
        function confirmDelete(id) {
            Swal.fire({
                title: 'Confirmation de suppression',
                text: 'Êtes-vous sûr de vouloir supprimer cet hotel ?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Oui, supprimer',
                cancelButtonText: 'Annuler'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = 'HotelController?action=delete&id=' + id;
                }
            });
        }
 </script>
</body>
</html>
