class OnePair
  def matches?(cards)
    ranks = cards.map(&:rank)
    ranks.length != ranks.uniq.length
  end
end
