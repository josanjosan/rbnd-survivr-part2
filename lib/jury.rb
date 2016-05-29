class Jury
  attr_accessor :members
  
  def initialize
  	@members = []
  end

  def add_member(name)
  	@members.push(name)
  end

  def cast_votes(finalists)
  	votes_0 = 0
  	votes_1 = 0
  	@members.each do |member|
  	  vote = finalists.sample
  	  finalists.index(vote) == 0 ? votes_0 += 1 : votes_1 += 1
  	  puts "#{member} voted for #{vote}"
  	end
  	votes = {finalists[0].to_s => votes_0, finalists[1].to_s => votes_1}
  end
end	