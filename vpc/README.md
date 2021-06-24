# 概要
- VPC、PublicSubnet、PrivateSubnetを作成します。
- PrivateSubnetはNATゲートウェイを経由してネットワークと疎通が可能です。
- CIDRとサブネットのレンジはパラメータから自由に設定できます。
- ap-northeast-1で実行する想定で作成しました。

# ファイル説明
create-vpc-2az.yml:
2つのアベイラビリティゾーン(a/c)にそれぞれサブネットを作成するテンプレート。

create-vpc-3az.yml:
2つのアベイラビリティゾーン(a/c/d)にそれぞれサブネットを作成するテンプレート。

## パラメータ

<img src="https://noname.work/wp-content/uploads/2021/06/VPC%E3%83%8F%E3%82%9A%E3%83%A9%E3%83%A1%E3%83%BC%E3%82%BF-1024x611.png" width="600">

| Parameter | Description |
|:---|:---|
| VPCCidrBlock | 構築するVPCのCIDRを指定。既存のVPCと被らない範囲にすること |
| PublicSubnetACidrBlock | VPCのCIDRブロックの範囲内でパブリックサブネットに割り当てるレンジを指定(AZ-a) |
| PublicSubnetCCidrBlock | VPCのCIDRブロックの範囲内でパブリックサブネットに割り当てるレンジを指定(AZ-c) |
| PrivateSubnetACidrBlock | VPCのCIDRブロックの範囲内でプライベートサブネットに割り当てるレンジを指定(AZ-a) |
| PrivateSubnetCCidrBlock | VPCのCIDRブロックの範囲内でプライベートサブネットに割り当てるレンジを指定(AZ-c) |


***
# 参考URL
- [AWS::EC2::InternetGateway](https://docs.aws.amazon.com/ja_jp/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-internetgateway.html)
- [AWS::EC2::VPCGatewayAttachment](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-vpc-gateway-attachment.html)
- [AWS::EC2::VPC](https://docs.aws.amazon.com/ja_jp/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-vpc.html)
- [[AWS] 基本的なVPCを一発で構築するCloudFormationテンプレートを作った](https://noname.work/3011.html)
