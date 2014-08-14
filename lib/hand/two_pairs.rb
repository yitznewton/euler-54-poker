class TwoPairs
  def matches?(cards)
    rank_counts = cards.map(&:rank).group_by(&:to_s).values
    pair_groups = rank_counts.select { |g| g.length >= 2 }
    pair_groups.length >= 2
  end
end
