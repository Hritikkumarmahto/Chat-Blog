<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>


        <%@include file="Navbar.jsp" %>
        <main class="d-flex justify-content-center align-items-center vh-100 myNavColor">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-4">

                        <div class="card shadow-lg">
                            <div class="card-header text-center myNavColor text-black">
                                <h4>Login Page</h4>
                            </div>
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

                           

                            <div class="card-body">
                                <p class="text-center text-muted">Enter your credentials to access your account.</p>
                                <form action="LoginServlet" method="POST">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email Address</label>
                                        <input name="email" required type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
                                        <!--                                <small class="form-text text-muted">We'll never share your email with anyone.</small>-->
                                    </div>
                                    <div class="form-group mt-3">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter password">
                                    </div>

                                    <button type="submit" class="btn btn-primary myNavColor w-100 mt-3 text-black">Login</button>
                                    <div class="card-footer text-center text-muted">
                                        Don't have an account? <a href="RegisterPage.jsp" class="text-primary">Sign Up</a>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </main>





        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
