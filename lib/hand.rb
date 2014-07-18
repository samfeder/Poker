require 'deck.rb'

class Hand

  HAND_TYPE = {
    :straight_flush => 8,
    :four_of_a_kind => 7,
    :full_house => 6,
    :flush => 5,
    :straight => 4,
    :three_of_a_kind => 3,
    :two_pair => 2,
    :pair => 1,
    :high_card => 0
  }


  def initialize(array_of_cards)
    @cards = array_of_cards
  end

  def type
    if straight? || flush?
      if straight?
        if flush?
          return :straight_flush
        else
          return :straight
        end
      else
        return :flush
      end
    else
      return multiplicity
    end

  end

  def <=>(other_hand)
    unless self.type == other_hand.type
      return HAND_TYPE[self.type] <=> HAND_TYPE[other_hand.type]
    end

    own_array = self.comparison_array
    other_array = other_hand.comparison_array

    until own_array.first != other_array.first || own_array.length == 1
      own_array.shift
      other_array.shift
    end

    own_array.first <=> other_array.first
  end

  def comparison_array
    result = []
    vals = get_values.reverse
    counts = vals.map { |value| vals.count(value)}
    4.downto(1) do |count|
      5.times { |i| result << vals[i] if counts[i] == count }
    end
    result
  end

  def get_values
    values = @cards.map {|card| card.value}.sort
    values == [2,3,4,5,14] ? [1,2,3,4,5] : values
  end

  def straight?
    get_values.map { |value| value - get_values.min} == [0,1,2,3,4]
  end

  def flush?
    @cards.all? {|card| card.suit == @cards[0].suit}
  end


  def multiplicity
    max_mult = get_values.map { |value| get_values.count(value)}.max

    result = case get_values.uniq.size
    when 5 then :high_card
    when 4 then :pair
    when 3 then max_mult == 3 ? :three_of_a_kind : :two_pair
    when 2 then max_mult == 4 ? :four_of_a_kind : :full_house
    end

    result
  end

end