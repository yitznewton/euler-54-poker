require 'card'

class Hand
  include Comparable

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def ==(other)
    @cards == other.cards
  end

  def <=>(other)
    ranker = HandRanker.new
    rank_compare = ranker.rank(self) <=> ranker.rank(other)

    if rank_compare == 0
      high_card <=> other.high_card
    else
      rank_compare
    end
  end

  def high_card
    cards.sort_by(&:rank).last
  end

  def self.from_string(string)
    self.new(string.split(' ').map { |s| Card.new(s) })
  end
end
