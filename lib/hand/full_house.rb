class FullHouse
  def matches?(cards)
    TwoPairs.new.matches?(cards) && NOfKind.new(3).matches?(cards)
  end
end
