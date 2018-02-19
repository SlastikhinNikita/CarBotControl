<script type="text/javascript" src="http://scriptjava.net/source/scriptjava/scriptjava.js"></script>
<script type="text/javascript">
function SendGet() {
	//отправл¤ю GET запрос и получаю ответ
	$$a({
		type:'get',//тип запроса: get,post либо head
		url:'/ajaxphp',//url адрес файла обработчика
		data:{'q':'1'},//параметры запроса
		response:'text',//тип возвращаемого ответа text либо xml
		success:function (data) {//возвращаемый результат от сервера
			$$('result',$$('result').innerHTML+'<br />'+data);
		}
	});
}

function SendPost() {
	//отправл¤ю POST запрос и получаю ответ
	$$a({
		type:'post',//тип запроса: get,post либо head
		url:'/ajaxphp',//url адрес файла обработчика
		data:{'z':'1'},//параметры запроса
		response:'text',//тип возвращаемого ответа text либо xml
		success:function (data) {//возвращаемый результат от сервера
			$$('result',$$('result').innerHTML+'<br />'+data);
		}
	});
}

function SendHead() {
	//отправл¤ю HEAD запрос и получаю заголовок
	$$a({
		type:'head',//тип запроса: get,post либо head
		url:'/ajaxphp',//url адрес файла обработчика
		response:'text',//тип возвращаемого ответа text либо xml
		success:function (data) {//возвращаемый результат от сервера
			$$('result',$$('result').innerHTML+'<br />'+data);
		}
	});
}
</script>


<div id="result">Тут будет ответ от сервера</div><br /><br />
<div onclick="SendGet();">ќтправить GET запрос через Ajax</div><br />
<div onclick="SendPost();">ќтправить POST запрос через Ajax</div><br />
<div onclick="SendHead();">ќтправить HEAD запрос через Ajax</div><br />