# frozen_string_literal: true

# CalorieCounter is for {https://adventofcode.com/2022/day/1 the first day of Advent of Code 2022}.
# The problem was to read a list of integers, determine which elf represented in that list had the most calories, and
# return the sum of their calories.
# @author Dean110
class CalorieCounter
  # String representing elves' collection of snacks' calorie counts.
  # @return [String] the input from the day one puzzle.
  attr_reader :input

  # @param input [String] the day one problem input
  def initialize(input)
    @input = input
  end

  # @return [Integer] the sum the snacks of the elf with the most calories.
  def highest_calorie_count
    elves.map { |elf| elf.split("\n").map(&:to_i).sum }.max
  end

  # @return [Integer] the sum the snacks of the top three elves with the most calories.
  def three_highest_calorie_counts_summed
    elves.map { |elf| elf.split("\n").map(&:to_i).sum }.max(3).sum
  end

  private

  def elves
    input.split("\n\n")
  end
end
