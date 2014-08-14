require_relative 'hand_matcher/two_pairs'
require_relative 'hand_matcher/straight'
require_relative 'hand_matcher/flush'
require_relative 'hand_matcher/straight_flush'
require_relative 'hand_matcher/royal_flush'
require_relative 'hand_matcher/full_house'
require_relative 'hand_matcher/n_of_kind'

class HandRanker
  @@matchers = {
    0 => NOfKind.new(2),
    1 => TwoPairs.new,
    2 => NOfKind.new(3),
    3 => Straight.new,
    4 => Flush.new,
    5 => FullHouse.new,
    6 => NOfKind.new(4),
    7 => StraightFlush.new,
    8 => RoyalFlush.new,
  }

  def rank(hand)
    @@matchers.each do |k, matcher|
      if matcher.matches?(hand.cards)
        return k
      end
    end

    return -1
  end
end
