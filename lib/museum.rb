require 'pry'

class Museum
  attr_reader :name, :exhibits, :revenue

  def initialize(name)
    @name = name
    @exhibits = Hash.new(0)
    @revenue = 0
    @admitted_patron = []
    @ticket = []
  end

  def add_exhibit(exhibit, cost)
    @exhibits[exhibit] = cost
  end

  def exhibit_fee(patron)
     patron.interests.sum do |interest|

     @exhibits[interest]
binding.pry 
    end
  end

  def admit(patron)
    @revenue += (10 + exhibit_fee(patron))
    @admitted_patron << patron
  end

  def patrons_of(exhibit)
    ticket = @admitted_patron.find_all do |patron|
      patron.interests.include?(exhibit)
    end
    @ticket << ticket

    @ticket.flatten.map do |ticket|

      ticket.name
    end
  end

  def exhibits_by_attendees
    @exhibits

  end

end
