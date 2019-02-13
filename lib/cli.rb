class Interface
  attr_accessor :user
  def initialize()
    @running = true
    @user = nil
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
      when 'help'
        self.help
      when 'chase'
        if self.user
          user.activating = false
          puts "Seting status to chasing...."
          puts "Here is some recent activity"
          self.show_spots(2)
        else
          no_user
        end

      when 'activate'
        if user == nil
          self.no_user
        else
          user.activating = true
          puts "Seting status to activating! Yeehaw!"
          puts "Lets activate!"
        end
      when 'user'
        self.who_are_you
      when 'spots'
        self.show_spots
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
    puts "OK, Lets chase some summits!"
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
    puts "Welcome #{@user.name}"
  end #who are you

  def help
    puts '''help: print this message
chase: operate as a chaser
activate: operate as an activator
spots: view current spots from activators
settings: change your user settings'''
  end
  def no_user
    puts "No user profile, use 'user' to set one"
  end
  def show_spots(num)
    fetcher = Fetcher.new(max_spots: num)
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
    user = User.create(name: name, call_sign: call_sign, grid: grid)
    puts "Awesome! created: #{user.id}, Named: #{user.name} in grid: #{user.grid}, call sign: #{user.call_sign}"
  end
end
