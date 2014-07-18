require 'card'

describe Card do
  let(:ace_of_spades) { Card.new(:ace, :spades) }
  let(:queen_of_hearts) { Card.new(:queen, :hearts) }
  let(:deuce_of_clubs) { Card.new(:deuce, :clubs) }
  let(:rando) { Card.new( :four, :diamonds) }

  it "returns a string representation card's suit" do
    expect(ace_of_spades.display_suit).to eq("♠")
    expect(queen_of_hearts.display_suit).to eq("♥".red)
    expect(deuce_of_clubs.display_suit).to eq("♣")
    expect(rando.display_suit).to eq("♦".red)

  end

  it "returns a symbol representation of a card's suit" do
    expect(ace_of_spades.suit).to eq(:spades)
    expect(queen_of_hearts.suit).to eq(:hearts)
    expect(deuce_of_clubs.suit).to eq(:clubs)
    expect(rando.suit).to eq(:diamonds)

  end

  it "returns a string representation of a card's name" do
    expect(ace_of_spades.display_name).to eq("A")
    expect(queen_of_hearts.display_name).to eq("Q")
    expect(deuce_of_clubs.display_name).to eq("2")
    expect(rando.display_name).to eq("4")
  end



  describe "#value" do

    it "returns a value for non-ace cards" do

      expect(queen_of_hearts.value).to eq(12)
      expect(deuce_of_clubs.value).to eq(2)
      expect(rando.value).to eq(4)
    end

    it "raises an exception for aces" do
      expect { ace_of_spades.value }.to raise_error(AcesAreWonky)
    end



  end

end