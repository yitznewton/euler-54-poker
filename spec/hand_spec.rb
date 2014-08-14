require 'hand'
require 'hand_ranker'
require 'hand_matcher/two_pairs'
require 'hand_matcher/straight'
require 'hand_matcher/flush'
require 'hand_matcher/straight_flush'
require 'hand_matcher/royal_flush'
require 'hand_matcher/full_house'
require 'hand_matcher/n_of_kind'

describe Hand do
  describe '::from_string' do
    subject { Hand.from_string('2C 3S') }
    it { is_expected.to eq Hand.new([Card.new('2C'), Card.new('3S')]) }
  end

  describe '#high_card' do
    subject(:hand) { Hand.from_string('8S 2C') }

    it 'returns the high card' do
      expect(hand.high_card).to eq Card.new('8S')
    end
  end
end
