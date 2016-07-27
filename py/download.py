import requests # http头信息，指定获取前15000个字节
headers={'Range':'Bytes=0-15000','Accept-Encoding':'*'}
res=requests.get('http://www.stack.nl/~dimitri/doxygen/images/doxygen.png',headers=headers)
with open('pc.jpg','w') as f:
    f.write(res.content)
