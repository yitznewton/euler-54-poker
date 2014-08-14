class Flush
  def matches?(hand)
    suits = hand.cards.map(&:suit).uniq
    suits.length == 1
  end
end
