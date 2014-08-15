require_relative 'hand_matcher/two_pairs'
require_relative 'hand_matcher/straight'
require_relative 'hand_matcher/flush'
require_relative 'hand_matcher/straight_flush'
require_relative 'hand_matcher/full_house'
require_relative 'hand_matcher/n_of_kind'
require_relative 'hand_matcher/high_card'

class HandRanker
  def compare(hand0, hand1)
    HandRanker.matchers.each do |matcher|
      cards_in_hand0 = matcher.matching_cards(hand0)
      cards_in_hand1 = matcher.matching_cards(hand1)

      if cards_in_hand0.empty? && !cards_in_hand1.empty?
        return -1
      elsif cards_in_hand1.empty? && !cards_in_hand0.empty?
        return 1
      elsif !cards_in_hand0.empty? && !cards_in_hand1.empty?
        return cards_in_hand0.max <=> cards_in_hand1.max
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
      NOfKind.new(2),
      HighCard.new
    ]
  end
end
