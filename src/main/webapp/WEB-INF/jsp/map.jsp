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
                    <input type="number" id="lat">
                    <input type="number" id="alt">
                    <button onclick="bu()">Click</button>
                </div><!-- /.8 -->

            </div> <!-- /.row-->

        </div> <!-- /.container-->

        <div id="map"></div>

        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCCyRVA60P_cw-KswNxngA-CUyYmJM1LLg"></script>
        <script ">
                        function bu() {
                            var lat=document.getElementById("lat").value;
                            var alt=document.getElementById("alt").value;
                            
                            var myLatlng = new google.maps.LatLng(lat, alt);
                            var mapOptions = {
                                zoom: 15,
                                center: myLatlng
                            }
                            var map = new google.maps.Map(document.getElementById("map"), mapOptions);

                            var marker = new google.maps.Marker({
                                position: myLatlng,
                                title: "Hello World!"
                            });

// To add the marker to the map, call setMap();
                            marker.setMap(map);
                        }

                        $(function () {

                            function initMap() {

                                var location = new google.maps.LatLng(50.0875726, 14.4189987);

                                var mapCanvas = document.getElementById('map');
                                var mapOptions = {
                                    center: location,
                                    zoom: 16,
                                    panControl: false,
                                    scrollwheel: true,
                                    mapTypeId: 'satellite'
                                }
                                var map = new google.maps.Map(mapCanvas, mapOptions);



                                var marker = new google.maps.Marker({
                                    position: location,
                                    map: map,

                                });

                                var contentString = '<div class="info-window">' +
                                        '<h3>Info Window Content</h3>' +
                                        '<div class="info-content">' +
                                        '<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>' +
                                        '</div>' +
                                        '</div>';

                                var infowindow = new google.maps.InfoWindow({
                                    content: contentString,
                                    maxWidth: 400
                                });

                                marker.addListener('click', function () {
                                    infowindow.open(map, marker);
                                });

                              //  var styles = [{"featureType": "landscape", "stylers": [{"saturation": -100}, {"lightness": 65}, {"visibility": "on"}]}, {"featureType": "poi", "stylers": [{"saturation": -100}, {"lightness": 51}, {"visibility": "simplified"}]}, {"featureType": "road.highway", "stylers": [{"saturation": -100}, {"visibility": "simplified"}]}, {"featureType": "road.arterial", "stylers": [{"saturation": -100}, {"lightness": 30}, {"visibility": "on"}]}, {"featureType": "road.local", "stylers": [{"saturation": -100}, {"lightness": 40}, {"visibility": "on"}]}, {"featureType": "transit", "stylers": [{"saturation": -100}, {"visibility": "simplified"}]}, {"featureType": "administrative.province", "stylers": [{"visibility": "off"}]}, {"featureType": "water", "elementType": "labels", "stylers": [{"visibility": "on"}, {"lightness": -25}, {"saturation": -100}]}, {"featureType": "water", "elementType": "geometry", "stylers": [{"hue": "#ffff00"}, {"lightness": -25}, {"saturation": -97}]}];

                             //   map.set('styles', styles);


                            }

                            google.maps.event.addDomListener(window, 'load', initMap);
                        });
        </script>
    </body>
</html>
