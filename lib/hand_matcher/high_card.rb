class HighCard
  def matching_cards(hand)
    [hand.cards.map(&:rank).max]
  end
end
