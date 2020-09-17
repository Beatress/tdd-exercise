require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do

    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert <-  You do this part!
    expect(score).must_equal 7
  end

  it 'facecards have values calculated correctly' do
    hand = ["King", "Jack"]
    score = blackjack_score(hand)
    expect(score).must_equal 20
  end

  it 'calculates aces as 11 where it does not go over 21' do
    hand = ["King", "Ace"]
    score = blackjack_score(hand)
    expect(score).must_equal 21
  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do
    hand = ["King", "King", "Ace"]
    score = blackjack_score(hand)
    expect(score).must_equal 21

    hand = [5, 5, 5, 5, "Ace"]
    score = blackjack_score(hand)
    expect(score).must_equal 21

    hand = [5, 4, "Ace", "Ace"]
    score = blackjack_score(hand)
    expect(score).must_equal 21
  end

  it 'raises an ArgumentError for invalid cards' do
    hand = [2]
    expect { blackjack_score(hand) }.must_raise ArgumentError

    hand = [2, 2, 2, 2, 2, 2]
    expect { blackjack_score(hand) }.must_raise ArgumentError

    hand =[]
    score = blackjack_score(hand)
    expect(score).must_be_nil

    hand = [[3], [7]]
    expect { blackjack_score(hand) }.must_raise ArgumentError

    hand = ["Ace", "cat"]
    expect { blackjack_score(hand) }.must_raise ArgumentError

    hand = "abcd"
    expect { blackjack_score(hand) }.must_raise ArgumentError

    hand = nil
    expect { blackjack_score(hand) }.must_raise ArgumentError
  end

  it 'raises an ArgumentError for scores over 21' do
    hand = ["Ace", "Ace", "King", "King"]
    expect { blackjack_score(hand) }.must_raise ArgumentError

    hand = [8, 8, 8]
    expect { blackjack_score(hand) }.must_raise ArgumentError

    hand = [5, 5, 5, 5, 2]
    expect { blackjack_score(hand) }.must_raise ArgumentError
  end
end