require 'net/http'
require 'open-uri'
require 'json'
require 'awesome_print'
 
class GetPrograms

  URL = "http://data.cityofnewyork.us/resource/uvks-tn5n.json"

  def get_programs
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
    # ap JSON.parse(response.body)
  end

  def program_school
    programs = ap JSON.parse(self.get_programs)
    programs.collect do |program|
      program["agency"]
    end
  end

end

programs = GetPrograms.new
puts programs.program_school.uniq

# programs = GetPrograms.new.get_programs
# puts programs
