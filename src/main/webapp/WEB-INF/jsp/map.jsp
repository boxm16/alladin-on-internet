<html>
    <head>
        <title>Bootstrap & Google maps Tutorial by Bootstrapious.com</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

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

                <div class="col-lg-8 col-lg-offset-2">
                    <h1>Find your address</h1>
                    <h6><i>Type your address to find on map</i></h6>
                    <input id="address" type="text" style="width:600px;"/><br/>
                    <input id="submit"  type="button" value="Geocode">

                    <h6><i>Drag the marker on the map to pin your address</i></h6>
                    <div id="map"></div>


                    <h3>Street</h3>
                    <input type="text" id="street" placeholder="Street"/>
                    <h3>Street Number</h3>
                    <input type="text" id="street_number" placeholder="Street Number"/>
                    <h3>District</h3>
                    <input type="text" id="district" placeholder="District"/>
                    <h3>Postal Code</h3>
                    <input type="text" id="postal_code" placeholder="Postal Code"/>
                   <h3>Floor</h3>
                    <input type="text" id="floor" placeholder="Floor"/>
                    <h3>Name on Bell</h3>
                    <input type="text" id="bell_name" placeholder="Name on Bell"/>
                    
                    <hr>
                    <button>CONFIRM YOUR ADDRESS</button>     <br><br>
                    <input type="text" id="latitude" placeholder="Latitude"/>
                    <input type="text" id="longitude" placeholder="Longitude"/>
                    <br>
                    <hr>
                </div><!-- /.8 -->

            </div> <!-- /.row-->

        </div> <!-- /.container-->




        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCCyRVA60P_cw-KswNxngA-CUyYmJM1LLg&language=el"></script>
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
                $('#street').val(street);
                $('#street_number').val(street_number);
                $('#district').val(district);
                $('#postal_code').val(postal_code);
                infowindow.setContent(results.formatted_address);
                infowindow.open(map, marker);
            }

        </script>
    </body>
</html>
