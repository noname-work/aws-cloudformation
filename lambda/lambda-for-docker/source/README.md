# このディレクトリについて
LambdaからAWS CLIコマンドを実行するためのDockerイメージを作成する。<br>
buildしたdockerイメージはECRリポジトリに格納後、CloudFormationでLambda関数を作成するために参照される。

lambda.sh内に記載したコマンドが実行されるので必要に応じて編集しておく。<br>
例として、指定したタグに特定の値が入っていた場合に対象インスタンスを削除するコマンドを記載している。

# 事前準備
イメージを格納するためのECRリポジトリを作成しておく。

# イメージのビルド・プッシュ方法

1, ECRへdockerログインする。

(例)<br>
```$(aws ecr get-login --no-include-email --region ap-northeast-1)```

2, プッシュ先のECRリポジトリのURIを指定してbuildコマンドを実行する。

(例)<br>
```docker build . -t xxxxxxxxxx.dkr.ecr.ap-northeast-1.amazonaws.com/lambda-docker:latest```

3, ECRリポジトリへdockerイメージをプッシュする。

(例)<br>
```docker push xxxxxxxxxx.dkr.ecr.ap-northeast-1.amazonaws.com/lambda-docker:latest```
