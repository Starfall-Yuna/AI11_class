import requests, json
from flask import Flask,request,jsonify,abort
import sys
import urllib.request

application = Flask(__name__)

def naverRequestMsg(msg):
    user_key = msg['user']
    mymsg = msg['textContent']['text']
    authKey = 'u1vwi7ogSn28C9SR7yoK'
    headers = {
        'Content-Type':'application/json;charset=UTF-8',
        'Authorization':authKey
    }
    data = {
        'event' :'send',
        'user':user_key
    }
    result = {}
    result['headers'] = headers
    result['data'] = data
    result['msg'] = mymsg
    return result

def naverMsgReqPost(headers,message):
    requests.post(
        'https://gw.talk.naver.com/chatbot/v1/event',
        headers=headers,
        data=message)
    return None

def kakaoRequestMsg(msg):
    mymsg = msg['userRequest']['utterance']
    res = {
        "version" : "2.0",
        "template" : {
            "outputs" : []
        }
    }
    result = {}
    result['res'] = res
    result['msg'] = mymsg
    return result

def matjipList():
    myurl = 'https://api.odcloud.kr/api/3047940/v1/uddi:633f7dab-ffb5-4843-bc65-bd7f3b99dfa2?page=1&perPage=1000&serviceKey=9xBqP7CqYimcMjtI%2FC65UWk6z1HS%2FSoR6eGctgZYZiZekZxT4ueY7DWmlF9ERi9jD%2BWuZRkJ9KK%2FRqNdei%2Be7Q%3D%3D'
    response = urllib.request.urlopen(myurl)
    response = response.read().decode('utf8')
    data = json.loads(response)
    json_arr = data['data'] #key가 'data'인 것만 갖고 옴
    result = ''
    for item in json_arr:
        result += (f"식당명:{item['상호명']}, 대표메뉴:{item['주메뉴']}\n")
    return result

def lottoInfo(num):
    url = 'https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo='+\
    num
    response = urllib.request.urlopen(url)
    response_msg = response.read().decode('utf8')
    jresponse = json.loads(response_msg)
    lottoData = ''
    if jresponse['returnValue']!='success':
        return '잘못된 표기'
    else:
        lottoData = f"""
        {jresponse['drwtNo1']} {jresponse['drwtNo2']}
        {jresponse['drwtNo3']} {jresponse['drwtNo4']}
        {jresponse['drwtNo5']} {jresponse['drwtNo6']}
        보너스 : {jresponse['bnusNo']}
        """
    return lottoData



@application.route("/")
def hello():
    return "<h1 style='color:red'>Hello goorm!</h1>"


@application.route("/hellokakao",methods=["POST"])
def kakaochatbot():
    reqMsg = kakaoRequestMsg(request.get_json())
    mymsg = reqMsg['msg'] #카톡 메시지
    resultMsg = ''
    if mymsg == '맛집':
        resultMsg = matjipList()
    elif mymsg.split()[0] == '로또':
        resultMsg = lottoInfo(mymsg.split()[1])
    txtResult = {}
    txtResult['simpleText'] = {
        'text' : resultMsg
    }
    reqMsg['res']['template']['outputs'].append(txtResult)
    
    return jsonify(reqMsg['res'])

@application.route("/hn",methods=["POST"])
def navertalk():
    return None

if __name__ == "__main__":
    application.run(host='0.0.0.0', port=5000)
