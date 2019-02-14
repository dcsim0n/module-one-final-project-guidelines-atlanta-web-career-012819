module Chase
  def chase
    while @running
      puts "Enter a command:"
      input = get_user_string
      case input
      when 'main'
        break
      when 'quit'
        @running = false
      when 'log'
        puts "Which spot have you contacted?"
        input = get_user_int
        self.log_from_spot(Spot.all[input - 1])
      when 'spots'
        show_spots(settings[:max_spots])
      when 'help'
        self.chase_help
      else
        puts "Unknown command, use 'help' for a list"
      end
    end
  end #chase loop

  def log_from_spot(spot)
    puts "Add contact log entry with #{spot.activator.call_sign}, from #{spot.summit.summit_code}? y/n"
    input = get_user_string
    case input
    when 'y'
      self.user.contact_from_spot(spot)
      puts "Congrats! you now have #{self.user.chaser_points} chaser points!"
    when 'n'
      puts "Thats fine, keep chasing!"
    else
      puts "I don't understand"
    end
  end #log from spot

  def chase_help
    puts """help: print this help message
log: log a contact with an activator using a sota spot
main: go back to the main menu
quit: get me the heck out of here!"""

  end
end
