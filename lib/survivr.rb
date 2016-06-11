require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"
require_relative "../gems/colorizr/lib/colorizr"

#After your tests pass, uncomment this code below
#=========================================================
# # Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!
#
# # Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))
#
# # Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
def phase_one
  8.times do |i|
    puts [nil,
      "<< Game begins, tribes #{@coyopa} and #{@hunapu} are formed >>",
      nil,
      "Phase One begins!".title,
      nil] if i == 0
    loosing_tribe = @borneo.immunity_challenge
  	eliminated_contestant = loosing_tribe.tribal_council
  	puts "Challenge #{i+1}: ".bold +  "#{eliminated_contestant.capitalize} from #{loosing_tribe} is " + "eliminated".red
    puts [nil,
      "Tribes merge!".title,
      nil] if i == 7
  end
end

def phase_two
  3.times do |i|
    puts [nil,
      "Phase Two begins!".title,
      nil] if i == 0
  	immune = @borneo.individual_immunity_challenge
	  eliminated = @borneo.tribes.first.tribal_council(immune: immune)
  	puts "Individual challenge #{i+1}: ".bold + "Contestant #{immune.capitalize} " + "wins immunity".green + ", #{eliminated.capitalize} is " + "eliminated".red
  end
end

def phase_three
  7.times do |i|
    puts [nil,
      "Phase Three begins!".title,
      nil] if i == 0
    immune = @borneo.individual_immunity_challenge
	  eliminated = @borneo.tribes.first.tribal_council(immune: immune)
	  @jury.add_member(eliminated)
  	puts "Final challenge #{i+1}: ".bold + "Contestant #{immune.capitalize} " + "wins immunity".green + ", #{eliminated.capitalize} " + "out".yellow + " and joins Jury"
    puts [nil,
      "Voting phase begins!".title,
      nil] if i == 6
  end
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists
vote_results = @jury.cast_votes(finalists) #Jury members report votes
@jury.report_votes(vote_results) #Jury announces their votes
@jury.announce_winner(vote_results) #Jury announces final winner