require_relative "card.rb"
class Deck

  def self.default_cards
    deck = []
    Card.all_suits.each do |suit|
      Card.all_names.each do |name|
        deck << Card.new(name, suit)
      end
    end
    deck
  end

  attr_reader :cards

  def initialize
    @cards = self.class.default_cards
  end

  def draw_cards(num)
    raise OverDraw if @cards.size <= num
    @cards.shift(num)
  end

  def return_cards(array_of_cards)
    @cards += array_of_cards
    nil
  end

  def shuffle
    @cards.shuffle!
    nil
  end

end

class OverDraw < StandardError
end