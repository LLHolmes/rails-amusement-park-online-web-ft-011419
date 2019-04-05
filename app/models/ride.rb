class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if valid_rider
      self.user.happiness += self.attraction.happiness_rating
      self.user.nausea += self.attraction.nausea_rating
      self.user.tickets -= self.attraction.tickets
      self.user.save
      "Thanks for riding the #{self.attraction.name}!"
    else
      if !enough_tickets && !tall_enough
        ("Sorry." + ticket_message + height_message)
      elsif !enough_tickets
        ("Sorry." + ticket_message)
      elsif !tall_enough
        ("Sorry." + height_message) unless tall_enough
      end
    end
  end

  def enough_tickets
    self.user.tickets >= self.attraction.tickets
  end

  def tall_enough
    self.user.height >= self.attraction.min_height
  end

  def valid_rider
    self.enough_tickets && self.tall_enough
  end

  def ticket_message
    " You do not have enough tickets to ride the #{self.attraction.name}."
  end

  def height_message
    " You are not tall enough to ride the #{self.attraction.name}."
  end

end
