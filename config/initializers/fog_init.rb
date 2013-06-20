CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                               # required
    :aws_access_key_id      => ENV['AWSKEY'],                       # required
    :aws_secret_access_key  => ENV['AWSSEC'],                       # required
    :region                 => 'us-east-1'                          # optional, defaults to 'us-east-1'
  }
  # config.fog_directory  = 'temp-cm'                                 # required
  config.fog_public     = false                                     # optional, defaults to true
  # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  # config.asset_host   = 'https://assets.example.com'              # optional, defaults to nil
end

config.cache_dir = "#{Rails.root}/tmp/uploads"                     # Generate http:// urls. Defaults to :authenticated_read (https://)

CarrierWave.configure {|config| config.fog_directory = 'senatest-development'} if Rails.env.development?
CarrierWave.configure {|config| config.fog_directory = 'senatest-test'} if Rails.env.test?
CarrierWave.configure {|config| config.fog_directory = 'senatest-production'} if Rails.env.production?