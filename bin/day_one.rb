#!usr/bin/env ruby
# frozen_string_literal: true

require 'pathname'
require './lib/calorie_counter'

INPUT_FILE_PATH = Pathname.new('./input.txt')

calorie_counter = CalorieCounter.new(File.open(INPUT_FILE_PATH).read)

pp "Highest Elf Total:               #{calorie_counter.highest_calorie_count}"
pp "Three Highest Elf Totals Summed: #{calorie_counter.three_highest_calorie_counts_summed}"
