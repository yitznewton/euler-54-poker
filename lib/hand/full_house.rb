class FullHouse
  def matches?(cards)
    TwoPairs.new.matches?(cards) && ThreeOfKind.new.matches?(cards)
  end
end
