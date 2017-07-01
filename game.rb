#!/usr/bin/env ruby

require_relative './deck_of_cards.rb'

class Deck
	include DeckOfCards
	attr_reader :cards
	
	def initialize 
		@cards = []
		DeckOfCards::CARDS.each_pair do | k, v |
			@cards << { "#{k}" => "#{v}" }
		end	
	
	end
end
