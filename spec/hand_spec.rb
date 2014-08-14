require 'hand/one_pair'
require 'hand/two_pairs'
require 'hand/three_of_kind'

def cards(*codes)
  codes.map { |c| Card.new(c) }
end

describe OnePair do
  it 'does not match a single card' do
    hand = OnePair.new
    expect(hand.matches? cards('2S')).to be false
  end

  it 'matches a pair' do
    hand = OnePair.new
    expect(hand.matches? cards('2S', '2D')).to be true
  end
end

describe TwoPairs do
  it 'does not match a single pair' do
    hand = TwoPairs.new
    expect(hand.matches? cards('2S', '2D')).to be false
  end

  it 'matches two pairs' do
    hand = TwoPairs.new
    expect(hand.matches? cards('2S', '2D', '4S', '4D')).to be true
  end
end

describe ThreeOfKind do
  it 'does not match two pairs' do
    hand = ThreeOfKind.new
    expect(hand.matches? cards('2S', '2D', '4S', '4D')).to be false
  end

  it 'matches three of a kind' do
    hand = ThreeOfKind.new
    expect(hand.matches? cards('2S', '2D', '2C')).to be true
  end
end
