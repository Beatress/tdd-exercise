# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)
  # Sanity checks
  raise ArgumentError.new("Hand is not an array") if hand.class != Array
  return nil if hand.empty?
  raise ArgumentError.new("Invalid hand length") if hand.length < 2 || hand.length > 5

  # Iterate through cards adding scores and keeping an ace count
  score = 0
  aces = 0
  hand.each do |card|
    card.capitalize! if card.class == String
    raise ArgumentError.new("Invalid card(s)") unless VALID_CARDS.include?(card)
    if card.to_i == 0
      if card == 'Ace'
        aces += 1
      else
        score += 10
      end
    else
      score += card
    end
  end

  # Add aces to score
  while aces > 0
    score + 11 > 21 ? score += 1 : score += 11
    aces -= 1
  end

  # Bust check and return score
  raise ArgumentError.new("Score is over 21") if score > 21
  return score
end