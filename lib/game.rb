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
    all_members = []
    @tribes.each { |tribe| all_members.push(tribe.members)}
    clear_tribes
    @tribes.push(Tribe.new(name: combined_name, members: all_members.flatten))
    return @tribes.first
  end

  def individual_immunity_challenge
  	immunity_challenge.members.sample
  end
end