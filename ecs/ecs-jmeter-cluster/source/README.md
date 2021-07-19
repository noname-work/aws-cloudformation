## このディレクトリについて
JMeterを実行するためのDockerイメージを作成する。<br>
buildしたDockerイメージはECRリポジトリに格納後、CloudFormationでECSサービスを作成するために参照される。

master.sh内に記載したコマンドが実行されるので必要に応じて編集しておく。<br>
例えば実行結果の実行ファイルをS3へアップロードするコマンドを追加するなど必要に応じてカスタマイズする。

## ファイル・ディレクトリ説明
**Dockerfile:**<br>
JMeterコンテナ用のDockerfile。<br>

**master.sh:**<br>
JMeterのMasterで実行するコマンド一覧を設定したシェル。<br>
必要な実行コマンドはここに記入する。<br>

**slave.sh:**<br>
JMeterのSlaveで実行するシェル。<br>
基本的に設定ファイルの更新が必要な場合以外は変更しない。<br>

**jmx/:**<br>
JMeterのシナリオファイルを格納するためのディレクトリ。<br>
デフォルトでは存在しないドメインに対して10回だけリクエストするシナリオファイルが入っている。


## 事前準備
- イメージを格納するためのECRリポジトリを作成しておく。
- JMeterのシナリオファイルを事前にjmxディレクトリ内に格納する。

## イメージのビルド・プッシュ方法

1, ECRへdockerログインする。

(例)<br>
```$(aws ecr get-login --no-include-email --region ap-northeast-1)```

2, プッシュ先のECRリポジトリのURIを指定してbuildコマンドを実行する。

(例)<br>
```docker build . -t xxxxxxxxxx.dkr.ecr.ap-northeast-1.amazonaws.com/jmeter-repository:latest```

3, ECRリポジトリへdockerイメージをプッシュする。

(例)<br>
```docker push xxxxxxxxxx.dkr.ecr.ap-northeast-1.amazonaws.com/jmeter-repository:latest```
