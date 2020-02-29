<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADDRESS</title>
       

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


        <style>
            body {
                font-family: 'Montserrat', sans-serif;
            }
            h1{
                text-transform: uppercase; letter-spacing: 0.06em; margin-bottom: 40px;
            }

            #map {
                width: 100%; height: 400px; margin-top: 40px; margin-bottom: 40px;
            }

            .info-window {
                font-family: 'Montserrat', sans-serif;
            }
            .info-content {
                color: #999;
            }


        </style>
    </head>
    <body>

        <div class="container">
            <div class="row">
                <div class="col-sm">
                    <nav class="navbar active navbar-light navbar-expand-md bg-primary justify-content-center">
                        <a href="${pageContext.request.contextPath}/customerMainPage.htm" class="navbar-brand d-flex w-50 mr-auto"><b>Home</b></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsingNavbar3">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="navbar-collapse collapse w-100" id="collapsingNavbar3">
                            <ul class="navbar-nav w-100 ">
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/newPickUp.htm">NEW PICK-UP</a>
                                </li>
                            </ul>

                            <ul class="navbar-nav w-100 justify-content-center">
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/archive.htm">ARCHIVE</a>
                                </li>

                            </ul> 
                            <ul class="nav navbar-nav ml-auto w-100 justify-content-end">

                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/account.htm">ACCOUNT</a>
                                </li>

                            </ul>

                            <ul class="nav navbar-nav ml-auto w-100 justify-content-end">
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/Logout.htm">ΑΠΟΣΥΝΔΕΣΗ</a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <h1><center>Your contact information</center></h1>

                    <hr>
                    <div class="row">
                        <div class="col-sm-8 ">
                            <h6><i>Type your address to find on map</i></h6>
                            <br>
                            <input id="address" type="text" style="width:600px;"/>
                            <br><br>
                            <input id="submit"  type="button" value="Click to find your address on the map">

                            <h6><i>Drag the marker on the map to pin your address</i></h6>
                            <div id="map"></div>
                            <input type="text" id="latitude" placeholder="Latitude" readonly="redonly"/>
                            <input type="text" id="longitude" placeholder="Longitude" readonly="redonly"/>

                        </div>

                        <div class="col-sm-4 ">

                            <spring:form modelAttribute="user" cssClass="login-form" action="${pageContext.request.contextPath}/saveAddress.htm" method="POST">
                                <div>
                                    <spring:input  hidden="hidden"  path="id" /> 
                                </div> 

                                <div class="form-group">
                                    <spring:label path="street" cssClass="text-uppercase" >STREET</spring:label>
                                    <spring:input  cssClass="form-control" path="street" placeholder="Type your street name"/> 
                                    <spring:errors path="street" cssClass="error error-message"/>
                                </div>  
                               

                                <div class="form-group">
                                    <spring:label path="district" cssClass="text-uppercase" >DISTRICT</spring:label>
                                    <spring:input  cssClass="form-control" path="district" placeholder="Type your district name"/> 
                                    <spring:errors path="district" cssClass="error error-message"/>
                                </div> 

                                <div class="form-group">
                                    <spring:label path="postalCode" cssClass="text-uppercase" >POSTAL CODE</spring:label>
                                    <spring:input  cssClass="form-control" path="postalCode" placeholder="Type your postal code"/> 
                                    <spring:errors path="postalCode" cssClass="error error-message"/>
                                </div>  

                                <div class="form-group">
                                    <spring:label path="floor" cssClass="text-uppercase" >FLOOR</spring:label>
                                    <spring:input  cssClass="form-control" path="floor" placeholder="Type your floor number"/> 
                                    <spring:errors path="floor" cssClass="error error-message"/>
                                </div>  

                                <div class="form-group">
                                    <spring:label path="doorbellName" cssClass="text-uppercase" >NAME ON DOORBELL</spring:label>
                                    <spring:input  cssClass="form-control" path="doorbellName" placeholder="Type your doorbell name"/> 
                                    <spring:errors path="doorbellName" cssClass="error error-message"/>
                                </div>  
                                <div class="form-group">
                                    <spring:label path="landlinePhone" cssClass="text-uppercase" >LANDLINE PHONE</spring:label>
                                    <spring:input  cssClass="form-control" path="landlinePhone" placeholder="Type your landline phone number"/> 
                                    <spring:errors path="landlinePhone" cssClass="error error-message"/>
                                </div> 
                                <div class="form-group">
                                    <spring:label path="mobilePhone" cssClass="text-uppercase" >MOBILE PHONE</spring:label>
                                    <spring:input  cssClass="form-control" path="mobilePhone" placeholder="Type your mobile phone number"/> 
                                    <spring:errors path="mobilePhone" cssClass="error error-message"/>
                                </div> 

                                <hr>
                                <button>CONFIRM YOUR CONTACT INFORMATION</button>     <br><br>
                               </spring:form>
                            <hr>
                        </div>

                    </div> 

                </div> 
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <!--
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
                <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCCyRVA60P_cw-KswNxngA-CUyYmJM1LLg&language=el"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


        <script >


            var marker = new google.maps.Marker({
                draggable: true,
                animation: google.maps.Animation.DROP
            });
            var infowindow = new google.maps.InfoWindow({
                maxWidth: 400
            });

            $(function () {

                function initMap() {

                    var location = new google.maps.LatLng(37.971526002790604, 23.72656438908689);

                    var mapCanvas = document.getElementById('map');

                    var mapOptions = {
                        center: location,
                        zoom: 18,
                        panControl: false,
                        scrollwheel: true,
                        mapTypeId: 'satellite'
                    };

                    var map = new google.maps.Map(mapCanvas, mapOptions);

                    marker.setPosition(location);
                    marker.setDraggable(true);
                    marker.setMap(map);


                    marker.addListener('click', function () {
                        infowindow.open(map, marker);
                    });

                    google.maps.event.addListener(marker, 'dragend', function () {

                        geocoder.geocode({'latLng': marker.getPosition()}, function (results, status) {
                            if (status == google.maps.GeocoderStatus.OK) {
                                if (results[0]) {

                                    fu(results[0]);
                                }
                            } else {
                                alert("Out of range");
                            }
                        }
                        );
                    });
                    document.getElementById('submit').addEventListener('click', function () {
                        geocodeAddress(geocoder, map);
                    });
                }
                google.maps.event.addDomListener(window, 'load', initMap);
                var geocoder = new google.maps.Geocoder();

            });



            function geocodeAddress(geocoder, resultsMap) {
                var address = document.getElementById('address').value;
                geocoder.geocode({'address': address}, function (results, status) {
                    if (status === 'OK') {
                        resultsMap.setCenter(results[0].geometry.location);

                        marker.setMap(resultsMap);
                        marker.setPosition(results[0].geometry.location);
                        fu(results[0]);

                    } else {
                        alert('Geocode was not successful for the following reason: ' + status);
                    }
                });
            }

            function fu(results) {
                var address = results.address_components;
                var street = '';
                var street_number = '';
                var district = '';
                var postal_code = '';
                for (var i = 0; i < address.length; i++) {
                    if (address[i].types.includes("route")) {
                        street = address[i].long_name;
                    }

                    if (address[i].types.includes("street_number")) {
                        street_number = address[i].long_name;
                    }

                    if (address[i].types.includes("locality") |
                            address[i].types.includes("administrative_area_level_4") |
                            address[i].types.includes("administrative_area_level_5")) {
                        district = address[i].long_name;
                    }
                    if (address[i].types.includes("postal_code")) {
                        postal_code = address[i].long_name;
                    }
                }

                $('#address').val(results.formatted_address);
                $('#latitude').val(marker.getPosition().lat());
                $('#longitude').val(marker.getPosition().lng());
                $('#street').val(street+" "+street_number);
               $('#district').val(district);
                $('#postalCode').val(postal_code);
                infowindow.setContent(results.formatted_address);
                infowindow.open(map, marker);
            }

        </script>
    </body>
</html>
