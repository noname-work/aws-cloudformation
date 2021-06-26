## 構成図
<img src="https://noname.work/wp-content/uploads/2021/06/%E6%A7%8B%E6%88%90-1.png" width="400">
CloudWatchEventsによる定期実行設定とLambda実行用のIAMロール、<br>
ECRリポジトリから取得したコンテナイメージからLambdaを構築する。

## 構築の流れ
1, ecr-repo-create.ymlテンプレートでECRリポジトリを作成する<br>
2, [sourceディレクトリ](../source)内でDockerイメージをビルドする<br>
3, ECRにDockerイメージをpushする<br>
4, lambda-for-docker.ymlテンプレートでLambdaを構築


## ファイル説明
**ecr-repo-create.yml:**<br>
Lambda用のdockerイメージを格納するECRリポジトリを作成するテンプレート。<br>
パラメータなし。

**lambda-for-docker.yml:**<br>
DockerイメージからLambdaを作成し、定期実行の設定を行うテンプレート。

## パラメータ
<img src="https://noname.work/wp-content/uploads/2021/06/%E3%83%8F%E3%82%9A%E3%83%A9%E3%83%A1%E3%83%BC%E3%82%BF-1024x837.png" width="600">

| Parameter | Description |
|:---|:---|
| LambdaName | Lambda関数の名前を設定 |
| LambdaEcrUri | Lambdaを立ち上げるためのコンテナイメージのURIを指定 |
| EventTimeCron | Lambdaを定期実行させるためのcron式を入力 |
| EnvTagName | 今回のシェルスクリプトで利用する環境変数。EC2インスタンスのタグのキーを指定 |
| EnvTagValue | 今回のシェルスクリプトで利用する環境変数。EC2インスタンスのタグの値を指定 |
