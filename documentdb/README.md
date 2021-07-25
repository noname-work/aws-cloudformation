# 概要
- DocumentDBのクラスター構成を構築します。
- 許可したセキュリティグループからのアクセスのみを許可します。
- サブネットグループ、パラメータグループ、セキュリティグループとDocDBインスタンスが作成されます。

## パラメータ

| Parameter | Description |
|:---|:---|
| ServiceName | DocDBクラスターの名前。関連リソースの名前も同様の名前が入る |
| VPCID | セキュリティグループを作成するVPC |
| RdsSubnetIDs | サブネットグループに登録する対象を複数指定 |
| AccessSecurityGroup | DocDBへのアクセスを許可するセキュリティグループ |
| RootUserName | データベースの最上位ユーザー |
| RootPassword | データベースの最上位ユーザーのパスワード |
| RdsInstanceType | 実行するDocDBインスタンスのタイプ |

***
# 参考URL
- [AWS::DocDB::DBCluster](https://docs.aws.amazon.com/ja_jp/AWSCloudFormation/latest/UserGuide/aws-resource-docdb-dbcluster.html)
- [AWS::DocDB::DBClusterParameterGroup](https://docs.aws.amazon.com/ja_jp/AWSCloudFormation/latest/UserGuide/aws-resource-docdb-dbclusterparametergroup.html)
- [AWS::DocDB::DBSubnetGroup](https://docs.aws.amazon.com/ja_jp/AWSCloudFormation/latest/UserGuide/aws-resource-docdb-dbsubnetgroup.html)
- [AWS::DocDB::DBInstance](https://docs.aws.amazon.com/ja_jp/AWSCloudFormation/latest/UserGuide/aws-resource-docdb-dbinstance.html)
