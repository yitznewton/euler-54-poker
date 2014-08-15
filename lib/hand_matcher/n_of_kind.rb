class NOfKind
  def initialize(n)
    @n = n
  end

  def matching_cards(hand)
    grouped = hand.cards.group_by(&:rank)
    matches = grouped.keep_if do |_, positions|
      positions.length == @n
    end
    matches.to_a.map do |rank|
      rank_value = rank[0]
      rank_positions = rank[1]
      Array.new(rank_positions.length, rank_value)
    end.flatten
  end
end
