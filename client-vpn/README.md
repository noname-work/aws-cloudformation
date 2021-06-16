# 概要

- 相互認証のClientVPNエンドポイントを作成するテンプレートです。
- 2つのサブネットまで紐付けることができます。
- 必要に応じて紐付けるサブネットの数を修正してお使いください。
- 事前準備に[相互認証](https://docs.aws.amazon.com/ja_jp/vpn/latest/clientvpn-admin/client-authentication.html#mutual)の作成が必要です。


# ファイル説明
create-clientvpn-cfn.yml:
VPNエンドポイントを作成するテンプレート。

add-route-table-cfn.yml:
ルートテーブルを追加するテンプレート。


## create-clientvpn-cfn.yml
<img src="https://noname.work/wp-content/uploads/2021/06/1%E3%82%A8%E3%83%B3%E3%83%88%E3%82%99%E3%83%9B%E3%82%9A%E3%82%A4%E3%83%B3%E3%83%88%E3%81%AE%E4%BD%9C%E6%88%90.png" width="600">

| Parameter | Description |
|:---|:---|
| ServerCertificateARN | 相互認証の作成時に生成したサーバ証明書のARN |
| ClientCertificateARN | 相互認証の作成時に生成したクライアント証明書のARN |
| ClientCIDR | VPNで利用するCIDR。これはVPCと被らない範囲で指定する必要がある |
| VPCID | 紐付けるVPCのIDをプルダウンから選択する |
| SubnetID1 | 紐付けるサブネットのIDをプルダウンから選択する |
| SubnetID2 | 紐付けるサブネットのIDをプルダウンから選択する。サブネットの数に応じて課金が発生するので、不要な場合はテンプレートを編集してこの項目と関連する部分をコメントアウトする |

## add-route-table-cfn.yml
<img src="https://noname.work/wp-content/uploads/2021/06/4-%E3%83%AB%E3%83%BC%E3%83%88%E3%83%86%E3%83%BC%E3%83%95%E3%82%99%E3%83%AB%E3%81%AE%E8%BF%BD%E5%8A%A0.png" width="600">

| Parameter | Description |
|:---|:---|
| AccessRange1 | ルートテーブルに追加するルーティング先を指定する。パブリックなIPに対しても可能だが、0.0.0.0/0はデフォルトで無効にしている |
| SubnetID1 | AccessRange1と紐付けるサブネットのIDを指定する |
| AccessRange2 | ルートテーブルに追加するルーティング先を指定する。不要であればテンプレートを編集してこの項目と関連する部分をコメントアウトする |
| SubnetID2 | AccessRange1と紐付けるサブネットのIDを指定する。不要であればテンプレートを編集してこの項目と関連する部分をコメントアウトする |

***
# 参考URL
- [クライアントVPNの開始方法](https://docs.aws.amazon.com/ja_jp/vpn/latest/clientvpn-admin/cvpn-getting-started.html)
- [相互証明書](https://docs.aws.amazon.com/ja_jp/vpn/latest/clientvpn-admin/client-authentication.html#mutual)
- [マネージドなVPNサービスのClient VPNを試してみた。](https://noname.work/2949.html)
- [Client VPN環境を作るためのCloudFormationを書いてみた。](https://noname.work/2952.html)
