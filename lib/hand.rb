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

  def high_card
    cards.sort_by(&:rank).last
  end

  def self.from_string(string)
    self.new(string.split(' ').map { |s| Card.new(s) })
  end
end
