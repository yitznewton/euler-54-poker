class Flush
  def matches?(cards)
    suits = cards.map(&:suit).uniq
    suits.length == 1
  end
end
