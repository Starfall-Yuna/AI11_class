import requests, json
from flask import Flask,request,jsonify,abort
import sys
application = Flask(__name__)


 @application.route("/mytalk", methods=['POST'])
 def mytalk():
    print(request.get_json()) # 여기서 user_key 확인함
    authorization_key = '5YlPTtw4SrqjmQXLieja'
    headers = {
        'Content-Type' : 'application/json;charset=UTF-8',
        'Authorization' : authorization_key
    }
    user_key = 'LkUTPa3r7TiF_hqymXT8AQ' # request.get_json() 의 ['user'] 값
    data = {
        'event' : 'send',
        'user':user_key,
        'textContent':{'text':'Hello World!'}
    }
    message = json.dumps(data)
    response = requests.post('https://gw.talk.naver.com/chatbot/v1/event',
                            headers=headers,
                            data=message)

if __name__ == "__main__":
    application.run(host='0.0.0.0', port=5000)
