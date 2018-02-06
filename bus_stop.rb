class BusStop

  attr_reader :queue

  def initialize(name)
    @name = name
    @queue = []
  end

  def queue_length
    return @queue.length()
  end

  def add_to_queue(person)
    @queue << person
  end

  def empty_queue
    @queue = []
  end



end
