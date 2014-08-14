require_relative 'hand_matcher/two_pairs'
require_relative 'hand_matcher/straight'
require_relative 'hand_matcher/flush'
require_relative 'hand_matcher/straight_flush'
require_relative 'hand_matcher/full_house'
require_relative 'hand_matcher/n_of_kind'

class HandRanker
  def compare(hand0, hand1)
    hand_type_compare = rank(hand0) <=> rank(hand1)

    if hand_type_compare == 0
      hand0.high_card <=> hand1.high_card
    else
      hand_type_compare
    end
  end

  private

  def rank(hand)
    indexes = (0..HandRanker.matchers.length).to_a.reverse
    indexed_matchers = HandRanker.matchers.zip(indexes)

    indexed_matchers.reduce(-1) do |memo, current|
      if current[0].matches?(hand)
        return current[1]
      else
        memo
      end
    end
  end

  def self.matchers
    [
      StraightFlush.new,
      NOfKind.new(4),
      FullHouse.new,
      Flush.new,
      Straight.new,
      NOfKind.new(3),
      TwoPairs.new,
      NOfKind.new(2)
    ]
  end
end
