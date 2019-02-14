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

  def activator_points
    activated_summits.reduce(0) {|pts, summit| pts + summit.points}
  end
  def chaser_points
    chased_summits.reduce(0) {|pts, summit| pts + summit.points}
  end

  def activator=(bool)
    super(bool)
    self.save
  end

  def contact_from_spot(spot)
      self.chaser_contacts.create(summit_id: spot.summit.id,
                                  activator_id: spot.activator.id,
                                  freq: spot.frequency,
                                  band: 'no band',
                                  date: Time.now)
      self.reload

  end

  def contact_with_chaser_and_spot(name:, call_sign:, spot:)
    chaser = User.all.find_or_create_by(name: name, call_sign: call_sign)
    self.activator_contacts.create(summit_id: spot.summit.id,
                                   chaser_id: chaser.id,
                                   freq: spot.frequency,
                                   band: 'no band',
                                   date: Time.now)
    self.reload
  end
end
