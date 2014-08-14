class RoyalFlush
  def matches?(cards)
    ranks = cards.map(&:rank)
    StraightFlush.new.matches?(cards) && ranks.include?(Card::RANKS.length-1)
  end
end
