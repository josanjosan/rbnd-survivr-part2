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
  	immune = options[:immune]
    not_immune = @members.delete_if { |contestant| contestant.name == immune.name }
    eliminated = not_immune.sample
    @members.delete_if { |contestant| contestant.name == eliminated.name }
    return eliminated
  end

  def capitalize
    to_s.capitalize
  end
end