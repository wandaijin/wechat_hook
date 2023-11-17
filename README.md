## Warning

It Works On Intel CPU, M1 chip not work, other cpu not tested.

## open port

- 8080 # noVNC
- 5555 # http server with websocket supported
- 5900 # vnc server

## wechat data dir

- /home/app/WeChat Files/
- /home/app/.wine/drive_c/users/app/AppData/
- /home/app/.wine/drive_c/temp/wechat/

## disable wechat update

run docker with `--add-host=dldir1.qq.com:127.0.0.1`

## example

current version is 3.9.2.23

```bash
$ docker pull wandaijin/wechat-hook:3.9.2.23
$ docker run --rm --add-host=dldir1.qq.com:127.0.0.1 -p 8080:8080 -p 5555:5555 -p 5900:5900 wandaijin/wechat-hook:3.9.2.23
```

open `http://127.0.0.1:8080/vnc.html` to login

## note

connect `ws://127.0.0.1:5555/` websocket to listen message

post `http://127.0.0.1:5555/` to send message



## [api document](./doc/api.md)


## wechat binary download page

https://github.com/tom-snow/wechat-windows-versions/releases

## funtool download page

https://github.com/cixingguangming55555/wechat-bot


## Credit

- https://github.com/cixingguangming55555/wechat-bot
- https://github.com/ChisBread/injector-box
- https://github.com/ChisBread/wechat-box
- https://github.com/crazyn2/wechat-bot
