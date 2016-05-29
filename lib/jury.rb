class Jury
  attr_accessor :members
  
  def initialize
  	@members = []
  end

  def add_member(name)
  	@members.push(name)
  end

  def cast_votes(finalists)
  	@members.each { |member| puts "#{member} voted for <FINALIST NAME>" }
  	votes = {finalist_1: 3, finalist_2: 4}
  end
end	