module Main
  def get_user_string
    if (input = gets.chomp).length == 0
      puts "No input, or input is empty"
      get_user_string
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
    puts '''
activate: _ _ operate as an activator
chase:        operate as a chaser
points: _ _ _ view a users SOTA points
help:         print this message
spots: _ _ _ _view current spots from activators
settings:     change your user settings
user: _ _ _ _ load or change users
users:        list all current users
delete user:  delete current user profile
new: _ _ _ _  create a new user
'''
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

  def change_settings
    puts `clear`
    puts "*** Setings Menu ***"
    self.settings.each_with_index do |setting, i|
      puts "(#{i + 1}.) #{setting[0]}: #{setting[1]}"
    end
    puts "Enter a setting to change, 'done' to go back to main menu"
    until (input = get_user_string) == 'done'
      i = input.to_i - 1
      puts "Changing #{settings.keys[i]}: #{settings.values[i]}"
      input = get_user_string
      binding.pry
      case settings.keys[i].class
      when Integer
        settings[settings.keys[i]] = input.to_i
      end
    end
  end
end
