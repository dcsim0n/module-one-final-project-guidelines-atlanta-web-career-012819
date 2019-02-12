class Interface
  def initialize()
    @running = true
  end

  def run    #start the loop
    while @running
      puts "Welcome, please enter a command:"
      begin
        input = get_user_string
      rescue NoInput => error
        error.message
        next
      end #end error handling
      main_tree(input)
    end
    puts "User quit, goodbye!"
  end #run
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
    @user = User.all.where('call_sign = ?',call).first
    puts "Welcome #{@user.name}"
  end #who are you
  def help
    puts '''help: print this message
chase: operate as a chaser
activate: operate as an activator
spots: view current spots from activators
settings: change your user settings'''
  end

  def main_tree(input)
      #binding.pry
      case input
      when 'quit'
        @running = false
      when 'help'
        self.help
      when 'chase'
        self.who_are_you
      when 'activate'
        self.who_are_you
      when 'spots'
        puts "Recent spots...."
      when 'settings'
        puts "changing your settings..."
      else
        puts "Unknown command, type help for a list of commands."
      end
  end
end
