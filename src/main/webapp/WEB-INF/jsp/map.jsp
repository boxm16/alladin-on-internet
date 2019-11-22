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
                    <input id="address" type="text" style="width:600px;"/><br/>
                    <input id="submit" type="button" value="Geocode">
                    <input type="text" id="latitude" placeholder="Latitude"/>
                    <input type="text" id="longitude" placeholder="Longitude"/>
                    <div id="map"></div>
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
                                    $('#address').val(results[0].formatted_address);
                                    $('#latitude').val(marker.getPosition().lat());
                                    $('#longitude').val(marker.getPosition().lng());
                                    infowindow.setContent(results[0].formatted_address);
                                    infowindow.open(map, marker);
                                }
                            }
                        });
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
                        infowindow.setContent(results[0].formatted_address);
                        infowindow.open(map, marker);

                    } else {
                        alert('Geocode was not successful for the following reason: ' + status);
                    }
                });
            }

        </script>
    </body>
</html>
