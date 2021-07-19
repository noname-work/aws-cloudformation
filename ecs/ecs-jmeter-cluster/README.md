# 概要
- FargateでJMeter環境を構築します。
- 1台のMasterと0台以上のSlaveを構築します。
- 負荷試験が完了するとMasterのECSサービスは自動的に希望数0になります。

## ディレクトリ構成
**source**:<br>
JMeterのコンテナイメージを作成するためのファイル群。<br>
必要に応じてDockerfileやmaster.shの内容を書き換えること。

**template**:<br>
AWSインフラ環境を構築するためのCloudFormationテンプレート。<br>

## サンプル構成
<img src="https://noname.work/wp-content/uploads/2021/07/Jmeter%E6%A7%8B%E6%88%90%E5%9B%B3.png" width="500">
JMeter環境の最小限な構成が構築されます。

***
# 参考URL
- [[AWS]ECS+Fargateで簡単にJMeterのMaster/Slave環境を構築](https://noname.work/3173.html)
