require 'hand/one_pair'
require 'hand/two_pairs'
require 'hand/three_of_kind'
require 'hand/straight'

def cards(codes)
  codes.map { |c| Card.new(c) }
end

describe OnePair do
  subject(:hand) { OnePair.new }

  it 'does not match a single card' do
    expect(hand.matches? cards(%w(2S))).to be false
  end

  it 'matches a pair' do
    expect(hand.matches? cards(%w(2S 2D))).to be true
  end
end

describe TwoPairs do
  subject(:hand) { TwoPairs.new }

  it 'does not match a single pair' do
    expect(hand.matches? cards(%w(2S, 2D))).to be false
  end

  it 'matches two pairs' do
    expect(hand.matches? cards(%w(2S 2D 4S 4D))).to be true
  end
end

describe ThreeOfKind do
  subject(:hand) { ThreeOfKind.new }

  it 'does not match two pairs' do
    expect(hand.matches? cards(%w(2S 2D 4S 4D))).to be false
  end

  it 'matches three of a kind' do
    expect(hand.matches? cards(%w(2S 2D 2C))).to be true
  end
end
