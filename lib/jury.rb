class Jury
  attr_reader :members
  
  def initialize
  	@members = []
  end

  def add_member(name)
  	@members.push(name)
  end

  def cast_votes(finalists)
  	votes = {}
  end
end	