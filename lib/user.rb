class User < ActiveRecord::Base
  has_many :user_settings
  has_many :activator_contacts, class_name: "Contact", foreign_key: :activator_id
  has_many :chaser_contacts, class_name: "Contact", foreign_key: :chaser_id
  has_many :chased_summits, through: :chaser_contacts, source: :summit
  has_many :activated_summits, through: :activator_contacts, source: :summit


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
  end#activating?

  def activating=(arg) #converts integer to true false
    case arg
    when true
      binding.pry
      act_set = self.user_settings.find_or_create_by(setting_name:'activator')
      act_set.setting_value = 1
    when false
      self.settings['activator'].setting_value = 0
    else
      raise NotBool
    end
  end #activating=()
  def activator_points
    activated_summits.reduce(0) {|pts, summit| pts + summit.points}
  end
  def chaser_points
    chased_summits.reduce(0) {|pts, summit| pts + summit.points}
  end
end
