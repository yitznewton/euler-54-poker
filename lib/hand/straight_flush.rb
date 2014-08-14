class StraightFlush
  def matches?(cards)
    Straight.new.matches?(cards) && Flush.new.matches?(cards)
  end
end
