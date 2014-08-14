class Straight
  def matches?(hand)
    ranks = hand.cards.map(&:rank).sort.uniq
    ranks.length == 5 && ranks[4] - ranks[0] == 4
  end
end
