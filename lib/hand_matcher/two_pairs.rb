class TwoPairs
  def matches?(hand)
    rank_counts = hand.cards.group_by(&:rank).values
    pair_groups = rank_counts.select { |g| g.length >= 2 }
    pair_groups.length == 2
  end
end
