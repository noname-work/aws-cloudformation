# 概要
- Auroraのクラスター構成を構築します。
- 許可したセキュリティグループからのアクセスのみを許可します。
- サブネットグループ、パラメータグループ、セキュリティグループとDBインスタンスが作成されます。
- リソースを削除した場合に自動的にスナップショットが作成されます。

## パラメータ

| Parameter | Description |
|:---|:---|
| ServiceName | Auroraクラスターの名前。関連リソースの名前も同様の名前が入る |
| VPCID | セキュリティグループを作成するVPC |
| RdsSubnetIDs | サブネットグループに登録する対象を複数指定 |
| AccessSecurityGroup | Auroraへのアクセスを許可するセキュリティグループ |
| RootUserName | データベースの最上位ユーザー |
| RootPassword | データベースの最上位ユーザーのパスワード |
| RdsInstanceType | 実行するRDSインスタンスのタイプ |

***
# 参考URL
- [AWS::RDS::DBCluster](https://docs.aws.amazon.com/ja_jp/AWSCloudFormation/latest/UserGuide/aws-resource-rds-dbcluster.html)
- [AWS::RDS::DBInstance](https://docs.aws.amazon.com/ja_jp/AWSCloudFormation/latest/UserGuide/aws-properties-rds-database-instance.html)
