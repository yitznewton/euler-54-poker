require 'hand_matcher/high_card'
require 'hand_matcher/two_pairs'
require 'hand_matcher/straight'
require 'hand_matcher/flush'
require 'hand_matcher/straight_flush'
require 'hand_matcher/full_house'
require 'hand_matcher/n_of_kind'

def hand(string)
  Hand.from_string(string)
end

def ranks(*ranks)
  ranks.map(&:to_s).map { |r| Card::RANKS.index(r) }
end

def rank_i(rank)
  Card::RANKS.index(rank)
end

describe '#match' do
  describe HighCard do
    subject(:m) { HighCard.new }

    it 'matches high card' do
      expect(m.matching_cards hand('2S, 4D')).to eq ranks(4)
    end
  end

  describe TwoPairs do
    subject(:m) { TwoPairs.new }

    it 'does not match a single pair' do
      expect(m.matching_cards hand('2S, 2D')).to be_empty
    end

    it 'does not match three of a kind' do
      expect(m.matching_cards hand('2S 2D 2C')).to be_empty
    end

    it 'matches two pairs' do
      expect(m.matching_cards hand('2S 2D 4S 4D')).to eq ranks(2, 2, 4, 4)
    end
  end

  describe NOfKind do
    context 'with 2' do
      subject(:m) { NOfKind.new(2) }

      it 'does not match a single card' do
        expect(m.matching_cards hand('2S')).to be_empty
      end

      it 'matches a pair' do
        expect(m.matching_cards hand('2S 2D')).to eq ranks(2, 2)
      end
    end

    context 'with 3' do
      subject(:m) { NOfKind.new(3) }

      it 'does not match two pairs' do
        expect(m.matching_cards hand('2S 2D 4S 4D')).to be_empty
      end

      it 'matches three of a kind' do
        expect(m.matching_cards hand('2S 2D 2C')).to eq ranks(2, 2, 2)
      end
    end

    context 'with 4' do
      subject(:m) { NOfKind.new(4) }
      it 'does not match three of a kind' do
        expect(m.matching_cards hand('2S 2D 2C')).to be_empty
      end

      it 'matches four of a kind' do
        expect(m.matching_cards hand('2S 2D 2C 2H')).to eq ranks(2, 2, 2, 2)
      end
    end
  end

  describe Straight do
    subject(:m) { Straight.new }

    it 'does not match a 4-card run' do
      expect(m.matching_cards hand('2S 3D 4C 5H')).to be_empty
    end

    it 'matches a straight' do
      expect(m.matching_cards hand('2S 3D 4C 5H 6S')).to eq ranks(2, 3, 4, 5, 6)
    end
  end

  describe Flush do
    subject(:m) { Flush.new }

    it 'does not match 4 of a suit' do
      expect(m.matching_cards hand('2S 3S 4S 5S 7D')).to be_empty
    end

    it 'matches a flush' do
      expect(m.matching_cards hand('2S 3S 4S 5S 7S')).to eq ranks(2, 3, 4, 5, 7)
    end
  end

  describe StraightFlush do
    subject(:m) { StraightFlush.new }

    it 'does not match a low flush' do
      expect(m.matching_cards hand('2S 3S 4S 5S 7S')).to be_empty
    end

    it 'does not match a mixed straight' do
      expect(m.matching_cards hand('2S 3D 4C 5H 6S')).to be_empty
    end

    it 'matches a straight flush' do
      expect(m.matching_cards hand('2S 3S 4S 5S 6S')).to eq ranks(2, 3, 4, 5, 6)
    end
  end

  describe FullHouse do
    subject(:m) { FullHouse.new }

    it 'does not match three of a kind' do
      expect(m.matching_cards hand('2S 2D 2C')).to be_empty
    end

    it 'matches a full house' do
      expect(m.matching_cards hand('2S 2D 2C 3S 3D')).to eq ranks(2, 2, 2, 3, 3)
    end
  end
end
