require("minitest/autorun")
require_relative("../person")

class PersonTest < MiniTest::Test

  def setup
    @person1 = Person.new("Gary Glitter", 66)
  end


end # end CLASS
