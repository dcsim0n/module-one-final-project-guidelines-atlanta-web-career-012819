class Contact < ActiveRecord::Base
belongs_to :activator, class_name: "User" , inverse_of: :activator_contacts
belongs_to :chaser, class_name: "User" , inverse_of: :chaser_contacts
has_one :summit, foreign_key: :id, primary_key: :summit_id

end
