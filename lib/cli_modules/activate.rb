module Activate
  def activate
    #activating summit
    while @running #set to false to exit. Break to got back to main
      if self.spot == nil
        puts "Lets create a spot for others to find you..."
        self.create_spot
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
        unless self.spot
          puts "Select a summit to activate first"
          break
        end
        self.log
      else
        #do seomething else
      end
    end
  end #activate loop

  def find
    puts "Search by, 'association', or 'points'"
    case input = get_user_string
    when 'region'
      Summit.group(:association_name).count.each { |asc,value| puts "#{asc}: #{value}" }
    else
      puts "Not done yet.."
    end
  end

  def log
    while @running
      input = get_user_string
      end
    end

  def create_spot
    puts "Enter summit code:"
    input = get_user_string
    unless summit = Summit.all.find_by(summit_code: input)
      puts "Couldn't find summit #{input}"
      return
    end
    puts "Activating #{summit.summit_name} for #{summit.points}"
    puts "Enter your operating frequency"
    freq = get_user_string.to_f
    self.spot = Spot.new(summit: summit, activator: self.user, frequency: freq)
    puts "Posting your spot for: #{summit.summit_code} on: #{freq} MHz..."
    puts "Use 'log' to log new contacts"
  end
end
