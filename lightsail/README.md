# 概要
- Lightsailインスタンスを作成します。
- 基本的な設定はデフォルトで立ち上がるので、用途に応じてカスタマイズしてください。
- Lightsailでもユーザーデータを用いて初回起動時のセットアップが可能です。

# パラメータ
<img src="https://noname.work/wp-content/uploads/2021/11/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88-2021-11-13-0.15.48.png" width="600">

| Parameter | Description |
|:---|:---|
| InstanceName | Lightsailインスタンスの名前 |
| InstanceType | LightsailのBundleID。いわゆるインスタンスサイズ |
| ImageType | LightsailのBlueprintId。いわゆるOSイメージ |
| AvailabilityZone | 起動するアベイラビリティゾーン |

***
# 参考URL
- [AWS::Lightsail::Instance](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-lightsail-instance.html)
- [[AWS] LightsailがCFnに対応！早速試してみる](https://noname.work/3302.html)
