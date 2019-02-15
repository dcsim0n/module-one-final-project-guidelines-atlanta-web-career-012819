require_relative '../config/environment.rb'

dana = User.find_by(name:'Dana')

point = Gridsquare.new(grid: dana.grid)
summit = Summit.find_by(summit_code: "W4G/HC-020")



binding.pry
puts "Goodbye"
