require 'hand.rb'

describe Hand do

  let(:high_straight_flush) do
    Hand.new([Card.new(:ace, :spades), Card.new(:king, :spades),
      Card.new(:queen, :spades), Card.new(:jack, :spades),
      Card.new(:ten, :spades)])
  end

  let(:low_straight_flush) do
    Hand.new([Card.new(:seven, :spades), Card.new(:six, :spades),
      Card.new(:five, :spades), Card.new(:four, :spades),
      Card.new(:three, :spades)])
  end

  let(:high_four_of_a_kind) do
    Hand.new([Card.new(:ace, :spades), Card.new(:ace, :diamonds),
      Card.new(:ace, :clubs), Card.new(:ace, :hearts),
      Card.new(:ten, :spades)])
  end

  let(:low_four_of_a_kind) do
    Hand.new([Card.new(:eight, :spades), Card.new(:eight, :diamonds),
      Card.new(:eight, :clubs), Card.new(:eight, :hearts),
      Card.new(:four, :spades)])
  end

  let(:high_full_house) do
    Hand.new([Card.new(:ace, :spades), Card.new(:ace, :diamonds),
      Card.new(:ace, :clubs), Card.new(:jack, :spades),
      Card.new(:jack, :hearts)])
  end

  let(:low_full_house) do
    Hand.new([Card.new(:eight, :spades), Card.new(:eight, :diamonds),
      Card.new(:eight, :clubs), Card.new(:four, :spades),
      Card.new(:four, :diamonds)])
  end

  let(:high_flush) do
    Hand.new([Card.new(:ace, :spades), Card.new(:four, :spades),
      Card.new(:queen, :spades), Card.new(:jack, :spades),
      Card.new(:ten, :spades)])
  end

  let(:low_flush)  do
    Hand.new([Card.new(:three, :spades), Card.new(:seven, :spades),
      Card.new(:six, :spades), Card.new(:eight, :spades),
      Card.new(:ten, :spades)])
  end

  let(:high_straight) do
    Hand.new([Card.new(:ace, :clubs), Card.new(:king, :spades),
      Card.new(:queen, :hearts), Card.new(:jack, :spades),
      Card.new(:ten, :spades)])
  end

  let(:low_straight) do
    Hand.new([Card.new(:deuce, :clubs), Card.new(:three, :spades),
      Card.new(:four, :hearts), Card.new(:five, :spades),
      Card.new(:six, :spades)])
  end

  let(:high_three_of_a_kind) do
    Hand.new([Card.new(:ace, :clubs), Card.new(:ace, :spades),
      Card.new(:ace, :hearts), Card.new(:jack, :spades),
      Card.new(:ten, :spades)])
  end

  let(:low_three_of_a_kind) do
    Hand.new([Card.new(:three, :clubs), Card.new(:three, :spades),
      Card.new(:three, :hearts), Card.new(:jack, :spades),
      Card.new(:ten, :spades)])
  end

  let(:high_two_pair) do
    Hand.new([Card.new(:ace, :clubs), Card.new(:ace, :spades),
      Card.new(:queen, :hearts), Card.new(:queen, :spades),
      Card.new(:ten, :spades)])
  end

  let(:low_two_pair) do
    Hand.new([Card.new(:three, :clubs), Card.new(:three, :spades),
      Card.new(:five, :hearts), Card.new(:five, :spades),
      Card.new(:ten, :spades)])
  end

  let(:high_pair) do
    Hand.new([Card.new(:king, :clubs), Card.new(:king, :spades),
      Card.new(:five, :hearts), Card.new(:six, :spades),
      Card.new(:ten, :spades)])
  end

  let(:low_pair) do
    Hand.new([Card.new(:three, :clubs), Card.new(:three, :spades),
      Card.new(:five, :hearts), Card.new(:six, :spades),
      Card.new(:ten, :spades)])
  end

  let(:high_card) do
    Hand.new([Card.new(:king, :clubs), Card.new(:three, :spades),
      Card.new(:five, :hearts), Card.new(:six, :spades),
      Card.new(:ten, :spades)])
  end

  let(:low_card) do
    Hand.new([Card.new(:deuce, :clubs), Card.new(:three, :spades),
      Card.new(:five, :hearts), Card.new(:six, :spades),
      Card.new(:ten, :spades)])
  end

  describe "#type" do

    it "should recognize a straight flush" do
      expect(high_straight_flush.type).to eq(:straight_flush)
    end

    it "should recognize a four of a kind" do
      expect(high_four_of_a_kind.type).to eq(:four_of_a_kind)
    end

    it "should recognize a full house" do
      expect(high_full_house.type).to eq(:full_house)
    end

    it "should recognize a flush" do
      expect(high_flush.type).to eq(:flush)
    end

    it "should recognize a straight" do
      expect(high_straight.type).to eq(:straight)
    end

    it "should recognize a three of a kind" do
      expect(high_three_of_a_kind.type).to eq(:three_of_a_kind)
    end

    it "should recognize a two-pair" do
      expect(high_two_pair.type).to eq(:two_pair)
    end


    it "should recognize a pair" do
      expect(high_pair.type).to eq(:pair)
    end

    it "should recognize a high card hand" do
      expect(high_card.type).to eq(:high_card)
    end

  end

  describe "#<=>" do

    it "a straight flush should beat a four of a kind" do
      expect(low_straight_flush <=> high_four_of_a_kind).to eq(1)
    end

    it "a four of a kind should beat a full house" do
      expect(low_four_of_a_kind <=> high_full_house).to eq(1)
    end

    it "a full house should beat a flush" do
      expect(high_flush <=> low_full_house).to eq(-1)
    end

    it "a flush should beat a straight" do
      expect(high_straight <=> low_flush).to eq(-1)
    end

    it "a straight should beat a three of a kind" do
      expect(high_straight <=> high_three_of_a_kind).to eq(1)
    end

    it "a three of a kind should beat a two pair" do
      expect(low_three_of_a_kind <=> low_two_pair).to eq(1)
    end

    it "a two pair should beat a pair" do
      expect(high_pair <=> high_two_pair).to eq(-1)
    end

    it "a pair should beat a shit hand" do
      expect(low_two_pair <=> high_card).to eq(1)
    end

    it "should choose the higher of two hands of the same type" do
      expect(high_straight_flush <=> low_straight_flush).to eq(1)
      expect(high_four_of_a_kind <=> low_four_of_a_kind).to eq(1)
      expect(low_full_house <=> high_full_house).to eq(-1)
      expect(high_flush <=> low_flush).to eq(1)
      expect(low_straight <=> high_straight).to eq(-1)
      expect(high_three_of_a_kind <=> low_three_of_a_kind).to eq(1)
      expect(high_two_pair<=> low_two_pair).to eq(1)
      expect(low_pair <=> high_pair).to eq(-1)
      expect(high_card <=> low_card).to eq(1)
    end

  end


end