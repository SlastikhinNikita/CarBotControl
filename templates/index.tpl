<!DOCTYPE html>
<html lang="ru">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Example</title>

    <!-- Bootstrap -->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="/static/js/html5shiv.min.js"></script>
      <script src="/static/js/respond.min.js"></script>
    <![endif]-->
	<script type="text/javascript" src="/static/js/jquery.min.js"></script>
	<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/static/css/main.css">
  </head>
  
<body>
<h1>DIKOTECH Example</h1>
	<p>{{arduinoData}}</p>
<div class="col-md-5 ">



% include('templates/status.tpl', arduinoData=arduinoData)
 
% include('templates/control.tpl')


<!----
<p>
  <input type="text" size="5" name="a"> +
  <input type="text" size="5" name="b"> =
  <span id="result">?</span>
<p><a href=# id="calculate">calculate server side</a>



---->
</div>

<div class="col-md-5">
% include('templates/video.tpl')
<span id="log">Right text</span>
</div>


  </body>
</html>
