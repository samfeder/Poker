require 'hand.rb'

describe Hand

  let(:high_straight_flush) do
    Hand.new[Card.new(:ace, :spades), Card.new(:king, :spades),
      Card.new(:queen, :spades), Card.new(:jack, :spades),
      Card.new(:ten, :spades)
  end

  let(:low_straight_flush) do
    Hand.new[Card.new(:seven, :spades), Card.new(:six, :spades),
      Card.new(:five, :spades), Card.new(:four, :spades),
      Card.new(:three, :spades)
  end

  let(:high_four_of_a_kind) do
    Hand.new[Card.new(:ace, :spades), Card.new(:ace, :diamonds),
      Card.new(:ace, :clubs), Card.new(:ace, :hearts),
      Card.new(:ten, :spades)
  end

  let(:low_four_of_a_kind) do
    Hand.new[Card.new(:eight, :spades), Card.new(:eight, :diamonds),
      Card.new(:eight, :clubs), Card.new(:eight, :hearts),
      Card.new(:four, :spades)
  end

  let(:high_full_house) do
    Hand.new[Card.new(:ace, :spades), Card.new(:ace, :diamonds),
      Card.new(:ace, :clubs), Card.new(:jack, :spades),
      Card.new(:jacks, :hearts)
  end

  let(:low_full_house) do
    Hand.new[Card.new(:eight, :spades), Card.new(:eight, :diamonds),
      Card.new(:eight, :clubs), Card.new(:four, :spades),
      Card.new(:four, :diamonds)
  end

  let(:high_flush) do
    Hand.new[Card.new(:ace, :spades), Card.new(:four, :spades),
      Card.new(:queen, :spades), Card.new(:jack, :spades),
      Card.new(:ten, :spades)
  end

  let(:low_flush)  do
    Hand.new[Card.new(:three, :spades), Card.new(:seven, :spades),
      Card.new(:six, :spades), Card.new(:eight, :spades),
      Card.new(:ten, :spades)
  end

  let(:high_straight) do
    Hand.new[Card.new(:ace, :clubs), Card.new(:king, :spades),
      Card.new(:queen, :hearts), Card.new(:jack, :spades),
      Card.new(:ten, :spades)
  end

  let(:low_straight) do
    Hand.new[Card.new(:deuce, :clubs), Card.new(:three, :spades),
      Card.new(:four, :hearts), Card.new(:five, :spades),
      Card.new(:six, :spades)
  end

  let(:high_three_of_a_kind) do
    Hand.new[Card.new(:ace, :clubs), Card.new(:ace, :spades),
      Card.new(:ace, :hearts), Card.new(:jack, :spades),
      Card.new(:ten, :spades)
  end

  let(:low_three_of_a_kind) do
    Hand.new[Card.new(:three, :clubs), Card.new(:three, :spades),
      Card.new(:three, :hearts), Card.new(:jack, :spades),
      Card.new(:ten, :spades)
  end

  let(:high_two_pair) do
    Hand.new[Card.new(:ace, :clubs), Card.new(:ace, :spades),
      Card.new(:queen, :hearts), Card.new(:queen, :spades),
      Card.new(:ten, :spades)
  end

  let(:low_two_pair) do
    Hand.new[Card.new(:three, :clubs), Card.new(:three, :spades),
      Card.new(:five, :hearts), Card.new(:five, :spades),
      Card.new(:ten, :spades)
  end

  let(:high_pair) do
    Hand.new[Card.new(:king, :clubs), Card.new(:king, :spades),
      Card.new(:five, :hearts), Card.new(:six, :spades),
      Card.new(:ten, :spades)
  end

  let(:low_pair) do
    Hand.new[Card.new(:three, :clubs), Card.new(:three, :spades),
      Card.new(:five, :hearts), Card.new(:six, :spades),
      Card.new(:ten, :spades)
  end

  let(:high_card) do
    Hand.new[Card.new(:king, :clubs), Card.new(:three, :spades),
      Card.new(:five, :hearts), Card.new(:six, :spades),
      Card.new(:ten, :spades)
  end

  let(:low_card) do
    Hand.new[Card.new(:deuce, :clubs), Card.new(:three, :spades),
      Card.new(:five, :hearts), Card.new(:six, :spades),
      Card.new(:ten, :spades)
  end






end