
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <%@include file="Navbar.jsp" %>

        <main class="d-flex justify-content-center align-items-center vh-100 myNavColor">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <div class="card shadow-lg rounded">
                            <div class="card-header text-center  text-black myNavColor">
                                <span class="fa fa-user-plus fa-2x"></span>
                                <h4 class="mt-2">Register Here</h4>
                            </div>
                            <div class="card-body p-4">
                                <form id="reg-form" action="RegisterServlet" method="POST" enctype="multipart/form-data">

                                    <div class="mb-3">
                                        <label for="user_name" class="form-label">Enter Name</label>
                                        <input type="text" class="form-control" id="user_name" name="user_name" placeholder="Enter User Name">
                                    </div>

                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Email address</label>
                                        <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
                                    </div>

                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Select Gender</label>
                                        <div class="d-flex">
                                            <div class="form-check me-3">
                                                <input class="form-check-input" type="radio" id="male" name="gender" value="Male">
                                                <label class="form-check-label" for="male">Male</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" id="female" name="gender" value="Female">
                                                <label class="form-check-label" for="female">Female</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class='mb-3'>
                                        <textarea name="about" class="form-control" rows="5" placeholder="Enter something about yourself"></textarea>
                                    </div>

                                    <div class="mb-3 form-check">
                                        <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Agree to terms and conditions</label>
                                    </div>
                                    <div class="container text-center" id="loader" style="display:none">
                                        <span class="fa fa-spinner fa-spin fa-4x"  ></span>
                                    </div>
                                    <div class="d-flex justify-content-center">
                                        <button id="submit_btn" type="submit" class="btn btn-primary w-50 myNavColor text-black">Submit</button>
                                    </div>

                                </form>

                            </div>

                            <div class="card-footer text-center text-muted">
                                Already have an account? <a href="login_page.jsp" class="text-primary ">Login</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <script>
            $(document).ready(function () {
                console.log("loaded........");

                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();

                    let form = new FormData(this);

                    $("#submit_btn").hide();
                    $("#loader").show();

                    // Send request to RegisterServlet
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        processData: false,
                        contentType: false,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);

                            $("#submit_btn").show();
                            $("#loader").hide();

                            if (data.trim() === 'done') {
                                swal("Success!", "Redirecting to login page!", "success")
                                        .then(() => {
                                            window.location = "login_page.jsp";
                                        });
                            } else {
                                swal("Error!", data, "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#submit_btn").show();
                            $("#loader").hide();
                            swal("Error Occurred", "Try Again", "error");
                        }
                    });
                });
            });


        </script>

    </body>
</html>
