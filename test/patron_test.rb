require 'minitest/autorun'
require 'minitest/pride'
require './lib/patron'
require 'pry'

class PatronTest < Minitest::Test

  def test_if_it_exits
    bob = Patron.new("Bob")
    assert_instance_of Patron, bob
  end

  def test_patron_name
    bob = Patron.new("Bob")
    assert_equal "Bob", bob.name
  end

  def test_patron_interests
    bob = Patron.new("Bob")
    assert_equal [], bob.interests
  end

  def test_if_it_adds_patron_interests
    bob = Patron.new("Bob")

    bob.add_interests("Dead Sea Scrolls")
    bob.add_interests("Gems and Minerals")

    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], bob.interests
  end

  def test_if_it_adds_new_patron
    sally = Patron.new("Sally")

    sally.add_interest("Dead Sea Scrolls")

    assert_equal ["Dead Sea Scrolls"], sally.interests
  end

  def test_if_it_adds_all_patron_interest
    bob = Patron.new("Bob")

    bob.add_interests("Dead Sea Scrolls")
    bob.add_interests("Gems and Minerals")

    sally = Patron.new("Sally")

    sally.add_interest("Dead Sea Scrolls")

    assert_equal ["Dead Sea Scrolls", "Gems and Minerals", "Dead Sea Scrolls"], sally.interests
  end

end
