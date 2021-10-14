require 'json'

require_relative "plate_finding/version"

class Validation

  def self.controller_plate(plate)
    plate = plate[0,2].to_i
    unless plate > 0 && plate <= 81
      puts "Plate format not suitable (01-81 enter between)"
      exit
    end
    file = File.read('plates.json') 
    plates = JSON.parse(file)
    plates["#{plate}"]
  end
end