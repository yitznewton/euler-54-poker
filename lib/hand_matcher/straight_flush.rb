class StraightFlush
  def matches?(hand)
    Straight.new.matches?(hand) && Flush.new.matches?(hand)
  end
end
