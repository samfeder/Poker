# -*- coding: utf-8 -*-
require "colorize"

class Card

  SUITS = {
    :spades => "♠",
    :diamonds => "♦".red,
    :hearts => "♥".red,
    :clubs => "♣"
  }

  VALUES = {
    :deuce => 2,
    :three => 3,
    :four => 4,
    :five => 5,
    :six => 6,
    :seven => 7,
    :eight => 8,
    :nine => 9,
    :ten => 10,
    :jack => 11,
    :queen => 12,
    :king => 13,
    :ace => 14
  }

  NAMES = {
    :deuce => '2',
    :three => '3',
    :four => '4',
    :five => '5',
    :six => '6',
    :seven => '7',
    :eight => '8',
    :nine => '9',
    :ten => '10',
    :jack => 'J',
    :queen => 'Q',
    :king => 'K',
    :ace => 'A'
  }

  def self.all_suits
    SUITS.keys
  end

  def self.all_names
    NAMES.keys
  end

  attr_reader :suit, :name

  def initialize(name, suit)
    @suit, @name = suit, name
  end

  def display_suit
    SUITS[@suit]
  end

  def display_name
    NAMES[@name]
  end

  def value
   VALUES[@name]
  end

  def self.card_values
    VALUES
  end

end
