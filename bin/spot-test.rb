require_relative '../config/environment.rb'

Spot.new_from_id(activator_id: 14,summit_id: 87197,frequency: 10.120)
web = {
  activator:'Steve',
  activator_call: 'WG0AT',
  summit_code: 'W0C/FR-144',
  frequency: 7.032
}
Spot.new_from_web(web)


binding.pry
