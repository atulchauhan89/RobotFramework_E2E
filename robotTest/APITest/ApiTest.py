import requests
import json
import jsonpath
from jsonpath_ng.ext import parse
from json import loads

#API URL
url = "http://post.api/call"

#Read Input File
file = open('D:/DemoProject/RobotFramework_E2E/robotTest/Resources/API/mcseSrcPayload1.json', 'r')

json_input = file.read()
tmp = json.dumps(json_input)
request_json1 = json.loads(tmp)

headers = {'user-agent': 'my-app/0.0.1',
            'Accept' : 'application/json',
            'Content-Type' : 'application/json',
            'Cache-Control' : 'no-cache',
            'Postman-Token' : '191d1122-3f8e-48ac-9b53-eaf35e9e3db8'}

#Make POST Request
response = requests.post(url, request_json1, headers=headers)
#print(response.content)

assert response.status_code == 200

response_json = json.loads(response.text)
print(response_json)

assert response_json["payload"]["promiseList"][0]["id"] == '150'
assert response_json["payload"]["promiseList"][0]["promiseDetails"]["value1"] == 'Value1'
assert response_json["payload"]["promiseList"][0]["promiseDetails"]["value2"] == 'Value2'

# result = parse('$[?(@.name=="' + "payload" + '")]').find(response_json)
# #.properties[?(@.name=="' + "promiseList" + '")]
# print(result)
# shippingSLATier = jsonpath.jsonpath(response_json, 'shippingSLATier')
# print(shippingSLATier)

