Websocket 监听到的消息字段说明。 数据格式为json，只记录遇到的情况，欢迎补充。

# message (版本：3.9.2.23)


## 文字消息

消息类型: `type: 1`

<details>
<summary> 私聊</summary>

消息类型: `type: 1`

消息发送方: `wxid`

消息内容: `content`


注意: 当前版本(3.9.2.23)私聊时，手机端回复消息时，不能区分消息发送方。不能识别消息是对方发出还是自己发出。
</details>


<details>
<summary> 群聊，房间ID以'@chatroom'结尾</summary>

消息类型: `type: 1`

群聊房间id: `wxid`

发送方: `id1`

消息内容: `content`


当`id1`为空值时，为当前账号手机端发送的消息
</details>

<details>
<summary> 群聊'@'消息</summary>

消息类型: `type: 1`

群聊房间id: `wxid`

发送方: `id1`

消息内容: `content`

"@"用户列表: `other: <atuserlist></atuserlist>`


当`id1`为空值时，为当前账号手机端发送的消息
</details>


## 图片消息

消息类型: `type: 3`

<details>
<summary>群聊</summary>


 图片信息: `content.content`

 群聊房间id: `content.id1`

 发送方: `content.id2`

</details>


## 多媒体消息

消息类型: `type: 49`
消息内容字段: `content.content` 格式为xml，里面还有`type`字段, 解析的时候注意节点深度。下面文档只写出最后的节点。


<details>
<summary>群聊</summary>

消息内容: `content.content`

群聊房间id: `content.id1`

发送方: `content.id2`


1. `<type>5</type>` 分享
    分享标题: `<title></title>`
    分享描述: `<des></des>`
    分享链接: `<url></url>`


</details>