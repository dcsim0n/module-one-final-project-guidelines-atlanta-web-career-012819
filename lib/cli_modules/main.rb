module Main
  def get_user_string
    if (input = gets.chomp).length == 0
      raise NoInput
    end
    input
  end #get user string

  def get_user_int
    if (input = gets.strip.to_i) == 0
      raise NotInt
    end
    input
  end #get user int

  def who_are_you
    puts "Enter your call sign:"
    begin
      call = self.get_user_string
    rescue NoInput => error
      puts error.message
      self.who_are_you
    end

    unless self.user = User.all.find_by(call_sign: call)
      puts "Couldn't find your callsign, if you are new create a new User"
      return
    end
    puts "Welcome #{@user.name}."
  end #who are you

  def help
    puts '''help: print this message
  chase: operate as a chaser
  activate: operate as an activator
  spots: view current spots from activators
  settings: change your user settings
  user: load or change users
  points: view a users SOTA points'''
  end
  def no_user
    puts "No user profile, use 'user' to set one"
  end
  def show_spots(num)
    Spot.clear
    fetcher = Fetcher.new(max_spots: num) unless Spot.all.count > num
    fetcher.get_spots.each { |spot| Spot.new_from_web(spot) }
    Spot.print_formated_spots
  end

  def new_user
    puts "Hi, lets setup your profile"
    puts "First, enter your first name:"
    name = get_user_string
    puts "Ok #{name}, now enter your callsign"
    call_sign = get_user_string
    puts "Great, enter your Grid square, or enter if you don't know it"
    grid = gets.strip
    self.user = User.create(name: name, call_sign: call_sign, grid: grid)
    puts "Awesome! created: #{user.id}, Named: #{user.name} in grid: #{user.grid}, call sign: #{user.call_sign}"
  end
end