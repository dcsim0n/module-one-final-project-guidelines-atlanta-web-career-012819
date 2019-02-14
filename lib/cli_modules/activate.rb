module Activate
  def activate
    #activating summit
    while @running #set to false to exit. Break to got back to main
      if self.spot == nil
        puts "Lets create a spot for others to find you..."
        until self.spot
          self.create_spot
        end
      else
        puts "Use 'log' to log new contacts with chasers"
      end
      input = get_user_string
      case input
      when 'main'
        break
      when 'quit'
        @running = false
      when 'find'
        self.find
      when 'log'
        self.log
      when 'spot'
        self.create_spot
      when 'help'
        self.help
      else
        #do seomething else
      end
    end
  end #activate loop

  def find
    # puts "Search by, 'association', or 'points'"
    # case input = get_user_string
    # when 'region'
    #   Summit.group(:association_name).count.each { |asc,value| puts "#{asc}: #{value}" }
    # else
    #   puts "Not done yet.."
    # end
  end

  def log #this is a good place to use the qrz api
    puts "Enter a chaser Callsign:"
    call = get_user_string
    puts "Enter name for: #{call}"
    name = get_user_string
    contact = self.user.contact_with_chaser_and_spot(name: name, call_sign: call, spot: self.spot)
    puts "Logged contact with #{call} on #{spot.frequency}MHz at #{contact.date} "
  end

  def create_spot
    puts "Enter summit code:"
    input = get_user_string
    unless summit = Summit.all.find_by(summit_code: input)
      puts "Couldn't find summit #{input}"
      return
    end
    puts "Activating #{summit.summit_name} for #{summit.points} points"
    puts "Enter your operating frequency"
    freq = get_user_string.to_f
    self.spot = Spot.new(summit: summit, activator: self.user, frequency: freq)
    puts "Posting your spot for: #{summit.summit_code} on: #{freq} MHz..."
    puts "Use 'log' to log new contacts"
  end

  def help
  puts """help: display this message
log: log a new contact with chasers, must use 'spot' to create spot first
spot: create and post a new spot for chasers to find you
main: return to main menu
quit: exit right now!"""
  end
end
