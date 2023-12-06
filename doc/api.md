Send message using http POST request is recommended.

If you run as `docker run --rm --add-host=dldir1.qq.com:127.0.0.1 -p 8080:8080 -p 5555:5555 wandaijin/wechat-hook:{version}`, then 127.0.0.1:5555 is your http server endpoint.

<details>

<summary>Message Data Structure  Definition</summary>

### Message Data Structure Definition

Message is a json object that has 7 keys. 7 keys must be presented, even they are null.

```json
{
  "id": "",
  "type": "",
  "wxid": "",
  "roomid": "",
  "content": "",
  "nickname": "",
  "ext": ""
}
```

- id

  uniq integer

- type

  | type | comment                        | endpoint                      |
  | ---- | ------------------------------ | ----------------------------- |
  | 500  | picture message                | /api/sendpic                  |
  | 550  | @somebody message              | /api/sendatmsg                |
  | 555  | text message                   | /api/sendtxtmsg               |
  | 5000 | get contact list and room list | /api/getcontactlist           |
  | 5003 | send file as attach            | /api/sendattatch              |
  | 5010 | get room member id             | /api/getmemberid              |
  | 5010 | get room member list           | /api/get_charroom_member_list |
  | 5020 | get room member nick name      | /api/getmembernick            |

  注意: **get_charroom_member_list** 这个接口的拼写

</details>

## 接口文档 (版本：3.9.2.23)

<details>
<summary> 1. 发送文本消息给好友联系人</summary>

### 1.1 请求

**请求方式：** POST

**请求地址：** `/api/sendtxtmsg`

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

需要使用`para`作为键名

```json
{
  "para": {
    "id": "1700120933947",
    "type": 555,
    "wxid": "wxid_n*******2",
    "roomid": "null",
    "content": "hi budy!",
    "nickname": "null",
    "ext": "null"
  }
}
```

### 1.2 响应

**成功响应：** 200 OK
**响应数据格式：**

```json
{
  "content": "send text message : execution succsessed",
  "id": "1700121070901",
  "receiver": "CLIENT",
  "sender": "SERVER",
  "srvid": 1,
  "status": "SUCCSESSED",
  "time": "2023-11-16 15:51:11",
  "type": 555
}
```

</details>

<details>
<summary> 2. 获取联系人列表(包含好友和群组)</summary>

### 2.1 请求

**请求方式：** POST

**请求地址：** `/api/getcontactlist`

**参数格式：** json 使用

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

需要使用`para`作为键名

```json
{
  "para": {
    "id": "1700121730799",
    "type": 5000,
    "roomid": "null",
    "wxid": "null",
    "content": "null",
    "nickname": "null",
    "ext": "null"
  }
}
```

### 2.2 响应

**成功响应：** 200 OK
**响应数据格式：**

```json
{
  "content": [
    {
      "headimg": "",
      "name": "朋友推荐消息",
      "node": 95876480,
      "remarks": "",
      "wxcode": "fmessage",
      "wxid": "fmessage"
    }
  ],
  "id": "1700121905536",
  "type": 5000
}
```

</details>

<details>
<summary> 3. 获取所有的群组的成员列表</summary>

### 3.1 请求

**请求方式：** POST

**请求地址：** `/api/get_charroom_member_list`

**参数格式：** json 使用

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

需要使用`para`作为键名。`roomid`参数无效，不能通过`roomid`参数进行筛选

```json
{
  "para": {
    "id": "1700121731799",
    "type": 5010,
    "roomid": "null",
    "wxid": "null",
    "content": "null",
    "nickname": "null",
    "ext": "null"
  }
}
```

### 3.2 响应

**成功响应：** 200 OK
**响应数据格式：**

```json
{
  "content": [
    {
      "address": 113416864,
      "member": ["wxid_v**********1", "wxid_v**********2"],
      "room_id": "2****5@chatroom"
    }
  ],
  "id": "1700122517986",
  "type": 5010
}
```

</details>

<details>
<summary> 4. 获取所有的群组的成员的昵称</summary>

### 4.1 请求

**请求方式：** POST

**请求地址：** `/api/get_charroom_member_list`

**参数格式：** json 使用

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

需要使用`para`作为键名。

```json
{
  "para": {
    "id": "1700129504464",
    "type": 5020,
    "roomid": "********@chatroom",
    "wxid": "wxid_v********2",
    "content": "null",
    "nickname": "null",
    "ext": "null"
  }
}
```

### 4.2 响应

**成功响应：** 200 OK
**响应数据格式：**

```json
{
  "content": "{\"nick\":\"***\",\"roomid\":\"**********@chatroom\",\"wxid\":\"wxid_v****2\"}",
  "id": "1700129409823",
  "receiver": "CLIENT",
  "sender": "SERVER",
  "srvid": 1,
  "status": "SUCSESSED",
  "time": "2023-11-16 18:10:10",
  "type": 5020
}
```

