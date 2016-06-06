class Jury
  attr_accessor :members
  
  def initialize
  	@members = []
  end

  def add_member(member)
  	@members.push(member)
  end

  def cast_votes(finalists)
  	votes_0 = 0
  	votes_1 = 0
  	@members.each do |member|
  	  voted = finalists.sample
  	  finalists.index(voted) == 0 ? votes_0 += 1 : votes_1 += 1
  	  puts "#{member.capitalize} voted for #{voted.capitalize}"
  	end
  	votes = {finalists.first.to_s => votes_0, finalists.last.to_s => votes_1}
  end

  def report_votes(votes)
  	votes.each { |k,v| puts "#{k.capitalize} got #{v} votes".capitalize }
  end

  def announce_winner(votes)
  	votes[votes.keys.first] > votes[votes.keys.last] ? winner = votes.keys.first : winner = votes.keys.last
    puts "#{winner.capitalize} wins Suvivr!".rainbow.bold
    return winner
  end
end	