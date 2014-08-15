class Straight
  def matching_cards(hand)
    ranks = hand.cards.map(&:rank).uniq

    if ranks.length == 5 && ranks.max - ranks.min == 4
      ranks
    else
      []
    end
  end
end
