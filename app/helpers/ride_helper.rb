module RideHelper
  
  def meets_requirements?
    @message = ""
    @message += " Sorry. You do not have enough tickets to ride the #{attraction.name}. " if user.tickets < attraction.tickets
    @message += " Sorry. You are not tall enough to ride the #{attraction.name}. " if user.height < attraction.min_height
    @message.blank? ? update_stats : @message.strip.gsub('.  Sorry','')
  end

  def update_stats
    user.tickets -= attraction.tickets
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save
    "Thanks for riding the #{attraction.name}!"
  end
end
