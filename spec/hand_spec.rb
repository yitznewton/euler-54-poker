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
    it 'returns expected Hand' do
      expect(Hand.from_string('2C 3S')).to eq Hand.new([Card.new('2C'), Card.new('3S')])  
    end
  end

  describe '#high_card' do
    subject(:hand) { Hand.from_string('8S 2C') }

    it 'returns the high card' do
      expect(hand.high_card).to eq Card.new('8S')
    end
  end

  describe '#<=>' do
    context 'with same-ranking hands' do
      let(:hand0) { Hand.from_string('7D 3S 4D 5D 6D') }
      let(:hand1) { Hand.from_string('2D 3S 4D 5D 6D') }

      it 'favors the high card' do
        expect(hand0).to be > hand1
      end
    end
  end
end
