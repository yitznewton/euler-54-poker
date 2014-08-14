class TwoPairs
  def matches?(hand)
    rank_counts = hand.cards.map(&:rank).group_by(&:to_s).values
    pair_groups = rank_counts.select { |g| g.length >= 2 }
    pair_groups.length == 2
  end
end
