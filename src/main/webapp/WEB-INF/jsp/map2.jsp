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

        e-mail sent
    </body>
</html>