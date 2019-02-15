require 'bundler'
Bundler.require
# require "pry"
# require "sinatra/activerecord"
# require "rest-client"
# require "sqlite3"

require_relative '../lib/cli_modules/main.rb'
require_relative '../lib/cli_modules/chase.rb'
require_relative '../lib/cli_modules/activate.rb'

require_relative '../lib/summit.rb'
require_relative '../lib/user.rb'
require_relative '../lib/user_setting.rb'
require_relative '../lib/errors.rb'
require_relative '../lib/cli.rb'
require_relative '../lib/contact.rb'
require_relative '../lib/spot.rb'
require_relative '../lib/fetcher.rb'
require_relative '../lib/gridsquare.rb'












ActiveRecord::Base.establish_connection(
  "adapter"  => "sqlite3",
  "database" => "db/sota-watch.db"
)
