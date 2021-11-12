FROM amazonlinux:2

# 必要ものをインストール
RUN yum install -y awscli wget tar java-1.8.0-openjdk.x86_64 java-1.8.0-openjdk-devel.x86_64

# ECS CLIを利用するためインストール
RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest
RUN chmod +x /usr/local/bin/ecs-cli

# JMeterのインストール
RUN mkdir /jmeter && cd /jmeter \
    && wget http://ftp.kddilabs.jp/infosystems/apache//jmeter/binaries/apache-jmeter-5.4.tgz \
    && tar -xf apache-jmeter-5.4.tgz

# 作業ディレクトリの作成
WORKDIR /files

# シナリオファイルと実行シェルの追加
ADD jmx ./jmx
ADD master.sh .
ADD slave.sh .

CMD ["sh","slave.sh"]
