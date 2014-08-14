require_relative 'lib/card'
require_relative 'lib/hand'
require_relative 'lib/hand_matcher/two_pairs'
require_relative 'lib/hand_matcher/straight'
require_relative 'lib/hand_matcher/flush'
require_relative 'lib/hand_matcher/straight_flush'
require_relative 'lib/hand_matcher/full_house'
require_relative 'lib/hand_matcher/n_of_kind'
require_relative 'lib/hand_ranker'

ranker = HandRanker.new
p1_wins = 0

STDIN.read.split("\n").each do |line|
  p1_hand = Hand.from_string(line[0, 14])
  p2_hand = Hand.from_string(line[-15, 14])

  if ranker.compare(p1_hand, p2_hand) == 1
    p1_wins += 1
  end
end

puts 'Player 1 won %d times' % p1_wins

