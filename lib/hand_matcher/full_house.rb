class FullHouse
  def matches?(hand)
    TwoPairs.new.matches?(hand) && NOfKind.new(3).matches?(hand)
  end
end
