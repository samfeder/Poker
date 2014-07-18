require 'deck.rb'

describe Deck do
  subject(:deck) { Deck.new }

  let(:ace_of_spades) { Card.new(:ace, :spades) }
  let(:queen_of_hearts) { Card.new(:queen, :hearts) }
  let(:deuce_of_clubs) { Card.new(:deuce, :clubs) }
  let(:rando) { Card.new( :four, :diamonds) }

  describe "#cards" do

    it "should initially contain 52 cards" do
      expect(deck.cards.size).to eq(52)
    end

    it "should contain 13 of each suit" do
      num_spades = deck.cards.select{|card| card.suit == :spades}.count
      expect(num_spades).to eq(13)
    end

    it "should contain 4 of each name" do
      num_aces = deck.cards.select{|card| card.name == :ace}.count
      expect(num_aces).to eq(4)
    end

  end

  describe '#draw_cards' do

    it "takes cards from the front of the deck" do
      expect([deck.cards.first]).to eq(deck.draw_cards(1))
      expect(deck.cards[0..3]).to eq(deck.draw_cards(4))
    end

    it "decreases the deck's size by the number of drawn cards" do
      deck.draw_cards(4)
      expect(deck.cards.size).to eq(48)
    end

    it "raises and error when you take more cards than are left in the deck" do
      expect { deck.draw_cards(53) }.to raise_error(OverDraw)
    end

  end

  describe '#return_cards' do

    before(:each) do
      deck.return_cards([ace_of_spades, queen_of_hearts])
    end

    it "returns cards to the back of the deck" do
      expect(deck.cards.last).to eq(queen_of_hearts)
      expect(deck.cards[-2]).to eq(ace_of_spades)
    end

    it "returns nil" do
      expect(deck.return_cards([ace_of_spades])).to eq(nil)
    end

    it "increases the deck's size by the number of cards returned" do
      expect(deck.cards.size).to eq(54)
    end

  end

  describe '#shuffle' do
    before(:each) do
      deck.shuffle
    end

    it "should be unequal to itself" do
      expect(deck.cards).to_not eq(Deck.default_cards)
    end

    it "stays the same size" do
      expect(deck.cards.size).to eq(Deck.default_cards.size)
      drawn_cards = deck.draw_cards(2)
      deck.shuffle
      expect(deck.cards.size).to eq(Deck.default_cards.size-2)
      deck.return_cards(drawn_cards)
    end

  end

end