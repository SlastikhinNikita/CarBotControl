

<script type="text/javascript">
  $(function() {
    var buttonUPClick = function(e) {
      $.getJSON('bUPclicked', 
	    function(data) {
        $('#bUPclick').text(data.result);
      });  
      return false;
    };
    var buttonDOWNClick = function(e) {
      $.getJSON('bDOWNClicked', 
	    function(data) {
        $('#bDOWNclick').text(data.result);
      });  
      return false;
    };	
    var buttonLEFTClick = function(e) {
      $.getJSON('bLEFTclicked', 
	    function(data) {
        $('#spin').text(data.result);
      });  
      return false;
    };		
    var buttonRIGHTClick = function(e) {
      $.getJSON('bRIGHTclicked', 
	    function(data) {
        $('#spin').text(data.result);
      });  
      return false;
    };	
    var buttonSTOPClick = function(e) {
      $.getJSON('bSTOPclicked', 
	    function(data) {
        $('#spin').text(data.result);
      });  
      return false;
    };			
	
    $('#buttonUPClick').bind('click', buttonUPClick);
    $('#buttonDOWNClick').bind('click', buttonDOWNClick);
    $('#buttonLEFTClick').bind('click', buttonLEFTClick);
    $('#buttonRIGHTClick').bind('click', buttonRIGHTClick);
    $('#buttonSTOPClick').bind('click', buttonSTOPClick);

  
	$(document).keydown(function(event){
		var keycode = (event.keyCode ? event.keyCode : event.which);
		if(keycode == '38'){
			buttonUPClick();	
		}
		if(keycode == '40'){
			buttonDOWNClick();	
		}
		if(keycode == '37'){
			buttonLEFTClick();	
		}
		if(keycode == '39'){
			buttonRIGHTClick();	
		}
		if(keycode == '32'){
			buttonSTOPClick();	
		}
	});

});
  
  
  

</script>


<!----
<p>
  <input type="text" size="5" name="a"> +
  <input type="text" size="5" name="b"> =
  <span id="result">?</span>
<p><a href=# id="calculate">calculate server side</a>
----->





<table class="table table-striped" style="width: 500px;">
	<tbody>
		<tr>
			<td></td>
			<td><input name="UP" class="btn btn-sm btn-primary" id="buttonUPClick" type="button" value="UP" /></td>
			<td></td>
		</tr>
		<tr>
			<td><input name="LEFT" class="btn btn-sm btn-primary" id="buttonLEFTClick" type="button" value="LEFT" /></td>
			<td><input name="DOWN" class="btn btn-sm btn-primary" id="buttonDOWNClick" type="button" value="DOWN" /></td>
			<td><input name="RIGHT" class="btn btn-sm btn-primary" id="buttonRIGHTClick" type="button" value="RIGHT" /></td>
		</tr>
		<tr>
			<td></td>
			<td><input name="STOP" class="btn btn-sm btn-danger" id="bSTOP" type="button" value="STOP" /></td>
			<td></td>
		</tr>
	</tbody>
</table>
