#!minibottle/bin/python
from bottle import route, run, debug, template, request, static_file
import json
import serial
import time


serialArduino = serial.Serial()
serialArduino.port = "/dev/ttyUSB0"
serialArduino.baudrate = 115200
serialArduino.timeout = 0.03
serialArduino.close()


try: 
    serialArduino.open()
except Exception, e:
    print "error open serial port: " + str(e) + ". Check cable."
    exit()


def getDataFromArduino():
    serialArduino.write(bytes(b'!'))
    serialArduino.flush()
#    time.sleep(0.1)
    strData = serialArduino.readline().strip()
    serialArduino.readline().strip() 			#    K A S T Y L I S C H E     !!!!!!
    arrData = strData.split(';')
    return (arrData)

def setDataToArduino(a,b,c):
    serialArduino.write(bytes(a + ';' + b + ';' + c + ';;!'))
    serialArduino.flush
#    time.sleep(0.1)
    return ()


@route('/static/:filename#.*#')
def send_static(filename):
    return static_file(filename, root='./static/')

@route('/img/<filename>')
def send_image(filename):
    return static_file(filename,
                       root='./static/img',
                       mimetype='image/png')

@route('/add_numbers')
def add_numbers():
    a = request.params.get('a', 0, type=int)
    b = request.params.get('b', 0, type=int)
    return json.dumps({'result': a+b})
	
	
@route('/ajaxphp')
def ajaxphp():
    a = request.params.get('a', 0, type=int)
    b = request.params.post('b', 0, type=int)
    return json.dumps({'result': a+b})

	
@route('/bUPclicked')
def bUPclicked(): 
    arrData = getDataFromArduino()
    bUPresult = int(arrData[0]) + 10
    setDataToArduino(str(bUPresult),arrData[1],arrData[2])
    print('log> UP: ' + str(arrData))
    return json.dumps({'result': bUPresult})

	
@route('/bDOWNClicked')
def bDOWNClicked():
    arrData = getDataFromArduino()
    bDOWNresult = int(arrData[0]) - 10
    setDataToArduino(str(bDOWNresult),arrData[1],arrData[2])
    print('log> DOWN: ' + str(arrData))
    return json.dumps({'result': bDOWNresult})


@route('/bLEFTclicked')
def bLEFTclicked(): 
    arrData = getDataFromArduino()
    bLEFTclick = int(arrData[2]) - 50
    setDataToArduino(arrData[0],arrData[1],str(bLEFTclick))
    print('log> LEFT: ' + str(arrData))
    return json.dumps({'result': bLEFTclick})


@route('/bRIGHTclicked')
def bRIGHTclicked():
    arrData = getDataFromArduino()
    bRIGHTclick = int(arrData[2]) + 50
    setDataToArduino(arrData[0],arrData[1],str(bRIGHTclick))
    print('log> RIGHT: ' + str(arrData))
    return json.dumps({'result': bRIGHTclick})
	
@route('/bSTOPclicked')
def bSTOPclicked():
    arrData = getDataFromArduino()
    setDataToArduino(str('0'),arrData[1],arrData[2])
    print('log> RIGHT: ' + str(arrData))
    return json.dumps({'result': bSTOPclick})


@route('/')
def index():
    arrArduinoData=getDataFromArduino()
    print(arrArduinoData)
    return template('templates/index.tpl', request=request, arduinoData=arrArduinoData)

debug(True)
run(host = '0.0.0.0', port = '8000')
