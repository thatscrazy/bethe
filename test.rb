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
end
