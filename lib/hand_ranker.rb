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

      card_comparison = compare_cards(cards_in_hand0, cards_in_hand1)
      return card_comparison if card_comparison
    end
  end

  private

  def compare_cards(a, b)
    if a.empty? && b.empty?
      nil
    else
      a <=> b
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
