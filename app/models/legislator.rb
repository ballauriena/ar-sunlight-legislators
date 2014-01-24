require_relative '../../db/config'

class Legislator < ActiveRecord::Base


end

#p Legislator.all.where('state = ?', 'FL')
#p Legislator.find_by! firstname: 'John'
# Legislator.all.each do |l|
#   puts l.lastname if l.title == 'Sen' && l.state == 'FL'
# end
