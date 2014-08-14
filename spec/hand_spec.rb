require 'hand/two_pairs'
require 'hand/straight'
require 'hand/flush'
require 'hand/straight_flush'
require 'hand/royal_flush'
require 'hand/full_house'
require 'hand/n_of_kind'

def cards(codes)
  codes.map { |c| Card.new(c) }
end

describe TwoPairs do
  subject(:hand) { TwoPairs.new }

  it 'does not match a single pair' do
    expect(hand.matches? cards(%w(2S, 2D))).to be false
  end

  it 'does not match three of a kind' do
    expect(hand.matches? cards(%w(2s 2d 2c))).to be false
  end

  it 'matches two pairs' do
    expect(hand.matches? cards(%w(2S 2D 4S 4D))).to be true
  end
end

describe NOfKind do
  context 'with 2' do
    subject(:hand) { NOfKind.new(2) }

    it 'does not match a single card' do
      expect(hand.matches? cards(%w(2S))).to be false
    end

    it 'matches a pair' do
      expect(hand.matches? cards(%w(2S 2D))).to be true
    end
  end

  context 'with 3' do
    subject(:hand) { NOfKind.new(3) }

    it 'does not match two pairs' do
      expect(hand.matches? cards(%w(2S 2D 4S 4D))).to be false
    end

    it 'matches three of a kind' do
      expect(hand.matches? cards(%w(2S 2D 2C))).to be true
    end
  end

  context 'with 4' do
    subject(:hand) { NOfKind.new(4) }
    it 'does not match three of a kind' do
      expect(hand.matches? cards(%w(2S 2D 2C))).to be false
    end

    it 'matches four of a kind' do
      expect(hand.matches? cards(%w(2S 2D 2C 2H))).to be true
    end
  end
end

describe Straight do
  subject(:hand) { Straight.new }

  it 'does not match a 4-card run' do
    expect(hand.matches? cards(%w(2S 3D 4C 5H))).to be false
  end

  it 'matches a straight' do
    expect(hand.matches? cards(%w(2S 3D 4C 5H 6S))).to be true
  end
end

describe Flush do
  subject(:hand) { Flush.new }

  it 'does not match 4 of a suit' do
    expect(hand.matches? cards(%w(2S 3S 4S 5S 7D))).to be false
  end

  it 'matches a flush' do
    expect(hand.matches? cards(%w(2S 3S 4S 5S 7S))).to be true
  end
end

describe StraightFlush do
  subject(:hand) { StraightFlush.new }

  it 'does not match a low flush' do
    expect(hand.matches? cards(%w(2S 3S 4S 5S 7S))).to be false
  end

  it 'does not match a mixed straight' do
    expect(hand.matches? cards(%w(2S 3D 4C 5H 6S))).to be false
  end

  it 'matches a straight flush' do
    expect(hand.matches? cards(%w(2S 3S 4S 5S 6S))).to be true
  end
end

describe RoyalFlush do
  subject(:hand) { RoyalFlush.new }

  it 'does not match a low straight flush' do
    expect(hand.matches? cards(%w(9S TS JS QS KS))).to be false
  end

  it 'matches a royal flush' do
    expect(hand.matches? cards(%w(TS JS QS KS AS))).to be true
  end
end

describe FullHouse do
  subject(:hand) { FullHouse.new }

  it 'does not match three of a kind' do
    expect(hand.matches? cards(%w(2S 2D 2C))).to be false
  end

  it 'matches a full house' do
    expect(hand.matches? cards(%w(2S 2D 2C 3S 3D))).to be true
  end
end
