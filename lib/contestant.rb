class Contestant
  attr_reader :name

  def initialize(name)
  	@name = name
  end

  def to_s
  	@name
  end

  def capitalize
  	to_s.capitalize
  end
end