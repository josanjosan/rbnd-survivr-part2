class Tribe
  attr_reader :name, :members


  def initialize (options = {})
  	@name = options[:name]
  	@members = options[:members]
  	puts "Tribe #{@name} has been created"
  end

  def to_s
  	@name
  end

  def tribal_council(options = {})
  	Contestant.new(name: options[:immune])
  end
end