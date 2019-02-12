class Interface
  def initialize()
    @running = 1
  end

  def run
    #start the loop
    while @running
      self.who_are_you
    end
    puts "User quit, goodbye!"
  end
  def get_user_string
    if (input = gets.chomp).length == 0
      raise NoInput
    end
    input
  end

  def get_user_int
    if (input = gets.strip.to_i) == 0
      raise NotInt
    end
    input
  end

  def who_are_you
    puts "Enter your call sign:"
    begin
      call = self.get_user_string
    rescue NoInput => error
      puts error.message
      self.who_are_you
    end
    if (call.downcase == 'quit')
      @running = 0
      return
    else
      @user = User.all.where('call_sign = ?',call).first
      puts "Welcome #{@user.name}"
    end
  end
end
