class Robot
  attr_reader :id,           
              :name,       
              :avatar,     
              :city,      
              :state,     
              :birthdate,   
              :date_hired,  
              :department
  
  
  def initialize(data)
    @id           = data["id"]
    @name         = data["name"]
    @avatar       = data["avatar"]
    @city         = data["city"]
    @state        = data["state"] 
    @birthdate    = data["birthdate"]
    @date_hired   = data["date_hired"]
    @department   = data["department"]  
  end
end