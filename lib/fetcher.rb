class Fetcher
  @@spots = {}
  attr_accessor :root_url, :max_spots, :response, :spots
  def initialize(max_spots: 10, filter: nil)
    @max_spots = max_spots
    @filter = nil
    @root_url = 'http://api2.sota.org.uk/api'
    @response = nil
    @spots = nil
  end
  def fetch(url)
    self.response = RestClient.get(url)
  end
  def get_spots
    self.spots = nil #reset old spots if there are any
    fetch("#{self.root_url}/spots/#{self.max_spots}/all")
    if self.response.code == 200
      self.spots = JSON.parse(self.response.body)
    end
    self.spots
  end
end
