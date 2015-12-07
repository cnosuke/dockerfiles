require 'dotenv'
Dotenv.load

require './s3_uploader'
require 'radicorder'



options = {
  time:    (ENV['RADIKO_TIME'] || 1),
  channel: (ENV['RADIKO_CHANNEL'] || 'TBS'),
  flvout:  './tmp/out.flv',
  mp3out:  './tmp/out.mp3',
}

recorder = Radicorder::Recorder.ready(
  options[:time],
  options[:channel],
  options[:flvout],
  options[:mp3out]
)

recorder.authenticate!
recorder.record!
recorder.convert!

if ENV['OUT_DIR'] && ENV['OUT_FNAME']
  out_filepath = "#{ENV['OUT_DIR']}/#{ENV['OUT_FNAME']}"
  system('cp', options[:mp3out], out_filepath)
end

aws_ready = %w(
  AWS_ACCESS_KEY_ID
  AWS_SECRET_ACCESS_KEY
  AWS_REGION
  AWS_S3_BUCKET
  AWS_S3_OBJECT_KEY
).all?{|e| !!ENV[e] }

if aws_ready
  S3Uploader.put(ENV['AWS_S3_OBJECT_KEY'], File.open(options[:mp3out]))
end
