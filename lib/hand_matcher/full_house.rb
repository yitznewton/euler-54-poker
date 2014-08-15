class FullHouse
  def matching_cards(hand)
    two_pairs = TwoPairs.new.matching_cards(hand)
    three_of_kind = NOfKind.new(3).matching_cards(hand)

    if three_of_kind.empty?
      []
    else
      two_pairs
    end
  end
end
