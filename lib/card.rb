class Card
  include Comparable

  attr_reader :rank
  attr_reader :suit

  RANKS = ('2'..'9').to_a.concat %w(T J Q K A)

  def initialize(code)
    @rank = RANKS.index(code[0])
    @suit = code[1]
  end

  def <=>(other)
    @rank <=> other.rank
  end

  def ==(other)
    @rank == other.rank
  end
end
