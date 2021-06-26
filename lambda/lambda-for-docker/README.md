# 概要
- コンテナイメージから実行するLambdaを構築します。
- CloudWatchEventsにより定期的にLambdaが実行されます。
- 実行するコンテナイメージは[source](source/)ディレクトリ内でビルドして作成してください。
- Lambdaが実行する内容は[lambda.sh](source/lambda.sh)を編集することで自由に設定できます。
- デフォルトの設定では24時間ごとに特定のタグがついたEC2インスタンスを削除する処理が実行されます。

## ディレクトリ構成
**source**:<br>
Lambdaで実行するためのコンテナイメージを作成するためのファイル群。<br>
必要に応じてDockerfileやシェルスクリプトの内容を書き換えること。

**template**:<br>
AWSインフラ環境を構築するためのCloudFormationテンプレート。<br>

## サンプル構成
<img src="https://noname.work/wp-content/uploads/2021/06/%E8%A7%A3%E8%AA%AC-1024x611.png" width="600">
サンプルでは毎日24時にLambdaを実行して、タグ内にdelete:trueが設定されているEC2インスタンスを全て削除する環境が構築される。

***
# 参考URL
- [【AWS】Lambdaがコンテナイメージに対応！お手軽にAWS CLIなどの実行スケジュールも組める！](https://noname.work/2612.html)
- [[AWS] サクッと定期実行をカンタン導入！Dockerイメージを使ったLambda構築](https://noname.work/3028.html)
- [New for AWS Lambda – Container Image Support](https://aws.amazon.com/jp/blogs/aws/new-for-aws-lambda-container-image-support/)
