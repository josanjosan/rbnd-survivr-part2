class Jury
  attr_accessor :members
  
  def initialize
  	@members = []
  end

  def add_member(member)
  	@members.push(member)
  end

  def cast_votes(finalists)
    votes = {}
    finalists.each { |finalist| votes[finalist] = 0 }
    @members.each do |member|
      voted = finalists.sample
      votes[voted] += 1
      puts "#{member.capitalize} voted for #{voted.capitalize}" 
    end
    return votes
  end

  def report_votes(votes)
  	votes.each { |k,v| puts "#{k.capitalize} got #{v} votes".capitalize }
  end

  def announce_winner(votes)
  	votes[votes.keys.first] > votes[votes.keys.last] ? winner = votes.keys.first : winner = votes.keys.last
    winner_votes = votes.max_by { |k, v| v }
    winner = winner_votes.first
    puts "#{winner.name.capitalize} wins Suvivr!".rainbow.bold
    return winner
  end
end	