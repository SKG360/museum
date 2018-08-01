require 'minitest/autorun'
require 'minitest/pride'
require './lib/patron'
require './lib/museum'
require 'pry'

class MuseumTest < Minitest::Test

  def test_if_it_exits
    dmns = Museum.new("Denver Museum of Nature and Science")

    assert_instance_of Museum, dmns
  end

  def test_if_it_records_name
    dmns = Museum.new("Denver Museum of Nature and Science")

    assert_equal "Denver Museum of Nature and Science", dmns.name
  end

  def test_if_it_adds_exhibits

    dmns = Museum.new("Denver Museum of Nature and Science")

    dmns.add_exhibit("Dead Sea Scrolls", 10)
    dmns.add_exhibit("Gems and Minerals", 0)

    assert_equal ({"Dead Sea Scrolls" =>10, "Gems and Minerals"=>0}), dmns.exhibits
  end

  def test_if_the_revenue_is_created

    dmns = Museum.new("Denver Museum of Nature and Science")
    dmns.add_exhibit("Dead Sea Scrolls", 10)
    dmns.add_exhibit("Gems and Minerals", 0)

    bob = Patron.new("Bob")
    bob.add_interest("Gems and Minerals")
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Imax")

    sally = Patron.new("Sally")
    sally.add_interest("Dead Sea Scrolls")

    assert_equal 0, dmns.revenue
  end

  def test_it_can_list_patrons_in_exhibits

    dmns = Museum.new("Denver Museum of Nature and Science")
    dmns.add_exhibit("Dead Sea Scrolls", 10)
    dmns.add_exhibit("Gems and Minerals", 0)

    bob = Patron.new("Bob")
    bob.add_interest("Gems and Minerals")
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Imax")

    sally = Patron.new("Sally")
    sally.add_interest("Dead Sea Scrolls")

    dmns.admit(bob)
    dmns.admit(sally)

    assert_equal ["Bob", "Sally"], dmns.patrons_of("Dead Sea Scrolls")
  end

  def test_it_sorts_most_to_least_patrons
    
    dmns = Museum.new("Denver Museum of Nature and Science")
    dmns.add_exhibit("Dead Sea Scrolls", 10)
    dmns.add_exhibit("Gems and Minerals", 0)

    bob = Patron.new("Bob")
    bob.add_interest("Gems and Minerals")
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Imax")

    sally = Patron.new("Sally")
    sally.add_interest("Dead Sea Scrolls")

    dmns.admit(bob)
    dmns.admit(sally)

    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], dmns.exhibits_by_attendees

  end

end
