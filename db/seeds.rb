require 'csv'

# CSV.foreach('db/summitslist.csv',headers:true) do |row|
#   Summit.create(row.to_h.delete(nil))
# end


# User.destroy_all
# User.create(call_sign:"KN4BEV", name:"Dana", grid:"EM73TS")
# User.create(call_sign:"KI4SVM", name:"Pat", grid:"EM84QM")
# User.create(call_sign:"KI4TN", name:"Ron", grid:"EM86QN")
# User.create(call_sign:"WG4I", name:"Ryan", grid:"EM74WF")
# User.create(call_sign:"WG0AT", name:"Steve", grid:"DM79NB")
# User.create(call_sign:"N0MAP", name:"Joe", grid:"EN61EQ")

Contact.destroy_all
Contact.create(activator_id:16, chaser_id:14, summit_id:87543, freq:7.50, band:'40M', date:Time.now)
Contact.create(activator_id:16, chaser_id:14, summit_id:87543, freq:7.50, band:'40M',date:Time.now)
Contact.create(activator_id:19, chaser_id:14, summit_id:87197, freq:7.258, band:'40M',date:Time.now)
Contact.create(activator_id:20, chaser_id:14, summit_id:82432, freq:14.50, band:'20M',date:Time.now)
