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
  	  puts "#{member} voted for #{vote}".capitalize
  	end
  	votes = {finalists.first.to_s => votes_0, finalists.last.to_s => votes_1}
  end

  def report_votes(votes)
  	votes.each { |k,v| puts "#{k} got #{v} votes".capitalize }
  end

  def announce_winner(votes)
  	votes[votes.keys.first] > votes[votes.keys.last] ? votes.keys.first : votes.keys.last
  end
end	