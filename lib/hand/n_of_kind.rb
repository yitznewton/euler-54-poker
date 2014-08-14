class NOfKind
  def initialize(n)
    @n = n
  end

  def matches?(cards)
    ranks = cards.group_by(&:rank)
    ranks.values.map(&:length).max == @n
  end
end
