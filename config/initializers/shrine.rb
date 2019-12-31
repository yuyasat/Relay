require 'shrine'
require "shrine/storage/s3"
puts ENV['AWS_BUCKET']
s3_options = {
  bucket:            ENV['AWS_BUCKET'],
  access_key_id:     ENV['AWS_S3_ACCESS_KEY_ID'].presence || ENV['AWS_ACCESS_KEY_ID'],
  secret_access_key: ENV['AWS_S3_SECRET_ACCESS_KEY'].presence || ENV['AWS_SECRET_ACCESS_KEY'],
  region:            ENV['AWS_REGION'].presence || 'ap-northeast-1'
}

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: "#{ENV['AWS_S3_PREFIX']}/cache", **s3_options),
  store: Shrine::Storage::S3.new(prefix: "#{ENV['AWS_S3_PREFIX']}/store", **s3_options)
}

Shrine.plugin :activerecord
