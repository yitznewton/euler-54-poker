require 'hand/one_pair'

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
