#!/bin/bash

# SSL設定を無効にする
sed -i -e "s/#server.rmi.ssl.disable=false/server.rmi.ssl.disable=true/g" /jmeter/apache-jmeter-5.4/bin/jmeter.properties

# 実行コマンド
/jmeter/apache-jmeter-5.4/bin/jmeter-server
