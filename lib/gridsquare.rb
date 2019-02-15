class Gridsquare
  ALPHABET = ('A'..'X').to_a

  attr_reader :coordinate, :grid
  def initialize(grid:)
    @grid = grid
    lat,lng = Gridsquare.grid_string_to_lat_long(grid)
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
  def self.calc_lng_sub_square(alpha)
    mult = self.alpha_to_int(alpha.upcase)
    0.083334 * mult
  end

  def self.calc_lat_sub_square(alpha)
    mult = self.alpha_to_int(alpha.upcase)
    0.041667 * mult
  end

  def self.grid_string_to_lat_long(grid_string)
    #Accepts a four character grid refference and converts in too
    #Latitude and Longitude
    # !!FIX ME!!  #
    #Six character strings would be more precise, we will get there.
    longMSB = alpha_to_int(grid_string[0])
    longLSB = grid_string[2].to_i
    long_sub = calc_lng_sub_square(grid_string[4])


    latMSB = alpha_to_int(grid_string[1])
    latLSB = grid_string[3].to_i
    lat_sub = calc_lat_sub_square(grid_string[5])

    longitude = self.calc_longitude(msb: longMSB, lsb: longLSB)
    longitude = longitude + long_sub # !!FIX ME!! Test this out with other hemispheres #
    latitude = self.calc_latitude(msb: latMSB, lsb: latLSB)
    latitude = latitude + lat_sub # !!FIX ME!! Test this out with other hemispheres #

    [latitude, longitude]
  end
end
