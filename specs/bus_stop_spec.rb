require("minitest/autorun")
require_relative("../bus_stop")
require_relative("../bus")
require_relative("../person")


class BusStopTest < MiniTest::Test

  def setup
    @hillend_stop = BusStop.new("Hillend")
    @person1 = Person.new("Gary Glitter", 66)
    @person2 = Person.new("Hilary Clinton", 70)
    @person3 = Person.new("Uncle Bulgaria", 23)
    @bus11 = Bus.new(11, "Fairmilehead")
  end

  def test_queue_length
    length = @hillend_stop.queue_length()
    assert_equal(0, length)
  end


  def test_add_to_queue
    @hillend_stop.add_to_queue(@person1)
    length = @hillend_stop.queue_length()
    assert_equal(1, length)
  end

  def test_empty_queue
    @hillend_stop.add_to_queue(@person1)
    @hillend_stop.add_to_queue(@person2)
    @hillend_stop.add_to_queue(@person3)
    @hillend_stop.empty_queue()
    length = @hillend_stop.queue_length()
    assert_equal(0, length)
  end


  def test_pick_up_from_stop
    @hillend_stop.add_to_queue(@person1)
    @hillend_stop.add_to_queue(@person2)
    @hillend_stop.add_to_queue(@person3)
    @bus11.pick_up_from_stop(@hillend_stop)
    queue_length = @hillend_stop.queue_length()
    bus_count = @bus11.passenger_count()
    assert_equal(0, queue_length)
    assert_equal(3, bus_count)
  end

end
