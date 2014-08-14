class HandRanker
  @@matchers = [
    RoyalFlush.new,
    StraightFlush.new,
    NOfKind.new(4),
    FullHouse.new,
    Flush.new,
    Straight.new,
    NOfKind.new(3),
    TwoPairs.new,
    NOfKind.new(2),
  ]

  def compare(hand0, hand1)
    matcher = @@matchers.detect { |m| m.matches?(hand0) || m.matches?(hand1) }

    if matcher.nil?
      high_card_compare(hand0, hand1)
    elsif matcher.matches?(hand0) && matcher.matches?(hand1)
      high_card_compare(hand0, hand1)
    elsif matcher.matches?(hand0)
      1
    else
      -1
    end
  end

  def high_card_compare(hand0, hand1)
    hand_0_max = hand0.map(&:rank).max 
    hand_1_max = hand1.map(&:rank).max 
    hand_0_max <=> hand_1_max
  end
end
