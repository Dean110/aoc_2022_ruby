#!usr/bin/env ruby
# frozen_string_literal: true

require 'pathname'
require './lib/supply_stacks'

INPUT_FILE_PATH = Pathname.new('./input.txt')

scorer = SupplyStacks.new(File.open(INPUT_FILE_PATH).read)

pp scorer.move_crates
# pp scorer.tally_overlapping_assignments
