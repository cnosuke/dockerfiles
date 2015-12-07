```
docker run \
  -e RADIKO_TIME=120  \ # minutes
  -e RADIKO_CHANNEL=TBS  \
  -e OUT_DIR=/mnt/out  \
  -e OUT_FNAME=radiko.mp3 \
  -v /tmp/radiko:/mnt/out \
  cnosuke/radicorder
```

```
docker run \
  -e RADIKO_TIME=120 \ # minutes
  -e RADIKO_CHANNEL=TBS  \
  -e AWS_ACCESS_KEY_ID=hoge \
  -e AWS_SECRET_ACCESS_KEY=hoge \
  -e AWS_REGION='ap-southeast-1' \
  -e AWS_S3_BUCKET='hoge-bucket' \
  -e AWS_S3_OBJECT_KEY=test/test.mp3 \
  cnosuke/radicorder
```
