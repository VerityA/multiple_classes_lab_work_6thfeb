require("minitest/autorun")
require_relative("../bus")
require_relative("../person")

class BusTest < MiniTest::Test
  def setup
    @bus47 = Bus.new(47, "Hillend")
    @person1 = Person.new("Gary Glitter", 66)
    @person2 = Person.new("Hilary Clinton", 70)
    
  end

  def test_drive()
    bus_noise = @bus47.drive()
    assert_equal("BrooOoom broom", bus_noise)
  end

  def test_passenger_count()
    count = @bus47.passenger_count
    assert_equal(0, count)
  end

  def test_pick_up()
    @bus47.pick_up(@person1)
    count = @bus47.passenger_count
    assert_equal(1,count)
  end

  def test_drop_off()
    @bus47.pick_up(@person1)
    @bus47.pick_up(@person2)
    @bus47.drop_off(@person1)
    count = @bus47.passenger_count
    assert_equal(1, count)
  end

  def test_empty_bus()
    @bus47.pick_up(@person1)
    @bus47.pick_up(@person2)
    @bus47.empty_bus()
    count = @bus47.passenger_count
    assert_equal(0, count)

  end
end # end CLASS BUSTEST
