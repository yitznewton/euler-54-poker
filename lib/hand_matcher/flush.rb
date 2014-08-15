class Flush
  def matching_cards(hand)
    suits = hand.cards.map(&:suit).uniq

    if suits.length == 1
      hand.cards.map(&:rank)
    else
      []
    end
  end
end
