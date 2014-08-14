require 'hand_ranker'

describe HandRanker do
  subject(:ranker) { HandRanker.new }

  describe '#compare' do
    context 'with royal flush and straight flush' do
      it 'should favor the royal flush' do
        hand0 = cards(%w(9S KS QS JS TS))
        hand1 = cards(%w(AS KS QS JS TS))
        expect(ranker.compare(hand0, hand1)).to eq -1
      end
    end

    context 'with straight flush and four of a kind' do
      it 'should favor the straight flush' do
        hand0 = cards(%w(9S KS QS JS TS))
        hand1 = cards(%w(AS AC AD AH))
        expect(ranker.compare(hand0, hand1)).to eq 1
      end
    end

    context 'with four of kind and full house' do
      it 'should favor the four of a kind' do
        hand0 = cards(%w(9S 9S 9C 3S 3C))
        hand1 = cards(%w(AS AC AD AH))
        expect(ranker.compare(hand0, hand1)).to eq -1
      end
    end

    context 'with full house and flush' do
      it 'should favor the full house' do
        hand0 = cards(%w(9S 9S 9C 3S 3C))
        hand1 = cards(%w(AS 2S 4S 6S 8S))
        expect(ranker.compare(hand0, hand1)).to eq 1
      end
    end

    context 'with flush and straight' do
      it 'should favor the flush' do
        hand0 = cards(%w(2S 3D 4S 5S 6S))
        hand1 = cards(%w(AS 2S 4S 6S 8S))
        expect(ranker.compare(hand0, hand1)).to eq -1
      end
    end

    context 'with straight and three of kind' do
      it 'should favor the straight' do
        hand0 = cards(%w(2S 3D 4S 5S 6S))
        hand1 = cards(%w(AS AC AD))
        expect(ranker.compare(hand0, hand1)).to eq 1
      end
    end

    context 'with three of kind and two pairs' do
      it 'should favor the three of kind' do
        hand0 = cards(%w(2S 2D 4S 4S))
        hand1 = cards(%w(AS AC AD))
        expect(ranker.compare(hand0, hand1)).to eq -1
      end
    end

    context 'with two pairs and one pair' do
      it 'should favor the two pairs' do
        hand0 = cards(%w(2S 2D 4S 4S))
        hand1 = cards(%w(AS AC))
        expect(ranker.compare(hand0, hand1)).to eq 1
      end
    end

    context 'with one pair and nothing' do
      it 'should favor the pair' do
        hand0 = cards(%w(9S 2D 4S 6S 8S))
        hand1 = cards(%w(6S 6C))
        expect(ranker.compare(hand0, hand1)).to eq -1
      end
    end

    context 'with nothing' do
      it 'should favor the high card' do
        hand0 = cards(%w(9S 2D 4S 6S 8S))
        hand1 = cards(%w(6S 3C))
        expect(ranker.compare(hand0, hand1)).to eq 1
      end
    end

    context 'with same-ranking hands' do
      it 'should favor the high card' do
        hand0 = cards(%w(2D 3S 4D 5D 6D))
        hand1 = cards(%w(7D 3S 4D 5D 6D))
        expect(ranker.compare(hand0, hand1)).to eq -1
      end
    end
  end
end
