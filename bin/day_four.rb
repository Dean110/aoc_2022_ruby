#!usr/bin/env ruby
# frozen_string_literal: true

require 'pathname'
require './lib/assignment_coordinator'

INPUT_FILE_PATH = Pathname.new('./input.txt')

scorer = AssignmentCoordinator.new(File.open(INPUT_FILE_PATH).read)

pp scorer.tally_duplicated_assignments
pp scorer.tally_overlapping_assignments
