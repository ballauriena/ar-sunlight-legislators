require 'csv'
require_relative '../app/models/legislator'

class SunlightLegislatorsImporter
  def self.import(filename)
    csv = CSV.new(File.open(filename), :headers => true)
    model_atts = ['title', 'firstname', 'lastname', 'party',
                  'state', 'district', 'gender', 'phone',
                  'fax', 'website', 'webform', 'congress_office',
                  'twitter_id', 'birthdate']
    csv.each do |row|
      atts_hash = {}
      row.each do |field, value|
        atts_hash[field] = value if model_atts.include?(field)
      end
      Legislator.create(atts_hash)
    end
  end
end

SunlightLegislatorsImporter.import('../db/data/legislators.csv')

# IF YOU WANT TO HAVE THIS FILE RUN ON ITS OWN AND NOT BE IN THE RAKEFILE, UNCOMMENT THE BELOW
# AND RUN THIS FILE FROM THE COMMAND LINE WITH THE PROPER ARGUMENT.
# begin
#   raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
#   SunlightLegislatorsImporter.import(ARGV[0])
# rescue ArgumentError => e
#   $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
# rescue NotImplementedError => e
#   $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
# end
