# 概要
- ALB + EC2によるHTTPS通信を可能にしたWebサーバーを構築します。
- ユーザーデータを書き換えることで任意の構築を行うことが可能です。
- ALBではHTTPからのアクセスを許可していますが、HTTPSへリダイレクトさせる設定をしています。
- デフォルトではAmazonLinux2上でApacheを実行します。
- マーケットプレイスや構築済みのカスタムAMIを実行することもできます。その場合はユーザーデータも必要に応じたものへ書き換えてください。

<img src="https://noname.work/wp-content/uploads/2021/06/%E6%A7%8B%E7%AF%89%E7%92%B0%E5%A2%83.png" width="600">

## パラメータ

<img src="https://noname.work/wp-content/uploads/2021/06/EC2%E3%83%8F%E3%82%9A%E3%83%A9%E3%83%A1%E3%83%BC%E3%82%BF-1024x958.png" width="600">

| Parameter | Description |
|:---|:---|
| ServiceName | EC2インスタンスの名前。関連リソースの名前も同様の名前が入る |
| InstanceType | 起動するEC2インスタンスのタイプをリストから選択。デフォルトはt2.micro |
| VPCID | ALBとEC2を起動するVPCを選択 |
| EC2SubnetID | EC2を実行するサブネットを選択。安全のためにPrivateサブネットでの起動を推奨 |
| InstanceImage | 起動するEC2インスタンスのAMIを指定。デフォルトではAmazonLinux2が起動。 |
| ALBSubnetIDs | ALBを実行するためのサブネットを選択します。Webサーバーを公開するためにPublicサブネットの選択を推奨。少なくとも２つ選択。 |
| ALBCertificateARN | HTTPS通信をサポートするためにACMに登録しているSSL証明書のARNを入力 |

***
# 参考URL
- [[AWS] ALB + EC2でWebサーバを構築するCloudFormationを構築してみた](https://noname.work/2993.html)
