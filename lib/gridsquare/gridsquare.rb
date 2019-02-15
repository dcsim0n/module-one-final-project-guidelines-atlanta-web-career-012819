class Gridsquare
  ALPHABET = ('A'..'S').to_a

  attr_reader :coordinate, :grid
  def initialize(grid:)
    @grid = grid_string
    lat,lng = Gridsquare.grid_string_to_lat_long(grid_string)
    @coordinate = Geokit::LatLng.new(lat,lng)
  end

  def self.alpha_to_int(alpha)
    ALPHABET.find_index(alpha)
  end
  def distance_to_grid(grid) #take another grid opbjec and calculate the distance.
    other_point = grid.coordinate
    self.coordinate.distance_to(other_point).to_i
  end
  def self.calc_longitude(msb:, lsb:)
    longitude = msb * 10
    longitude = longitude + lsb
    longitude = longitude * 2
    longitude = longitude - 180
  end

  def self.calc_latitude(msb:, lsb:)
    latitude = msb * 10
    latitude = latitude + lsb

    latitude = latitude - 90
  end
  def self.grid_string_to_lat_long(grid_string)
    #Accepts a four character grid refference and converts in too
    #Latitude and Longitude
    # !!FIX ME!!  #
    #Six character strings would be more precise, we will get there.
    longMSB = alpha_to_int(grid_string[0])
    longLSB = grid_string[2].to_i

    longitude = self.calc_longitude(msb: longMSB, lsb: longLSB)

    latMSB = alpha_to_int(grid_string[1])
    latLSB = grid_string[3].to_i

    latitude = self.calc_latitude(msb: latMSB, lsb: latLSB)

    [latitude, longitude]
  end
end
