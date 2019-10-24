<%-- 
    Document   : CustomerAuthorization
    Created on : Apr 7, 2019, 5:15:23 AM
    Author     : boxm1
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ALLADIN</title>
    </head>
    <body>
        <p><h1>ALLADIN</h1></p>
    <br>
    <hr>

    <form autocomplete="on" class="login-form" action="${pageContext.request.contextPath}/loginFormHandling.htm" method="POST">

        <div class="col-md-4 login-sec">
            <h2 class="text-center">Login Now</h2>
            <div class="form-group">
                <label for="inputEmail" class="text-uppercase">Username</label>
                <input class="form-control" id="username" name="email" required="required" type="text" placeholder="e-mail:myemail@mail.com"/>
            </div>
            <div class="form-group">
                <label for="inputPassword" class="text-uppercase">Password</label>
                <input class="form-control" id="password" name="password" required="required" type="password" placeholder="eg. X8df!90EO"/> 
            </div>
            <div class="error-message">${message}</div>
            <div class="form-check">


                <button type="submit" id="submit" class="btn btn-login float-right" style="background-color: #0c00ff">Submit</button>
            </div>
            <div>
                <p class="change_link">
                    Δεν έχεις λογαριασμό ?
                    <a href="${pageContext.request.contextPath}/goToRegisterForm.htm">Φτιάξε το</a>
                </p>
            </div>
        </div>


    </div>   

</div>   
</form>
</body>
</html>
