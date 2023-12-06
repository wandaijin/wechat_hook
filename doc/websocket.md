If you run as `docker run --rm --add-host=dldir1.qq.com:127.0.0.1 -p 8080:8080 -p 5555:5555 wandaijin/wechat-hook:{version}`, then 127.0.0.1:5555 is your websocket server endpoint.

### listen websocket

```javascript
websocket.on("message", (data) => {});
```

| type | comment                        |
| ---- | ------------------------------ |
| 1    | receive text message           |
| 3    | receive picture message        |
| 500  | picture message                |
| 550  | @somebody message              |
| 555  | text message                   |
| 5000 | get contact list and room list |
| 5003 | send file as attach            |
| 5010 | get room member id             |
| 5010 | get room member list           |
| 5020 | get room member nick name      |
| 6500 | current user info      |

## send message (版本：3.9.2.23)

<details>
<summary> 1. 发送文本消息给好友联系人</summary>

**请求方式：** websocket.send()

**参数格式：** json

| 参数名   | 类型   | 必需 | 描述           |
| -------- | ------ | ---- | -------------- |
| id       | string | 是   | 毫秒时间字符串 |
| type     | string | 是   | 555            |
| wxid     | string | 是   | 好友微信 ID    |
| roomid   | string | 是   | null           |
| content  | string | 是   | 文本消息       |
| nickname | string | 是   | null           |
| ext      | string | 是   | null           |

**例如**

```json
{
  "id": "1700120933947",
  "type": 555,
  "wxid": "wxid_n*******2",
  "roomid": "null",
  "content": "hi budy!",
  "nickname": "null",
  "ext": "null"
}
```

</details>

<details>
<summary> 2. 获取联系人列表(包含好友和群组)</summary>

**请求方式：** websocket.send()

**参数格式：** json

| 参数名   | 类型   | 必需 | 描述           |
| -------- | ------ | ---- | -------------- |
| id       | string | 是   | 毫秒时间字符串 |
| type     | string | 是   | 5000           |
| wxid     | string | 是   | null           |
| roomid   | string | 是   | null           |
| content  | string | 是   | null           |
| nickname | string | 是   | null           |
| ext      | string | 是   | null           |

**例如**

```json
{
  "id": "1700121730799",
  "type": 5000,
  "roomid": "null",
  "wxid": "null",
  "content": "null",
  "nickname": "null",
  "ext": "null"
}
```

</details>

<details>
<summary> 3. 获取所有的群组的成员列表</summary>

**请求方式：** websocket.send()

**参数格式：** json

| 参数名   | 类型   | 必需 | 描述           |
| -------- | ------ | ---- | -------------- |
| id       | string | 是   | 毫秒时间字符串 |
| type     | string | 是   | 5010           |
| wxid     | string | 是   | null           |
| roomid   | string | 是   | null           |
| content  | string | 是   | null           |
| nickname | string | 是   | null           |
| ext      | string | 是   | null           |

**例如**

`roomid`参数无效，不能通过`roomid`参数进行筛选

```json
{
  "id": "1700121731799",
  "type": 5010,
  "roomid": "null",
  "wxid": "null",
  "content": "null",
  "nickname": "null",
  "ext": "null"
}
```

</details>

<details>
<summary> 4. 获取所有的群组的成员的昵称</summary>

**请求方式：** websocket.send()

**参数格式：** json

| 参数名   | 类型   | 必需 | 描述           |
| -------- | ------ | ---- | -------------- |
| id       | string | 是   | 毫秒时间字符串 |
| type     | string | 是   | 5020           |
| wxid     | string | 是   | 组员的微信 ID  |
| roomid   | string | 是   | 群组 ID        |
| content  | string | 是   | null           |
| nickname | string | 是   | null           |
| ext      | string | 是   | null           |

**例如**

```json
{
  "id": "1700129504464",
  "type": 5020,
  "roomid": "********@chatroom",
  "wxid": "wxid_v********2",
  "content": "null",
  "nickname": "null",
  "ext": "null"
}
```

</details>

<details>
<summary> 5. 在群组中发送"@"消息</summary>

**请求方式：** websocket.send()

**参数格式：** json

| 参数名   | 类型   | 必需 | 描述           |
| -------- | ------ | ---- | -------------- |
| id       | string | 是   | 毫秒时间字符串 |
| type     | string | 是   | 550            |
| wxid     | string | 是   | 成员微信 ID    |
| roomid   | string | 是   | 群组 ID        |
| content  | string | 是   | 文本消息       |
| nickname | string | 是   | null           |
| ext      | string | 是   | null           |

**例如**

```json
{
  "id": "1700187536669",
  "type": 550,
  "wxid": "wxid_v********2",
  "roomid": "********@chatroom",
  "content": "hello",
  "nickname": "username",
  "ext": "null"
}
```

</details>

<details>
<summary> 6. 发送图片</summary>

### 6.1 请求

**请求方式：** websocket.send()

**参数格式：** json

| 参数名   | 类型   | 必需 | 描述                 |
| -------- | ------ | ---- | -------------------- |
| id       | string | 是   | 毫秒时间字符串       |
| type     | string | 是   | 500                  |
| wxid     | string | 是   | 微信 ID              |
| roomid   | string | 是   | null                 |
| content  | string | 是   | 图片在设备本地的路径 |
| nickname | string | 是   | null                 |
| ext      | string | 是   | null                 |

**例如**

```json
{
  "id": "1700189981766",
  "type": 500,
  "wxid": "********@chatroom",
  "roomid": "null",
  "content": "C:\\Users\\****\\Desktop\\RE4wtbD.jpg",
  "nickname": "null",
  "ext": "null"
}
```

</details>

<details>
<summary> 7. 发送文件</summary>

### 7.1 请求

**请求方式：** websocket.send()

**参数格式：** json

| 参数名   | 类型   | 必需 | 描述                 |
| -------- | ------ | ---- | -------------------- |
| id       | string | 是   | 毫秒时间字符串       |
| type     | string | 是   | 5003                 |
| wxid     | string | 是   | 微信 ID              |
| roomid   | string | 是   | null                 |
| content  | string | 是   | 文件在设备本地的路径 |
| nickname | string | 是   | null                 |
| ext      | string | 是   | null                 |

**例如**

```json
{
  "id": "1700190467704",
  "type": 5003,
  "wxid": "wxid_v********2",
  "roomid": "null",
  "content": "C:\\Users\\******\\Desktop\\file.zip",
  "nickname": "null",
  "ext": "null"
}
```

</details>

<details>
<summary> 8. 获取当前登陆微信账号的信息</summary>

### 8.1 请求

**请求方式：** websocket.send()

**参数格式：** json

| 参数名   | 类型   | 必需 | 描述           |
| -------- | ------ | ---- | -------------- |
| id       | string | 是   | 毫秒时间字符串 |
| type     | string | 是   | 6500           |
| wxid     | string | 是   | null           |
| roomid   | string | 是   | null           |
| content  | string | 是   | null           |
| nickname | string | 是   | null           |
| ext      | string | 是   | null           |

**例如**

```json
{
  "id": "1700191465355",
  "type": 6500,
  "roomid": "null",
  "wxid": "null",
  "content": "null",
  "nickname": "null",
  "ext": "null"
}
```

</details>
