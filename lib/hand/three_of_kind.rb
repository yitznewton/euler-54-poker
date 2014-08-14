class ThreeOfKind
  def matches?(cards)
    ranks = cards.group_by(&:rank)
    ranks.values.map(&:length).max == 3
  end
end
