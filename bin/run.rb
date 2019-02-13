require_relative "../config/environment.rb"
#Turn off logger for the main cli
ActiveRecord::Base.logger = nil
app = Interface.new()

app.run
