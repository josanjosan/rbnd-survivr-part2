class Tribe
  attr_reader :name, :members

  def initialize (options = {})
  	@name = options[:name].light_blue
  	@members = options[:members]
  	puts "Tribe #{@name} has been created"
  end

  def to_s
  	@name
  end

  def tribal_council(options = {})
  	if options[:immune]
      immune = options[:immune]
      not_immune = @members.select { |contestant| contestant.name != immune.name } 
    else
      not_immune = @members
    end
    eliminated = not_immune.sample
    @members.delete_if { |contestant| contestant.name == eliminated.name }
    return eliminated
  end

  def capitalize
    to_s.capitalize
  end
end