<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp"%>
<%@page import="com.tech.blog.entities.User"%>

<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect(".jsp");
        return;
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg myNavColor">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp"><span class="fa fa-rss"></span>Tech Blog</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#"><span class="fa fa-institution"></span>Home</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><spam class="fa fa-database"></spam>
                                Categories
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Programing</a></li>
                                <li><a class="dropdown-item" href="#"> Data Science</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">Project's</a></li>
                            </ul>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><spam class="fa fa-address-book-o"></spam> Contact</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav mr-right">
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#profileModal">

                                <span class="fa fa-user"></span> <%= user.getName()%>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="LogoutServlet"><span class="fa fa-mail-forward"> Log Out</span></a>
                        </li>

                    </ul>

                </div>
            </div>
        </nav>
        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>
        <div class="alert alert-danger" role="alert">
            <%= m.getContent()%>
        </div>
        <%
                // It's good practice to remove the message from the session after displaying it
                session.removeAttribute("msg");
            }
        %>
        <!-- Profile modal -->



        <!-- Profile Modal -->
        <div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="profileModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="profileModalLabel" style="background:myNavColor">Tech Blog</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body text-center">
                        <img src="<%= user.getProfile() != null && !user.getProfile().isEmpty() ? "pics/" + user.getProfile() : "pics/default.png"%>" alt="Profile Photo" class="img-fluid rounded-circle mb-3" width="150" height="150">

                        <h4><%= user.getName()%></h4>
                        <div id="profile-details">
                            <table class="table table-bordered">

                                <tr>
                                    <th>Email</th>
                                    <td><%= user.getEmail() != null ? user.getEmail() : "Not Provided"%></td>
                                </tr>
                                <tr>
                                    <th>Gender</th>
                                    <td><%= user.getGender() != null ? user.getGender() : "Not Provided"%></td>
                                </tr>
                                <tr>
                                    <th>About</th>
                                    <td><%= user.getAbout() != null ? user.getAbout() : "Not Provided"%></td>
                                </tr>
                                <tr>
                                    <th>Registered Date</th>
                                    <td><%= user.getDateTime() != null ? user.getDateTime() : "Not Provided"%></td>
                                </tr>
                            </table>
                        </div>
                        <div id="profile-edit" style="display:none;">


                            <form action="EditServlet" method="POST" enctype="multipart/form-data">
                                <table class="table">

                                    <tr>
                                        <td>Email: </td>
                                        <td><input type="email" class="form-control" name="user-email"value="<%= user.getEmail()%>"</td>

                                    </tr>
                                    <tr>
                                        <td>Name: </td>
                                        <td><input type="text" class="form-control" name="user-name"value="<%= user.getName()%>"</td>

                                    </tr>
                                    <tr>
                                        <td>Password:</td>
                                        <td><input type="password" class="form-control" name="user-password"value="<%= user.getPassword()%>"</td>

                                    </tr>
                                    <tr>
                                        <td>Gender: </td>
                                        <td><%= user.getGender().toUpperCase()%></td>
                                    </tr>
                                    <tr>
                                        <td>About: </td>
                                        <td>
                                            <textarea rows="3" class="form-control" name="user-about" ><%=user.getAbout()%>
                                                 
                                            </textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>New Profile Picture:</td>
                                        <td>
                                            <input type="file" name="image" class="form-control">
                                        </td>
                                    </tr>
                                </table>
                                <div class="conatainer">
                                    <button type="submit" class="btn btn-outline  myNavColor">save</button>

                                    </button>
                                </div>
                            </form>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button id="edit-profile-button" type="button" class="btn btn-primary" >Edit</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

        <script>
            $(document).ready(function () {
                let statusEdit = false;
                $('#edit-profile-button').click(function () {
                    if (statusEdit == false) {
                        $("#profile-details").hide();
                        $("#profile-edit").show();
                        statusEdit = true;
                        $(this).text("Back");
                    } else {
                        $("#profile-details").show();
                        $("#profile-edit").hide();
                        statusEdit = false;
                        $(this).text("Edit");
                    }
                })
            })
        </script>
    </body>

</html>
