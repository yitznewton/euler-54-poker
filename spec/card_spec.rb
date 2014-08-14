require 'card'

describe Card do
  def card(code)
    Card.new(code)
  end

  describe '#<=>' do
    it 'compares two cards of different numeric value' do
      expect(card('2D')).to be < card('3S')
    end

    it 'compares 9 and T' do
      expect(card('9S')).to be < card('TS')
    end

    it 'compares T and J' do
      expect(card('TS')).to be < card('JS')
    end

    it 'compares J and Q' do
      expect(card('JS')).to be < card('QS')
    end

    it 'compares Q and K' do
      expect(card('QS')).to be < card('KS')
    end

    it 'compares K and A' do
      expect(card('KS')).to be < card('AS')
    end
  end
end
