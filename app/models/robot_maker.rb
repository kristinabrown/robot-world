require 'yaml/store'
require_relative 'robot'

class RobotMaker
  
  def self.database
    @database ||= YAML::Store.new("db/robot_world")
  end

  def self.create(robot)
    database.transaction do
      database['robots'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['robots'] << { "id" => database['total'], 
                              "name" => robot[:name],
                              "avatar" => Faker::Avatar.image("#{robot[:name]}"),
                              "city" => Faker::Address.city, 
                              "state" => Faker::Address.state_abbr, 
                              "birthdate" => Faker::Date.backward(10950), 
                              "date_hired" => Faker::Date.forward(10),
                              "department" => Faker::Name.title                       
      }
    end
  end

  def self.raw_robots
    database.transaction do
      database['robots'] || []
    end
  end

  def self.all
    raw_robots.map { |data| Robot.new(data) }
  end

  def self.raw_robot(id)
    raw_robots.find { |robot| robot["id"] == id }
  end

  def self.find(id)
    Robot.new(raw_robot(id))
  end
  
  def self.update(id, robot)
    database.transaction do
      target = database['robots'].find { |data| data["id"] == id }
      target["name"] = robot[:name]
      target["avatar"] = robot[:avatar]
      target["city"] = robot[:city]
      target["state"] = robot[:state]
      target["birthdate"] = robot[:birthdate]
      target["date_hired"] = robot[:date_hired]
      target["department"] = robot[:department]
    end
  end
  
  def self.destroy(id)
    database.transaction do
      database['robots'].delete_if { |robot| robot["id"] == id }
    end
  end
end