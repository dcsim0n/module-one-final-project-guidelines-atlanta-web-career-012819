class User < ActiveRecord::Base
  has_many :user_settings
  has_many :activator_contacts, class_name: "Contact", foreign_key: :activator_id
  has_many :chaser_contacts, class_name: "Contact", foreign_key: :chaser_id
  has_many :chased_summits, through: "Contacts", foreign_key: :chaser_id


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
