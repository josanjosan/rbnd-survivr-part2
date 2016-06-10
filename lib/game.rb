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
  	@tribes.clear
  end

  def merge(combined_name)
  	members_a = @tribes.first.members
    members_b = @tribes.last.members
    clear_tribes
    @tribes.push(Tribe.new(name: combined_name, members: members_a + members_b))
    return @tribes.first
  end

  def individual_immunity_challenge
  	immunity_challenge.members.sample
  end
end