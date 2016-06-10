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
  	not_immune = @members.select { |member| member != options[:immune] } 
    eliminated = not_immune.sample
    @members.delete_if { |member| member == eliminated }
    return eliminated
  end

  def capitalize
    to_s.capitalize
  end
end