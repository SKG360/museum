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

    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Gems and Minerals")

    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], bob.interests
  end

end
