class TwoPairs
  def matching_cards(hand)
    rank_groups = hand.cards.group_by(&:rank)

    pair_groups = rank_groups.keep_if do |_, positions|
      positions.length >= 2
    end

    if pair_groups.length == 2
      pair_groups.values.flatten.map(&:rank)
    else
      []
    end
  end
end
