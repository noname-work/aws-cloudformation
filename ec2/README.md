# 概要
## create-ec2-and-alb.yml
- ALB + EC2によるHTTPS通信を可能にしたWebサーバーを構築します。
- ユーザーデータを書き換えることで任意の構築を行うことが可能です。
- ALBではHTTPからのアクセスを許可していますが、HTTPSへリダイレクトさせる設定をしています。
- デフォルトではAmazonLinux2上でApacheを実行します。
- マーケットプレイスや構築済みのカスタムAMIを実行することもできます。その場合はユーザーデータも必要に応じたものへ書き換えてください。

<img src="https://noname.work/wp-content/uploads/2021/06/%E6%A7%8B%E7%AF%89%E7%92%B0%E5%A2%83.png" width="600">

## create-ec2-autoscaling.yml
- AutoScalingグループによりEC2インスタンスを作成します。
- 作成されたインスタンスは「インスタンス名-01」などの連番が自動的に付与されます。
- スポットインスタンスに対応したテンプレートです。

# パラメータ

## create-ec2-and-alb.yml
<img src="https://noname.work/wp-content/uploads/2021/06/EC2%E3%83%8F%E3%82%9A%E3%83%A9%E3%83%A1%E3%83%BC%E3%82%BF-1024x958.png" width="600">

| Parameter | Description |
|:---|:---|
| ServiceName | EC2インスタンスの名前。関連リソースの名前も同様の名前が入る |
| InstanceType | 起動するEC2インスタンスのタイプをリストから選択。デフォルトはt2.micro |
| VPCID | ALBとEC2を起動するVPCを選択 |
| EC2SubnetID | EC2を実行するサブネットを選択。安全のためにPrivateサブネットでの起動を推奨 |
| KeyName | EC2のキーペア。 |
| InstanceImage | 起動するEC2インスタンスのAMIを指定。デフォルトではAmazonLinux2が起動。 |
| ALBSubnetIDs | ALBを実行するためのサブネットを選択します。Webサーバーを公開するためにPublicサブネットの選択を推奨。少なくとも２つ選択。 |
| ALBCertificateARN | HTTPS通信をサポートするためにACMに登録しているSSL証明書のARNを入力 |

## create-ec2-autoscaling.yml
| Parameter | Description |
|:---|:---|
| InstanceName | EC2インスタンスの名前。後ろに-01などの連番が付与される。 |
| InstanceType1 | 起動するEC2インスタンスのタイプをリストから選択。 |
| InstanceType2 | 起動するEC2インスタンスの予備のタイプをリストから選択。 |
| EC2SubnetIDs | EC2を実行するサブネットを選択。 |
| KeyName | EC2のキーペア。 |
| ImageId | 起動するEC2インスタンスのAMIを指定。デフォルトではAmazonLinux2が起動。 |
| EC2SecurityGroups | セキュリティグループを選択。 |
| ScalingDesiredCapacity | 希望する起動台数を入力。 |
| ScalingMaxSize | 最大の起動台数を入力。 |
| ScalingMinSize | 最小の起動台数を入力。 |
| OnDemandInstancePercentage | 実行するオンデマンドインスタンスの割合。 |

***
# 参考URL
- [[AWS] ALB + EC2でWebサーバを構築するCloudFormationを構築してみた](https://noname.work/2993.html)
- [[AWS] EC2インスタンスに自動的に連番をつけるAutoScalingグループを作る](https://noname.work/3808.html)
