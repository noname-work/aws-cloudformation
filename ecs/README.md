# 概要
- ECSを使ってコンテナイメージを実行するためのテンプレートです。


## ディレクトリ構成
**ecs-on-ec2**:<br>
EC2インスタンスをホストに利用したECS構成を構築します。<br>
作成するものは以下の通りです。<br>
・EC2とALBのセキュリティグループ<br>
・ALBとターゲットグループ<br>
・ECSクラスターとAutoScalingグループ、基本的なIAMロール<br>
・タスク定義とサービス、CloudWatchLogsのロググループ


**ecs-on-fargate**:<br>
Fargateを利用したECS構成を構築します。<br>
作成するものは以下の通りです。<br>
・EC2とFargateのセキュリティグループ<br>
・ALBとターゲットグループ<br>
・ECSクラスター<br>
・タスク定義とサービス、タスク実行ロール、CloudWatchLogsのロググループ

## サンプル構成
<img src="https://noname.work/wp-content/uploads/2021/07/1ECS%E7%92%B0%E5%A2%83%E3%81%AE%E6%A7%8B%E6%88%90%E5%9B%B3.png" width="500">
<img src="https://noname.work/wp-content/uploads/2021/07/%E6%A7%8B%E6%88%90%E5%9B%B3.png" width="500">

