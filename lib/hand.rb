require_relative 'card'

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

  def ace?
    cards.map(&:rank).include?(Card::ACE)
  end

  def self.from_string(string)
    new(string.split(' ').map { |s| Card.new(s) })
  end
end
