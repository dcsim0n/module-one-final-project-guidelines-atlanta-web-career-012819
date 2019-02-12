class NotBool < StandardError
  def message
    "argument is not a boolean value"
  end
end

class NotInt < StandardError
  def message
    "input is not a valid number"
  end
end

class NoInput < StandardError
  def message
    "there was not input or input is too short"
  end
end
