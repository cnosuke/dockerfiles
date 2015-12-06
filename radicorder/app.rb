require 'dotenv'
Dotenv.load

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
