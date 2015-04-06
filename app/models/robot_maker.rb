require 'yaml/store'
require 'sequel'
require 'byebug'

class RobotMaker
  
  def self.database
    if ENV["ROBOT_MAKER_ENV"] == 'test'
      @database ||= Sequel.sqlite("db/robot_maker_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/robot_maker_development.sqlite3")
    end
  end
  
  def self.dataset
    database.from(:robots)
  end

  def self.create(robot)
    dataset.insert({ name: robot[:name],
                     avatar: Faker::Avatar.image("#{robot[:name]}"),
                     city: Faker::Address.city, 
                     state: Faker::Address.state_abbr, 
                     birthdate: Faker::Date.backward(10950), 
                     date_hired: Faker::Date.forward(10),
                     department: Faker::Name.title,
                     salary: Robot.salary,
                     mood: Robot.mood,
                     fav_food: Robot.fav_food
                  })
  end

  def self.all
    dataset.all.map do |raw_robot|  
      Robot.new(raw_robot)
    end
  end

  def self.find(id)
    Robot.new(dataset.where(id: id).to_a.first)
  end
  
  def self.update(id, robot)
    dataset.where(id: id).update({
                                            name: robot[:name],
                                            avatar: robot[:avatar],
                                            city: robot[:city],
                                            state: robot[:state],
                                            birthdate: robot[:birthdate],
                                            date_hired: robot[:date_hired],
                                            department: robot[:department],
                                            salary: robot[:salary],
                                            mood: robot[:mood],
                                            fav_food: robot[:fav_food]
                                           })
  end
  
  def self.population
    dataset.all.count
  end
  
  def self.destroy(id)
    dataset.where(id: id).delete
  end
  
  def self.most_common_mood
    moods = dataset.all.group_by do |robot|
      robot[:mood]
    end
    most_mood = moods.max_by { |key, value| value.count }
    most_mood.nil? ? [] : most_mood.first
  end
  
  def self.most_fav_food
    foods = dataset.all.group_by do |robot|
      robot[:fav_food]
    end
    most_food = foods.max_by { |key, value| value.count }
    most_food.nil? ? [] : most_food.first
  end
  
  def self.average_salary
    total = dataset.all.reduce(0) do |sum, robot|
      sum + robot[:salary].to_i
    end
    total.zero? ? [] : total / dataset.all.count
  end
  
  def self.delete_all
    dataset.delete
  end
end