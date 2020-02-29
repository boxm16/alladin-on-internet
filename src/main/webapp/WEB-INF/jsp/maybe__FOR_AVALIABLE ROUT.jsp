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
                                <spring:select path="district" cssClass="form-control" id="district" onchange="getPostalCodes()">
                                    <spring:option value="NONE" label="--- Select ---"/>
                                    <spring:options items="${districts}" />
                                </spring:select>
                                <spring:errors path="district" cssClass="error error-message"/>
                            </div>  

                            <div class="form-group">
                                <spring:label path="postalCode" cssClass="text-uppercase">ΤΑΧΥΔΡΟΜΙΚΟΣ ΚΩΔΙΚΑΣ</spring:label>
                                <spring:select path="postalCode" cssClass="form-control" id="postalCode" onchange="getStreets()">
                                    <spring:option value="NONE" label="--- Select ---"/>
                                </spring:select>
                                <spring:errors path="postalCode" cssClass="error error-message"/>
                            </div> 
                            <div class="form-group">
                                <spring:label path="street" cssClass="text-uppercase">ΟΔΟΣ</spring:label>
                                <spring:select path="street" cssClass="form-control">
                                    <spring:option value="NONE" label="--- Select ---"/>
                                </spring:select>
                                <spring:errors path="street" cssClass="error error-message"/>
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

            function getPostalCodes() {
                var selectedDistrict = $("#district").val();

                $.ajax({url: 'getPostalCodes.htm?district=' + selectedDistrict, contentType: 'application/json; charset=UTF-8',

                    success: function (result) {
                        var jsonObj = $.parseJSON(result);
                        var postalCode = $('#postalCode');
                        postalCode.empty();
                        $.each(jsonObj, function (i, item) {
                            postalCode.append(
                                    $('<option>').text(item)
                                    );
                        });

                    },

                    error: function (data) {
                        alert(data);
                    }

                });
            }
            
            function getStreets() {
                var selectedPostalCode = $("#postalCode").val();

                $.ajax({url: 'getStreets.htm?postalCode=' + selectedPostalCode, contentType: 'application/json; charset=UTF-8',

                    success: function (result) {
                        alert(result);
                        var jsonObj = $.parseJSON(result);
                        var streets = $('#street');
                        streets.empty();
                        $.each(jsonObj, function (i, item) {
                            streets.append(
                                    $('<option>').text(item)
                                    );
                        });

                    },

                    error: function (data) {
                        alert(data);
                    }

                });
            }
        </script>
    </body>
</html>
