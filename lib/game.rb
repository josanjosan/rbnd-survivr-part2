class Game
  attr_reader :tribes

  def initialize(*tribes)
  @tribes = []
  tribes.each { |tribe| add_tribe(tribe) }
  end

  def add_tribe(tribe)
  	@tribes.push(tribe)
  end

  def immunity_challenge
  	@tribes.sample
  end

  def clear_tribes
  	initialize()
  end

  def merge(combined_name)
  	Tribe.new(name: "Merged Ones", members: @tribes.first.members + @tribes.last.members)
  end

  def individual_immunity_challenge
  	Contestant.new(name: merge("combined_tribe").members.sample)
  end
end