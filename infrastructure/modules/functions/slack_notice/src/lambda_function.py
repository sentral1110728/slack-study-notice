# -*- coding: UTF-8 -*-
import os
import jpholiday
from datetime import datetime,timedelta,date
from slack    import WebClient

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


def is_biz_day(date):
    print("### is_biz_day")
    if date.weekday() >= 5 or jpholiday.is_holiday(date):
        print("土日祝日")
        return 0
    else:
        print("平日")
        return 1


#####
# メイン処理
#####
def lambda_handler(event, context):
    print(event)
    today = date.today()
    for num in range(6):
        week_day = today + timedelta(days=num)
        result = is_biz_day(week_day)
        print(result)
        if result == 0:
            print("slackへメッセージ送信")
            post_message(week_day)

    return event