class Straight
  def matches?(hand)
    ranks = hand.cards.map(&:rank).uniq
    ranks.length == 5 && ranks.max - ranks.min == 4
  end
end
