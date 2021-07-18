#!/bin/bash

# SSL設定を無効にする
sed -i -e "s/#server.rmi.ssl.disable=false/server.rmi.ssl.disable=true/g" /jmeter/apache-jmeter-5.4/bin/jmeter.properties

# FargateのIPリストを取得する
SERVER_IP_LIST=`ecs-cli ps --desired-status RUNNING --cluster ${CLUSTER_NAME} | grep ${SLAVE_SERVICE_NAME} | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | tr '\n' ',' | sed 's/,*$//'`

# FargateのIPリストをスレーブ用に登録する
sed -i -e "s/remote_hosts=.*/remote_hosts=${SERVER_IP_LIST}/g" /jmeter/apache-jmeter-5.4/bin/jmeter.properties

# 実行コマンド
/jmeter/apache-jmeter-5.4/bin/jmeter.sh -n -t /files/jmx/$1 -r

# ログをCloudWatchLogsへ出力
cat /files/jmeter.log

# 終了後にFargateを停止させる
aws ecs update-service --cluster ${CLUSTER_NAME} --service ${MASTER_SERVICE_NAME} --desired-count 0 >&/dev/null