</details>

<details>
<summary> 5. 在群组中发送"@"消息</summary>

### 5.1 请求

**请求方式：** POST

**请求地址：** `/api/sendatmsg`

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

需要使用`para`作为键名

```json
{
  "para": {
    "id": "1700187536669",
    "type": 550,
    "wxid": "wxid_v********2",
    "roomid": "********@chatroom",
    "content": "hello",
    "nickname": "username",
    "ext": "null"
  }
}
```

### 5.2 响应

**成功响应：** 200 OK
**响应数据格式：**

```json
{
  "content": "send at msg : execution succeeded",
  "id": "1700187751718",
  "receiver": "CLIENT",
  "sender": "SERVER",
  "srvid": 1,
  "status": "SUCCSESSED",
  "time": "2023-11-17 10:22:32",
  "type": 550
}
```

</details>

<details>
<summary> 6. 发送图片</summary>

### 6.1 请求

**请求方式：** POST

**请求地址：** `/api/sendpic`

**参数格式：** json

| 参数名   | 类型   | 必需 | 描述                  |
| -------- | ------ | ---- | --------------------- |
| id       | string | 是   | 毫秒时间字符串        |
| type     | string | 是   | 500                   |
| wxid     | string | 是   | 微信 ID               |
| roomid   | string | 是   | null                  |
| content  | string | 是   | 图片在设备本地的路径 |
| nickname | string | 是   | null                  |
| ext      | string | 是   | null                  |

**例如**

需要使用`para`作为键名

```json
{
  "para": {
    "id": "1700189981766",
    "type": 500,
    "wxid": "********@chatroom",
    "roomid": "null",
    "content": "C:\\Users\\****\\Desktop\\RE4wtbD.jpg",
    "nickname": "null",
    "ext": "null"
  }
}
```

### 6.2 响应

**成功响应：** 200 OK
**响应数据格式：**

```json
{
  "content": "send pic msg:asm execution succsessed",
  "id": "1700190250620",
  "receiver": "CLIENT",
  "sender": "SERVER",
  "srvid": 1,
  "status": "SUCCSESSED",
  "time": "2023-11-17 11:04:11",
  "type": 500
}
```

</details>

<details>
<summary> 7. 发送文件</summary>

### 7.1 请求

**请求方式：** POST

**请求地址：** `/api/sendpic`

**参数格式：** json

| 参数名   | 类型   | 必需 | 描述                  |
| -------- | ------ | ---- | --------------------- |
| id       | string | 是   | 毫秒时间字符串        |
| type     | string | 是   | 5003                  |
| wxid     | string | 是   | 微信 ID               |
| roomid   | string | 是   | null                  |
| content  | string | 是   | 文件在设备本地的路径 |
| nickname | string | 是   | null                  |
| ext      | string | 是   | null                  |

**例如**

需要使用`para`作为键名

```json
{
  "para": {
    "id": "1700190467704",
    "type": 5003,
    "wxid": "wxid_v********2",
    "roomid": "null",
    "content": "C:\\Users\\******\\Desktop\\file.zip",
    "nickname": "null",
    "ext": "null"
  }
}
```

### 7.2 响应

**成功响应：** 200 OK
**响应数据格式：**

```json
{
  "content": "send pic msg:asm execution succsessed",
  "id": "1700190604255",
  "receiver": "CLIENT",
  "sender": "SERVER",
  "srvid": 1,
  "status": "SUCCSESSED",
  "time": "2023-11-17 11:10:04",
  "type": 500
}
```

</details>



<details>
<summary> 8. 获取当前登陆微信账号的信息</summary>

### 8.1 请求

**请求方式：** POST

**请求地址：** `/api/getcontactlist`

**参数格式：** json

| 参数名   | 类型   | 必需 | 描述                  |
| -------- | ------ | ---- | --------------------- |
| id       | string | 是   | 毫秒时间字符串        |
| type     | string | 是   | 6500                  |
| wxid     | string | 是   | null             |
| roomid   | string | 是   | null                  |
| content  | string | 是   | null |
| nickname | string | 是   | null                  |
| ext      | string | 是   | null                  |

**例如**

需要使用`para`作为键名

```json
{
    "para": {
        "id": "1700191465355",
        "type": 6500,
        "roomid": "null",
        "wxid": "null",
        "content": "null",
        "nickname": "null",
        "ext": "null"
    }
}
```

### 8.2 响应

**成功响应：** 200 OK
**响应数据格式：**

```json
{
    "content": "{\"wx_code\":\"\",\"wx_head_image\":\"https://wx.**.cn/******xcJ/132\",\"wx_id\":\"wxid_f***xe22\",\"wx_name\":\"******\"}",
    "id": "1700191574512",
    "receiver": "CLIENT",
    "sender": "SERVER",
    "srvid": 1,
    "status": "SUCESSED",
    "time": "2023-11-17 11:26:14",
    "type": 6500
}
```

</details>