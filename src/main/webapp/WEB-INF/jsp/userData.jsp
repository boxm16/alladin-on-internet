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

        <title>User Data</title>
    </head>
    <body>
        <section class="login-block">
            <div class="container">
                <div class="row">


                    <spring:form modelAttribute="user" cssClass="login-form" action="${pageContext.request.contextPath}/registerFormHandling.htm" method="POST">  
                        <div class="col-md-4 login-sec">
                            <h2 class="text-center">User Data</h2>
                            <div class="form-group">
                                <spring:label path="firstName" cssClass="text-uppercase">ΟΝΟΜΑ</spring:label>
                                <spring:input cssClass="form-control" path="firstName"/> 
                                <spring:errors path="firstName" cssClass="error error-message"/>

                            </div>  

                            <div class="form-group">
                                <spring:label path="password" cssClass="text-uppercase">PASSWORD</spring:label>
                                <spring:password  cssClass="form-control" path="password"/> 
                                <spring:errors path="password" cssClass="error error-message"/>

                            </div>  
                            <div class="form-group">
                                <spring:label path="lastName" cssClass="text-uppercase">ΕΠΩΝΥΜΟ</spring:label>
                                <spring:password   cssClass="form-control" path="lastName"/> 
                                <spring:errors path="lastName" cssClass="error error-message"/>

                            </div>  
                            <div class="form-group">
                                <spring:label path="landlinePhone" cssClass="text-uppercase">ΣΤΑΘΕΡΟ ΤΗΛΕΦΩΝΟ</spring:label>
                                <spring:input   cssClass="form-control" path="landlinePhone"/> 
                                <spring:errors path="landlinePhone" cssClass="error error-message"/>

                            </div>  
                            <div class="form-group">
                                <spring:label path="mobilePhone" cssClass="text-uppercase">ΚΙΝΗΤΟ ΤΗΛΕΦΩΝΟ</spring:label>
                                <spring:input   cssClass="form-control" path="mobilePhone"/> 
                                <spring:errors path="mobilePhone" cssClass="error error-message"/>

                            </div>  
                            <div class="form-group">
                                <spring:label path="district" cssClass="text-uppercase">ΠΕΡΙΟΧΗ</spring:label>
                                <spring:select path="district" cssClass="form-control" id="district" onchange="myFunc()">
                                    <spring:option value="NONE" label="--- Select ---"/>
                                    <spring:options items="${districts}" />
                                </spring:select>
                                <spring:errors path="district" cssClass="error error-message"/>
                            </div>  

                            <div class="form-group">
                                <spring:label path="postalCode" cssClass="text-uppercase">ΤΑΧΥΔΡΟΜΙΚΟΣ ΚΩΔΙΚΑΣ</spring:label>
                                <spring:select path="postalCode" cssClass="form-control">
                                    <spring:option value="NONE" label="--- Select ---"/>
                                    <spring:options items="${jj}" />
                                </spring:select>
                                <spring:errors path="postalCode" cssClass="error error-message"/>
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
        <script>

            function myFunc() {
                var selectedDistrict = $("#district").val();
                alert(selectedDistrict);
                $.ajax({url: 'getPostalCodes.htm?district=' + selectedDistrict, contentType: 'application/json; charset=UTF-8',
                    success: function (result1) {
                        var jsonobj1 = $.parseJSON(result1);

                        //  $('table').text("SELECT AVAILABLE PLAYERS FOR YOUR GAME").appendTo('#output1');


                        $(function () {
                            $.each(jsonobj1, function (i, item) {
                                $('<tr>').append(
                                        $('<td>').text(item.username),
                                        $('<td>').text(item.teamwork),
                                        $('<td>').text(item.athletism),
                                        $('<td>').text(item.technique),
                                        $('<td>').append('<a href="${pageContext.request.contextPath}/handleGameRequests.htm?user_to_be_invited=' + item.player + '&game=' + courtReservationId + '">' + "Send Request" + '</a>')).appendTo('#output1');
                            });

                        });
                    }
                });
            }
        </script>
    </body>
</html>
