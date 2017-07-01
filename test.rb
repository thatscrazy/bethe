#!/usr/bin/env ruby
require 'minitest/autorun'
require 'minitest/pride'

require_relative './game.rb'

describe Deck do
	it "should be 52 cards long" do
		deck = Deck.new
		assert deck.cards.length == 52
	end
	
	it "should have 13 cards of each suit" do
		spades, hearts, clubs, diamonds = 0, 0, 0, 0
		deck = Deck.new
		deck.cards.each do | card |
		
		# DeckOfCards::CARDS is a hash containing only key:value pairs,
		# but Deck.new has an attribute method #cards, which returns an array of 
		# hashes that look like: { suit_and_value(String) => value(Integer)}. 
		# This makes each $CARD in #cards.each a hash as well, 
		# so card[0] is:
		#
		# 		> card[0] => {"spades_two"=>"2"}	
		# 
		# This is why we need to first extract all the keys from this hash 
		# (there's only one key, fortunately):
		#
		#			> card.keys => ["spades_two"]
		#
		#	this returns an array, so we use [0] to get at the string "spades_two"
		# inside of it:
			case 
				when card.keys[0].include?("spades") == true then spades += 1
				when card.keys[0].include?("hearts") == true then hearts += 1
				when card.keys[0].include?("clubs") == true then clubs += 1
				when card.keys[0].include?("diamonds") == true then diamonds += 1
			end
		end
		
		assert spades && hearts && clubs && diamonds == 13
	end

	it "should have the correct 13 cards for each suit" do
		spades, hearts, diamonds, clubs = [], [], [], []			
		total_card_value_per_suit = ( 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 + 11 + 12 + 13 + 14)
		deck = Deck.new
		deck.cards.each do | card |
			case
				when card.keys[0].include?("spades") then spades << card
				when card.keys[0].include?("hearts") == true then hearts << card 
				when card.keys[0].include?("clubs") == true then clubs << card 
				when card.keys[0].include?("diamonds") == true then diamonds << card 
			end
		end
		spades_total, hearts_total, clubs_total, diamonds_total = 0, 0, 0, 0

		# spade.values returns an array containing a string of our value:
		#		2.4.1 :019 > spades.each { |spade| puts spade.values[0].class }
    # 								String
		#
		spades.each { | spade | spades_total += spade.values[0].to_i }
		assert spades_total == total_card_value_per_suit
	end
end














