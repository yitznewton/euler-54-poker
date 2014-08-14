require 'hand_matcher/two_pairs'
require 'hand_matcher/straight'
require 'hand_matcher/flush'
require 'hand_matcher/straight_flush'
require 'hand_matcher/royal_flush'
require 'hand_matcher/full_house'
require 'hand_matcher/n_of_kind'

describe '#match' do
  describe TwoPairs do
    subject(:matcher) { TwoPairs.new }

    it 'does not match a single pair' do
      expect(matcher.matches? Hand.from_string('2S, 2D')).to be false
    end

    it 'does not match three of a kind' do
      expect(matcher.matches? Hand.from_string('2s 2d 2c')).to be false
    end

    it 'matches two pairs' do
      expect(matcher.matches? Hand.from_string('2S 2D 4S 4D')).to be true
    end
  end

  describe NOfKind do
    context 'with 2' do
      subject(:matcher) { NOfKind.new(2) }

      it 'does not match a single card' do
        expect(matcher.matches? Hand.from_string('2S')).to be false
      end

      it 'matches a pair' do
        expect(matcher.matches? Hand.from_string('2S 2D')).to be true
      end
    end

    context 'with 3' do
      subject(:matcher) { NOfKind.new(3) }

      it 'does not match two pairs' do
        expect(matcher.matches? Hand.from_string('2S 2D 4S 4D')).to be false
      end

      it 'matches three of a kind' do
        expect(matcher.matches? Hand.from_string('2S 2D 2C')).to be true
      end
    end

    context 'with 4' do
      subject(:matcher) { NOfKind.new(4) }
      it 'does not match three of a kind' do
        expect(matcher.matches? Hand.from_string('2S 2D 2C')).to be false
      end

      it 'matches four of a kind' do
        expect(matcher.matches? Hand.from_string('2S 2D 2C 2H')).to be true
      end
    end
  end

  describe Straight do
    subject(:matcher) { Straight.new }

    it 'does not match a 4-card run' do
      expect(matcher.matches? Hand.from_string('2S 3D 4C 5H')).to be false
    end

    it 'matches a straight' do
      expect(matcher.matches? Hand.from_string('2S 3D 4C 5H 6S')).to be true
    end
  end

  describe Flush do
    subject(:matcher) { Flush.new }

    it 'does not match 4 of a suit' do
      expect(matcher.matches? Hand.from_string('2S 3S 4S 5S 7D')).to be false
    end

    it 'matches a flush' do
      expect(matcher.matches? Hand.from_string('2S 3S 4S 5S 7S')).to be true
    end
  end

  describe StraightFlush do
    subject(:matcher) { StraightFlush.new }

    it 'does not match a low flush' do
      expect(matcher.matches? Hand.from_string('2S 3S 4S 5S 7S')).to be false
    end

    it 'does not match a mixed straight' do
      expect(matcher.matches? Hand.from_string('2S 3D 4C 5H 6S')).to be false
    end

    it 'matches a straight flush' do
      expect(matcher.matches? Hand.from_string('2S 3S 4S 5S 6S')).to be true
    end
  end

  describe RoyalFlush do
    subject(:matcher) { RoyalFlush.new }

    it 'does not match a low straight flush' do
      expect(matcher.matches? Hand.from_string('9S TS JS QS KS')).to be false
    end

    it 'matches a royal flush' do
      expect(matcher.matches? Hand.from_string('TS JS QS KS AS')).to be true
    end
  end

  describe FullHouse do
    subject(:matcher) { FullHouse.new }

    it 'does not match three of a kind' do
      expect(matcher.matches? Hand.from_string('2S 2D 2C')).to be false
    end

    it 'matches a full house' do
      expect(matcher.matches? Hand.from_string('2S 2D 2C 3S 3D')).to be true
    end
  end
end
