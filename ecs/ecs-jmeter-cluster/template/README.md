## 構成図
<img src="https://noname.work/wp-content/uploads/2021/07/Jmeter%E6%A7%8B%E6%88%90%E5%9B%B3.png" width="500">
ECSクラスターとタスク定義およびFargateサービスを構築する。<br>
出力結果はCloudWatchLogsへ格納される。

## 事前準備
<img src="https://noname.work/wp-content/uploads/2021/07/%E5%BF%85%E8%A6%81%E3%81%AAIAM-1024x404.png" width="600">
[AWSServiceRoleForECS]というサービスリンクロールを発行しておく必要がある。<br>
初めてECSサービスを利用する場合は以下のコマンドで生成できる。

```$ aws iam create-service-linked-role --aws-service-name ecs.amazonaws.com```

## 構築の流れ
1, 必要であればcreate-ecr-repo.ymlテンプレートでECRリポジトリを作成する<br>
2, sourceディレクトリからJMeterイメージをbuildして格納しておく<br>
3, create-jmeter-cluster.ymlテンプレートで負荷試験環境を作成する

## create-ecs-service.ymlのパラメータ
<img src="https://noname.work/wp-content/uploads/2021/07/1JMeter%E3%81%AE%E3%83%8F%E3%82%9A%E3%83%A9%E3%83%A1%E3%83%BC%E3%82%BF.png" width="600">

| Parameter | Description |
|:---|:---|
| JmeterClusterName | JMeterのECSクラスター名を入力 |
| MasterServiceName | Masterとして実行するJMeterサービス名を入力 |
| SlaveServiceName	 | Slaveとして実行するJMeterサービス名を入力 |
| FargateCPU | Fargateに割り当てるvCPUを選択 |
| FargateMemory | Fargateに割り当てるメモリを選択 |
| DesiredSlaveCount | Slaveの台数を入力 |
| VPCID | VPCのIDを選択 |
| ImageURI | MeterのコンテナイメージのURIを入力 |
| FargateSubnetIDs | Fargateを実行するサブネットを選択。Publicなサブネットで実行することを推奨。ただしIPアドレスの固定化が必要な場合はPrivateなサブネットを選択 |
| JmxFileName | 実行するシナリオファイル名を入力 |


***
# 参考URL
- [[AWS]ECS+Fargateで簡単にJMeterのMaster/Slave環境を構築](https://noname.work/3173.html)
