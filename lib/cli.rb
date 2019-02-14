class Interface
  attr_accessor :user, :settings
  include Chase
  include Main
  def initialize()
    @running = true
    @user = nil
    @settings = {max_spots: 4, region_filter: nil, range_filter: nil}
  end

  def run    #start the loop
    while @running
      puts "Welcome, please enter a command:"
       #get some user input
      input = get_user_string
      main_tree(input)
    end
    puts "User quit, goodbye!"
  end #run

  def main_tree(input)
      #binding.pry
      case input
      when 'quit'
        @running = false
      when 'exit'
        @running = false
      when 'help'
        self.help
      when 'chase'
        if self.user
          user.activator = false
          puts "Seting status to chasing...."
          puts "Here is some recent activity"
          self.show_spots(2)
          self.chase
        else
          no_user
        end

      when 'activate'
        if user == nil
          self.no_user
        else
          user.activator = true
          puts "Seting status to activating! Yeehaw!"
          puts "Lets activate!"
        end
      when 'user'
        self.who_are_you
      when 'spots'
        self.show_spots(settings[:max_spots])
      when 'points'
        if self.user
          puts "****************************"
          puts "Points for #{user.name}: #{user.call_sign}"
          puts "Chaser: #{user.chaser_points}"
          puts "Activator: #{user.activator_points}"
          puts "****************************"
        else
          self.no_user
        end
      when 'settings'
        puts "changing your settings..."
      when 'new'
        self.new_user
      else
        puts "Unknown command, type help for a list of commands."
      end
  end


end
