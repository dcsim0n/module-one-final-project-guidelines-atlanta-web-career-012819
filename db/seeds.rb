require 'csv'

CSV.foreach('db/summitslist.csv',headers:true) do |row|
  Summit.create(row.to_h.delete(nil))
end
