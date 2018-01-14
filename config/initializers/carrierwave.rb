require "carrierwave/storage/fog"

CarrierWave.configure do |config|
  config.root = Rails.root.join("tmp")
  config.cache_dir ='carrierwave'

  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV["AWS_ACCESS_KEY"],        # required
    aws_secret_access_key: ENV["AWS_SECRET_KEY"], 
    region:                'eu-central-1'       # required
  }
  config.fog_directory  = ENV["ordering-food"]              # required'
  config.fog_public = false
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end