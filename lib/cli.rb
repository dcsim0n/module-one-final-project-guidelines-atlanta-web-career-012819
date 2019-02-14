class Interface
  attr_accessor :user, :settings, :spot
  include Activate
  include Chase
  include Main
  def initialize()
    @running = true
    @user = nil
    @settings = {max_spots: 4, region_filter: nil, range_filter: nil}
    @spot = nil
  end

  def run    #start the loop
    while @running
      puts "**** Main Menu, please enter a command:"
      if self.user
        puts "You are currently operating as #{self.user.activator ? 'Activator' : 'Chaser'}"
      end
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
          puts `clear`
          puts "Seting status to chasing...."
          puts "Here is some recent activity"
          self.show_spots(2)
          self.chase
        else
          self.no_user
        end
      when 'contacts'
        #This will be another run loop
        puts "Showing all your contacts..."
      when 'activate'
        if self.user
          user.activator = true
          puts "Seting status to activating! Yeehaw!"
          self.activate
        else
          self.no_user
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
      when 'delete user'
        if self.user
          puts "Deleting #{self.user.call_sign} from the database? Y/N"
          if get_user_string == 'Y'
            self.user.destroy()
            self.user = nil
          else
            puts "Canceled.."
          end
        end
      when 'users'
        User.all.each do |user|
          puts "#{user.call_sign}: #{user.name}   - #{user.grid}"
        end
      else
        puts "Unknown command, type help for a list of commands."
      end
  end


end
