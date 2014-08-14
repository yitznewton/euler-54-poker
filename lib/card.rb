class Card
  include Comparable

  attr_reader :rank

  RANKS = ('2'..'9').to_a.concat %w(T J Q K A)

  def initialize(code)
    @rank = RANKS.index(code[0])
  end

  def <=>(other)
    @rank <=> other.rank
  end
end
