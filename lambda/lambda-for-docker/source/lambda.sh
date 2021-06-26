function handler () {

    # 特定のタグがついたEC2インスタンスを削除する
    aws ec2 terminate-instances --instance-ids $(aws ec2 describe-instances --filters "Name=tag:${TAG_NAME},Values=${TAG_VALUE}" |  jq -r '.Reservations[].Instances[].InstanceId')

}
