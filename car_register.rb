require 'json'
require 'yaml'
require_relative "plate_finding/lib/plate_finding"


class CarSave
  attr_accessor :full_name, :city, :car_model, :plate

  def initialize(full_name, city, car_model, plate)
    @full_name = full_name
    @city = city
    @car_model = car_model
    @plate = plate
  end

  def save
    File.open("registered_cars.yml", "a") { |file| file.write "#{full_name} - #{@city} - #{@car_model} - #{@plate},\n" }
  end
end

class Controller

  def ctrl_model(cars_model)
    model_file = File.read('models.json') 
    models = JSON.parse(model_file)
    if models.find { |models| models["name"] == cars_model}.nil?
      puts "Vehicle model not found"
      exit
    end
  end
  
  def ctrl_plate(plate, operation)
    i = 0
    sum = 1
    if File.exist?('registered_cars.yml')
      saved_cars = YAML.load(File.read("registered_cars.yml"))
      index = saved_cars.index(plate)
      puts index
      unless index.nil? 
        if operation == "save"
          puts "There is this license plate a car"
          exit
        else
          saved_cars = saved_cars.split(",")
          while i < saved_cars.count && index >= sum   
            sum = sum + saved_cars[i].size
            i = i + 1
          end
          puts  saved_cars[i-1]
        end
      else
        puts "#{plate}  plate vehicle is not in the system."  
      end
    end
  end

end

control = Controller.new

operation = ARGV[0]
plate = ARGV[1]

if operation == '-s'
  control.ctrl_plate(plate.upcase, operation)
else
  puts "Plate"
  plate = gets.chomp.upcase
  city = Validation.controller_plate(plate)
  control.ctrl_plate(plate, "save")

  puts "Cars model"
  cars_model = gets.chomp.upcase
  control.ctrl_model(cars_model)

  puts "Name/Surname"
  full_name = gets.chomp.upcase


  car_save = CarSave.new(full_name, city, cars_model, plate)
  car_save.save

  puts "#{plate} vehicle was added."
end


