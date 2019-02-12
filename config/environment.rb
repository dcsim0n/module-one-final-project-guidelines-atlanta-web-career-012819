require 'bundler'
Bundler.require
# require "pry"
# require "sinatra/activerecord"
# require "rest-client"
# require "sqlite3"

require_relative '../lib/summit.rb'
require_relative '../lib/user.rb'
require_relative '../lib/user_setting.rb'
require_relative '../lib/errors.rb'
require_relative '../lib/cli.rb'
require_relative '../lib/contact.rb'






ActiveRecord::Base.establish_connection(
  "adapter"  => "sqlite3",
  "database" => "db/sota-watch.db"
)
