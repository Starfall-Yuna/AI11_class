import requests, json
from flask import Flask,request,jsonify,abort
import sys
application = Flask(__name__)


# 개발자도구->챗봇api설정->webhook
@application.route("/mytalk", methods=['POST'])
def mytalk():
    
    authorization_key = '5YlPTtw4SrqjmQXLieja'
    
    headers = {
        'Content-Type' : 'application/json;charset=UTF-8',
        'Authorization' : authorization_key
    }

    getReqJson = request.get_json()
    user_key = getReqJson['user']#user 값
    
    userMsg = getReqJson['textContent']['text']
    img = "https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Naver_Logotype.svg/1280px-Naver_Logotype.svg.png"
    # 입력에 따라서 다른 이미지 출력(기본 이미지는 네이버 로고)
    if userMsg.upper()=='GOOGLE':
            img = 'https://www.google.com/logos/doodles/2022/seasonal-holidays-2022-6753651837109831.4-s.png'
    elif userMsg.upper()=='DAUM' or userMsg.upper()=='KAKAO':
            img = 'https://t1.kakaocdn.net/kakaocorp/corp_thumbnail/Kakao.png'
            
    
    
    data = {
        'event':"send",
        'user':user_key,
        "imageContent" : {
            "imageUrl":img
        }
    }
    message = json.dumps(data)
    response = requests.post('https://gw.talk.naver.com/chatbot/v1/event',
                            headers=headers,
                            data=message)

if __name__ == "__main__":
    application.run(host='0.0.0.0', port=5000)
