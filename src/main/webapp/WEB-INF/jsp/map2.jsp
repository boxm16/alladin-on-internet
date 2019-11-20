<!DOCTYPE html>
<html>
    <head>
        <style>
            * {
                box-sizing: border-box;
            }

            /* Create two unequal columns that floats next to each other */
            .column {
                float: left;
                padding: 10px;
                height: 600px; /* Should be removed. Only for demonstration */
            }

            .left {
                width: 20%;
            }

            .right {
                width: 80%;
            }

            /* Clear floats after the columns */
            .row:after {
                content: "";
                display: table;
                clear: both;
            }
        </style>
    </head>
    <body>

        <h1>My First Google Map</h1>
        <div class="row">
            <div class="column left" style="background-color:#aaa;">
                <input type="text">
                <button onclick="bu()">Click</button>

            </div>
            <div class="column right" style="background-color:#bbb;">

                <div id="googleMap" style="width:100%;height:400px;"></div>
            </div>
        </div>
        <script>
            var mapProp = {
                center: new google.maps.LatLng(-25.300, 131.000),
                zoom: 5,
            };
            var myLatLng = {lat: -25.363, lng: 131.044};
            var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
            function myMap() {

                var marker = new google.maps.Marker({
                    position: myLatLng,
                    map: map,
                    title: 'Hello World!'
                });
            }
        </script>

        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCCyRVA60P_cw-KswNxngA-CUyYmJM1LLg&callback=myMap"></script>

    </body>
</html>