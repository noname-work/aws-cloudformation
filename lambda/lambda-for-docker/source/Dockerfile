# Lambdaイメージを指定
FROM public.ecr.aws/lambda/provided:latest

# AWS CLIとjqコマンドを使うのでインストール
RUN yum install -y awscli jq

# boostrapとLambdaのスクリプトをコピーする
COPY bootstrap /var/runtime/bootstrap
COPY lambda.sh /var/runtime/lambda.sh

# 雑に権限付与
RUN chmod 755 /var/runtime/bootstrap /var/runtime/lambda.sh
CMD ["lambda.handler"]
