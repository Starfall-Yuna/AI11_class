from flask import Flask, request, jsonify,json,jsonify,abort
import urllib.request #json api 가져오기
import sys
application = Flask(__name__)

@application.route("/mytestchatbot",methods=['POST'])
def mytestchatbot():
    body = request.get_json()
    mymsg = body['userRequest']['utterance'] # 사용자가 보낸 메시지
    lottodata=''
    if mymsg.split()[0]=='로또':
        isImg = False
        url = 'https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=%s'% mymsg.split()[1]
        response = urllib.request.urlopen(url)
        response_message = response.read().decode('utf8')
        jresponse = json.loads(response_message)
        
        if jresponse['returnValue'] != 'success':
            lottodata = '잘못된 입력입니다.'
        else:
            lottodata = "{} {} {} {} {} {} 보너스 : {}".format(jresponse['drwtNo1'],jresponse['drwtNo2'],jresponse['drwtNo3'],jresponse['drwtNo4'],jresponse['drwtNo5'],jresponse['drwtNo6'],jresponse['bnusNo'])   
    
    responseBody = {
            "version": "2.0",
            "template": {
                "outputs": [
                    {
                        'simpleText' : {
                            'text' : lottodata
                        }
                    }
                ]
            }
        }    
   
    return responseBody

if __name__ == "__main__":
    #print(sys.argv)
    application.run(host='0.0.0.0', port=5001, threaded=True)
