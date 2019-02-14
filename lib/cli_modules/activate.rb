module Activate
  def activate
    while @running #set to false to exit. Break to got back to main
      puts "Which summit will you activate? use 'find' to search"
      input = get_user_string
      case input
      when 'main'
        break
      when 'quit'
        @running = false
      when 'find'
        puts "Search by, 'association', or 'points'"
        case input = get_user_string
        when 'region'
          Summit.group(:association_name).count.each { |asc,value| puts "#{asc}: #{value}" }
        else
          puts "Not done yet.."
        end
      else
        if summit = Summit.all.find_by(summit_code: input)
          puts "Activating #{summit.summit_name}, #{summit.summit_code}"
        end
      end
    end
  end #activate loop

end
