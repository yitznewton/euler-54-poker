class StraightFlush
  def matching_cards(hand)
    if Flush.new.matching_cards(hand).empty?
      []
    else
      Straight.new.matching_cards(hand)
    end
  end
end
