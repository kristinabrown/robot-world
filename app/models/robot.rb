class Robot
  attr_reader :id,           
              :name,       
              :avatar,     
              :city,      
              :state,     
              :birthdate,   
              :date_hired,  
              :department, 
              :mood, 
              :salary, 
              :fav_food
  
  
  def initialize(data)
    @id           = data[:id]
    @name         = data[:name]
    @avatar       = data[:avatar]
    @city         = data[:city]
    @state        = data[:state] 
    @birthdate    = data[:birthdate]
    @date_hired   = data[:date_hired]
    @department   = data[:department]
    @salary       = Robot.salary
    @mood         = Robot.mood
    @fav_food     = Robot.fav_food 
  end
  
  MOODS = ["Happy", "Sad", "Excited", "Tired", 
           "Exausted", "Aggravated", "Bitchy", "Bitter",
           "Calm", "Cheerful", "Devious", "Discontent", "Restless", 
           "Weird", "Optimistic"]
           
  FOODS = ["nuts", "bolts"]         
  
  def self.mood
    MOODS.sample
  end
  
  def self.fav_food
    FOODS.sample
  end
  
  def self.salary
    rand(1..1000)
  end
end