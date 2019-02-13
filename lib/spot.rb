class Spot
  @@all = []

  attr_reader :activator, :summit, :frequency

  def self.all
    @@all
  end

  def initialize(activator:, summit:, frequency:)
    @activator = activator
    @summit = summit
    @frequency = frequency
    @@all << self
  end

  #create a new spot from database ID
  def self.new_from_id(activator_id:, summit_id:, frequency:)
    activator = User.find(activator_id)
    summit = Summit.find(summit_id)
    Spot.new(
      activator: activator,
      summit: summit,
      frequency: frequency)
  end
  #create a new spot from web data
  def self.new_from_web(web_hash)

    activator = User.find_or_create_by(name: web_hash['activatorName'],
                                       call_sign: web_hash['activatorCallsign'])

    summit_code = [web_hash['associationCode'],web_hash['summitCode']].join('/')
    summit = Summit.all.find_by(summit_code: summit_code)
    Spot.new(
      activator: activator,
      summit: summit,
      frequency: web_hash['frequency']
    )
  end

  def self.print_formated_spots
    self.all.each do |spot|
      summit_name = spot.summit.summit_name
      height = spot.summit.alt_ft
      points = spot.summit.points
      summit_code = spot.summit.summit_code
      call = spot.activator.call_sign
      name = spot.activator.name
      freq = spot.frequency
      puts """\n*** #{summit_name}, #{height} ft, #{points} points ***
- #{summit_code}
- #{call}: #{name}
- frequency: #{freq}\n"""
    end
    nil
  end
end
