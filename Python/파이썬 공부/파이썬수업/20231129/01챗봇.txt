import requests, json
from flask import Flask,request,jsonify,abort
import sys
import urllib.request

application = Flask(__name__)


@application.route("/")
def hello():
    return "<h1 style='color:red'>Hello goorm!</h1>"


@application.route("/hellokakao",methods=["POST"])
def hello2():
    req = request.get_json() #사용자가 보낸 메시지
    print(req)
    print(req["userRequest"]["utterance"])
    myreq = req["userRequest"]["utterance"]
    res = {
        "version":"2.0",
        "template":{
            "outputs" : [
                {
                    "simpleText" :
                    {
                        "text":myreq
                    }
                }
            ]
        }
    }
    return jsonify(res)


if __name__ == "__main__":
    application.run(host='0.0.0.0', port=5000)
