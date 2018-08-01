require 'pry'

class Patron
  attr_reader :name, :interests

  def initialize(name)
    @name = name
    @interests = []
  end

  def add_interest(interest_input)
    @interests << interest_input
    
  end

end
