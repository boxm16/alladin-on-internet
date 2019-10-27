<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="resources/logo.jpg">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        
        <title>Registration</title>
    </head>
    <body>
        <section class="login-block">
            <div class="container">
                <div class="row">


                    <spring:form modelAttribute="user" cssClass="login-form" action="${pageContext.request.contextPath}/registerFormHandling.htm" method="POST">  
                        <div class="col-md-4 login-sec">
                            <h2 class="text-center">ΦΤΙΑΞΕ ΛΟΓΑΡΙΑΣΜΟ</h2>
                                <div class="form-group">
                                    <spring:label path="email" cssClass="text-uppercase">e-mail</spring:label>
                                    <spring:input  cssClass="form-control" path="email"/> 
                                    <spring:errors path="email" cssClass="error error-message"/>

                                </div>  
                             
                                <div class="form-group">
                                    <spring:label path="password" cssClass="text-uppercase">PASSWORD</spring:label>
                                    <spring:password  cssClass="form-control" path="password"/> 
                                    <spring:errors path="password" cssClass="error error-message"/>

                                </div>  
                                <div class="form-group">
                                    <spring:label path="password_confirmation" cssClass="text-uppercase">CONFIRM PASSWORD</spring:label>
                                    <spring:password   cssClass="form-control" path="password_confirmation"/> 
                                    <spring:errors path="password_confirmation" cssClass="error error-message"/>

                                </div>  

                                <button type="submit" id="submit" class="btn btn-login float-right" style="background-color: #0c00ff">Submit</button>
                                <p class="change_link">
                                    Already a member?
                                    <a href="${pageContext.request.contextPath}/index.htm">Go to login page</a>
                                </p>
                        </div>


                    </spring:form> 


                </div>           
            </div>               
        </section>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    </body>
</html>
