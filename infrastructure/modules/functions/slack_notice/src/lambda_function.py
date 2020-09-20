# -*- coding: UTF-8 -*-
import os
from slack import WebClient

SLACK_TOKEN = os.environ["slack_token"]
CHANNEL_ID  = os.environ["slack_channel_id"]

def post_message(text):
    print("### post_message")
    try:
        client = WebClient(SLACK_TOKEN)
        response = client.chat_postMessage(
            channel = CHANNEL_ID,
            text = text
        )
    except Exception as error:
        response = {'error' : str(error)}
        print(response)
    
    return response

#####
# メイン処理
#####
def lambda_handler(event, context):
    print(event)
    post_message("aaa")
    return event