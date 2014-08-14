class TwoPairs
  def matches?(cards)
    ranks = cards.map(&:rank)
    ranks.length > ranks.uniq.length + 1
  end
end
