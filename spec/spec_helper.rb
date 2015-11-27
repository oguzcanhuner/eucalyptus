require 'dotenv'
Dotenv.load

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rspec'
require 'vcr'
require 'webmock'
require 'eucalyptus'
require 'pry'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.default_cassette_options = {record: :new_episodes}
  config.filter_sensitive_data('<TOKEN>') { ENV['ACCESS_TOKEN'] }
end

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.before do
    Eucalyptus.configure do |config|
      config.access_token = ENV["ACCESS_TOKEN"]
      config.default_account_id = ENV["DEFAULT_ACCOUNT_ID"]
      config.api_version = "v2.4"
    end
  end
end
