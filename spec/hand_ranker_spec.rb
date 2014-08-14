require 'hand_ranker'

describe HandRanker do
  subject(:ranker) { HandRanker.new }

  describe '#compare' do
    context 'with royal flush and straight flush' do
      it 'favors the royal flush' do
        hand0 = Hand.from_string('9S KS QS JS TS')
        hand1 = Hand.from_string('AS KS QS JS TS')
        expect(ranker.compare(hand0, hand1)).to eq -1
      end
    end

    context 'with straight flush and four of a kind' do
      it 'favors the straight flush' do
        hand0 = Hand.from_string('9S KS QS JS TS')
        hand1 = Hand.from_string('AS AC AD AH')
        expect(ranker.compare(hand0, hand1)).to eq 1
      end
    end

    context 'with four of kind and full house' do
      it 'favors the four of a kind' do
        hand0 = Hand.from_string('9S 9S 9C 3S 3C')
        hand1 = Hand.from_string('AS AC AD AH')
        expect(ranker.compare(hand0, hand1)).to eq -1
      end
    end

    context 'with full house and flush' do
      it 'favors the full house' do
        hand0 = Hand.from_string('9S 9S 9C 3S 3C')
        hand1 = Hand.from_string('AS 2S 4S 6S 8S')
        expect(ranker.compare(hand0, hand1)).to eq 1
      end
    end

    context 'with flush and straight' do
      it 'favors the flush' do
        hand0 = Hand.from_string('2S 3D 4S 5S 6S')
        hand1 = Hand.from_string('AS 2S 4S 6S 8S')
        expect(ranker.compare(hand0, hand1)).to eq -1
      end
    end

    context 'with straight and three of kind' do
      it 'favors the straight' do
        hand0 = Hand.from_string('2S 3D 4S 5S 6S')
        hand1 = Hand.from_string('AS AC AD')
        expect(ranker.compare(hand0, hand1)).to eq 1
      end
    end

    context 'with three of kind and two pairs' do
      it 'favors the three of kind' do
        hand0 = Hand.from_string('2S 2D 4S 4S')
        hand1 = Hand.from_string('AS AC AD')
        expect(ranker.compare(hand0, hand1)).to eq -1
      end
    end

    context 'with two pairs and one pair' do
      it 'favors the two pairs' do
        hand0 = Hand.from_string('2S 2D 4S 4S')
        hand1 = Hand.from_string('AS AC')
        expect(ranker.compare(hand0, hand1)).to eq 1
      end
    end

    context 'with one pair and nothing' do
      it 'favors the pair' do
        hand0 = Hand.from_string('9S 2D 4S 6S 8S')
        hand1 = Hand.from_string('6S 6C')
        expect(ranker.compare(hand0, hand1)).to eq -1
      end
    end

    context 'with nothing' do
      it 'favors the high card' do
        hand0 = Hand.from_string('9S 2D 4S 6S 8S')
        hand1 = Hand.from_string('6S 3C')
        expect(ranker.compare(hand0, hand1)).to eq 1
      end
    end

    context 'with same-ranking hands' do
      it 'favors the high card' do
        hand0 = Hand.from_string('2D 3S 4D 5D 6D')
        hand1 = Hand.from_string('7D 3S 4D 5D 6D')
        expect(ranker.compare(hand0, hand1)).to eq -1
      end
    end
  end
end
