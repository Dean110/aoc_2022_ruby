#!usr/bin/env ruby
# frozen_string_literal: true

require 'pathname'
require './lib/tournament_tally'

INPUT_FILE_PATH = Pathname.new('./input.txt')

tournament_tally = TournamentTally.new(File.open(INPUT_FILE_PATH).read)

pp tournament_tally.tally_game_points_part_one
pp tournament_tally.tally_game_points_part_two
