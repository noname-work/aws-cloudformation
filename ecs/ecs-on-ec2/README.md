## 構成図
<img src="https://noname.work/wp-content/uploads/2021/07/1ECS%E7%92%B0%E5%A2%83%E3%81%AE%E6%A7%8B%E6%88%90%E5%9B%B3.png" width="500">
EC2をホストとして実行されるECSとアクセスのために利用するロードバランサーを作成する。<br>
VPCとACMは本テンプレートでは作成しないため、別途準備する必要がある。

## ファイル説明
**create-ecr-repo.yml:**<br>
コンテナイメージを格納するECRリポジトリを作成するテンプレート。<br>
必要に応じて作成する。

**create-ecs-securitygroup.yml:**<br>
EC2とロードバランサーで利用するセキュリティグループをそれぞれ作成するテンプレート。

**create-ecs-on-ec2-cluster.yml:**<br>
ECSクラスターとAutoScalingを作成するテンプレート。<br>
インスタンスにアタッチするためのIAMロールも構築している。

**create-ecs-service-alb.yml:**<br>
ECSのサービスで利用するロードバランサーとターゲットグループを作成するテンプレート。

**create-ecs-service.yml:**<br>
タスク定義とサービスを作成するテンプレート。<br>
ECSのサービスで利用するロードバランサーのターゲットグループを紐付ける必要がある。


## 事前準備
<img src="https://noname.work/wp-content/uploads/2021/07/%E5%BF%85%E8%A6%81%E3%81%AAIAM-1024x404.png" width="600">
[AWSServiceRoleForECS]というサービスリンクロールを発行しておく必要がある。
初めてECSサービスを利用する場合は以下のコマンドで生成できる。

```$ aws iam create-service-linked-role --aws-service-name ecs.amazonaws.com```


## 構築の流れ
1, 必要であればcreate-ecr-repo.ymlテンプレートでECRリポジトリを作成する<br>
2, create-ecs-securitygroup.ymlテンプレートでセキュリティグループを作成する<br>
3, create-ecs-on-ec2-cluster.ymlテンプレートでECSクラスターと必要リソースを作成する<br>
4, create-ecs-service.ymlテンプレートでタスク定義とサービスを作成する




## create-ecr-repo.ymlのパラメータ
<img src="https://noname.work/wp-content/uploads/2021/07/2-%E3%82%BB%E3%82%AD%E3%83%A5%E3%83%AA%E3%83%86%E3%82%A3%E3%82%AF%E3%82%99%E3%83%AB%E3%83%BC%E3%83%95%E3%82%9A%E3%81%AE%E3%83%8F%E3%82%9A%E3%83%A9%E3%83%A1%E3%83%BC%E3%82%BF-1024x592.png" width="600">

| Parameter | Description |
|:---|:---|
| ClusterName | 作成予定のECSクラスター名を入力 |
| VPCID | セキュリティグループを作成するVPCのIDを選択。これは作成予定のECSクラスターと同じVPCを選択する必要がある |



## create-ecs-securitygroup.ymlのパラメータ
<img src="https://noname.work/wp-content/uploads/2021/07/3-ECS%E3%82%AF%E3%83%A9%E3%82%B9%E3%82%BF%E3%83%BC%E3%81%AE%E3%83%8F%E3%82%9A%E3%83%A9%E3%83%A1%E3%83%BC%E3%82%BF.png" width="600">

| Parameter | Description |
|:---|:---|
| ClusterName | 作成予定のECSクラスター名を入力 |
| InstanceType | ECSのホストインスタンスとして利用するインスタンスタイプを選択 |
| ECSSubnetIDs | ECSインスタンスを立てるサブネットを選択 |
| KeyName | ECSインスタンスに接続するためのキーペアを選択 |
| ImageId | ECSに最適化されたAMIのIDを入力 |
| ECSSecurityGroups | ECSインスタンスにアタッチするセキュリティグループを選択 |
| ScalingDesiredCapacity | ECSインスタンスの希望数 |
| ScalingMaxSize | ECSインスタンスの最大数 |
| ScalingMinSize | ECSインスタンスの最小数 |



## create-ecs-service-alb.ymlのパラメータ
<img src="https://noname.work/wp-content/uploads/2021/07/4-ALB%E3%81%AE%E3%83%8F%E3%82%9A%E3%83%A9%E3%83%A1%E3%83%BC%E3%82%BF.png" width="600">

| Parameter | Description |
|:---|:---|
| ClusterName | 作成予定のECSクラスター名を入力 |
| VPCID | ロードバランサーで使用するVPCのIDを選択 |
| ALBSubnetIDs	 | ロードバランサーで使用するサブネットを指定。2つ以上を選択する |
| ALBCertificateARN | ACMに登録したSSL証明書のARNを入力 |
| ALBSecurityGroups | ロードバランサーに設定するセキュリティグループを選択 |


## create-ecs-service.ymlのパラメータ
<img src="https://noname.work/wp-content/uploads/2021/07/5-%E3%82%B5%E3%83%BC%E3%83%92%E3%82%99%E3%82%B9%E3%81%AE%E3%83%8F%E3%82%9A%E3%83%A9%E3%83%A1%E3%83%BC%E3%82%BF-1024x752.png" width="600">

| Parameter | Description |
|:---|:---|
| ClusterName | 作成予定のECSクラスター名を入力 |
| ServiceName | ECSで実行するサービスの名前を設定 |
| DesiredServiceCount	 | サービスコンテナの希望数 |
| ImageURI | 実行するコンテナイメージのURIを入力。デフォルト値ではApacheを実行 |
| ContainerPort | コンテナポートを入力 |
| ContainerName | タスク定義で利用するコンテナの名前を入力 |
| ServiceTargetGroup | ECSサービスで利用するロードバランサーのターゲットグループARN |

***
# 参考URL
- [[AWS]ECS環境を作成するCloudFormationのテンプレート](https://noname.work/3105.html)
- [Amazon ECS 用のサービスにリンクされたロール](https://docs.aws.amazon.com/ja_jp/AmazonECS/latest/developerguide/using-service-linked-roles.html)
