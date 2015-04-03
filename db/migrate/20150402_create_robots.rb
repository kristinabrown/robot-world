require_relative '../../app/models/robot_maker'

environments = %w(development test)

environments.each do |env|
  Sequel.sqlite("db/robot_maker_#{env}.sqlite3").create_table :robots do
    primary_key :id
    String :name
    String :avatar
    String :city
    String :state
    String :birthdate
    String :date_hired
    String :department
    String :salary
    String :mood
    String :fav_food
    
    puts "created tasks table in db/robot_maker_#{env}.sqlite3"
  end
end
    

