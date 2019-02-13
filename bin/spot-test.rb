require_relative '../config/environment.rb'

Spot.new_from_id(activator_id: 14,summit_id: 87197,frequency: 10.120)
web = {
  'activatorName' =>'Steve',
  'activatorCallsign' => 'WG0AT',
  'summitCode' => 'FR-144',
  'associationCode' => 'W0C',
  'frequency' => '7.032'
}
Spot.new_from_web(web)

fetcher = Fetcher.new

fetcher.get_spots.each { |spot| Spot.new_from_web(spot) }

binding.pry
