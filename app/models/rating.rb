class Rating < ApplicationRecord
  belongs_to :service
  belongs_to :user

  validate :usercheck, on: :create

  def usercheck
    puts user_id
    puts service_id
    puts "someoen"
    @service = Service.find(service_id);
    
    if @service.ratings.where("user_id=?",user_id).exists? 
      return errors.add(:msg, "error message") 
    else 
      return true
    end 
  end
end
