class Summit < ActiveRecord::Base
  include Geokit::Mappable
has_many :contacts

  def self.lat_column_name
    :latitude
  end

  def self.lng_column_name
    :longitude
  end

end
