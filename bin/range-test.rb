require_relative '../config/environment.rb'

dana = User.find_by(name:'Dana')

summit = Summit.find_by(summit_code: "W4G/HC-020")



binding.pry
puts "Goodbye"
