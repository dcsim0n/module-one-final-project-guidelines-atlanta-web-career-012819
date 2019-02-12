class User < ActiveRecord::Base
  has_many :user_settings

  def settings
    #This gives me a named hash to make settings easier
    sets = {}
    self.user_settings.each { |s| sets[s.setting_name] = s  }
    sets
  end
  def activating?
    row = self.user_settings.find { |s| s.setting_name == 'activator' }
    if row.setting_value == 1
      true
    else
      false
    end
  end
  def activating=(arg)
    case arg
    when true
      self.settings['activator'].setting_value = 1
    when false
      self.settings['activator'].setting_value = 0
    else
      raise NotBool
    end
  end
end
