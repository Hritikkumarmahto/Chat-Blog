<%@page import="com.tech.blog.helper.connectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    </head>
    <body>
        <%@include file="Navbar.jsp" %>

        <!-- Banner -->
        <div class="container-fluid m-0 p-0">
            <div class="container-fluid m-0 p-0">
                <div class="row align-items-center justify-content-center text-center myNavColor" style="min-height: 100vh;">
                    <div class="col-md-10 col-lg-8">
                        <div class="jumbotron py-5">
                            <h3 class="display-3">Welcome to Tech Blog</h3>
                            <br>
                            <h5>Stay Ahead in Tech: Your Source for Latest Trends, Tutorials, and News</h5>
                            <p>Explore the world of technology with expert insights, coding tips, gadget reviews, and more. Whether you're a beginner or pro, our concise and informative content keeps you updated on the innovations shaping the future.</p>
                            <p><strong>Join thousands of tech enthusiasts and start your journey today!</strong></p>
                            <a href="RegisterPage.jsp" class="btn btn-outline-secondary"> 
                                <span class='fa fa-line-chart'></span> Start, it's Free!
                            </a>
                            <a href="login_page.jsp" class="btn btn-outline-secondary"> 
                                <span class="fa fa-user-o"></span> Login
                            </a>

                        </div>
                    </div>
                </div>  
            </div>



            <!--        cards-->

            <div class="container">
                <div class='row justify-content-center my-4'>
                    <div class='col-md-4'>
                        <div class="card p-3 shadow-lg" style="width: 18rem; margin: 20px;">
                            <div class="card-body">
                                <h5 class="card-title">Java Programming</h5>
                                <p class="card-text">Oracle has released Java 23, introducing 12 JDK Enhancement Proposals to boost developer productivity and enhance platform performance, stability, and security.</p>
                                <a href="#" class="btn myNavColor">Know More...</a>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-4'>
                        <div class="card p-3 shadow-lg" style="width: 18rem; margin: 20px;">
                            <div class="card-body">
                                <h5 class="card-title">Java Programming</h5>
                                <p class="card-text">Oracle has released Java 23, introducing 12 JDK Enhancement Proposals to boost developer productivity and enhance platform performance, stability, and security.</p>
                                <a href="#" class="btn myNavColor">Know More...</a>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-4'>
                        <div class="card p-3 shadow-lg" style="width: 18rem; margin: 20px;">
                            <div class="card-body">
                                <h5 class="card-title">Java Programming</h5>
                                <p class="card-text">Oracle has released Java 23, introducing 12 JDK Enhancement Proposals to boost developer productivity and enhance platform performance, stability, and security.</p>
                                <a href="#" class="btn myNavColor">Know More...</a>
                            </div>  
                        </div>
                    </div>

                </div>
                <div class='row justify-content-center my-4'>
                    <div class='col-md-4'>
                        <div class="card p-3 shadow-lg" style="width: 18rem; margin: 20px;">
                            <div class="card-body">
                                <h5 class="card-title">Java Programming</h5>
                                <p class="card-text">Oracle has released Java 23, introducing 12 JDK Enhancement Proposals to boost developer productivity and enhance platform performance, stability, and security.</p>
                                <a href="#" class="btn myNavColor">Know More...</a>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-4'>
                        <div class="card p-3 shadow-lg" style="width: 18rem; margin: 20px;">
                            <div class="card-body">
                                <h5 class="card-title">Java Programming</h5>
                                <p class="card-text">Oracle has released Java 23, introducing 12 JDK Enhancement Proposals to boost developer productivity and enhance platform performance, stability, and security.</p>
                                <a href="#" class="btn myNavColor">Know More...</a>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-4'>
                        <div class="card p-3 shadow-lg" style="width: 18rem; margin: 20px;">
                            <div class="card-body">
                                <h5 class="card-title">Java Programming</h5>
                                <p class="card-text">Oracle has released Java 23, introducing 12 JDK Enhancement Proposals to boost developer productivity and enhance platform performance, stability, and security.</p>
                                <a href="#" class="btn myNavColor">Know More...</a>
                            </div>  
                        </div>
                    </div>

                </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
            <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
            <script src="js/myjs.js" type="text/javascript"></script>


    </body>
</html>
