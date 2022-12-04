#!usr/bin/env ruby
# frozen_string_literal: true

require 'pathname'
require './lib/rucksack_scorer'

INPUT_FILE_PATH = Pathname.new('./input.txt')

scorer = RucksackScorer.new(File.open(INPUT_FILE_PATH).read)

pp scorer.score_all_rucksacks
pp scorer.score_all_badges
