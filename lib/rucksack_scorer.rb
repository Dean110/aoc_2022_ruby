# frozen_string_literal: true

# RucksackScorer is for {https://adventofcode.com/2022/day/3 the third day of Advent of Code 2022}.
# The problem was to read a list of strings representing elf rucksacks, finding common items, scoring them and
# submitting the sum of the items.
# @author Dean110
class RucksackScorer
  # @param input [String] the day three problem input.
  def initialize(input)
    @input = input
    @rucksacks = @input.split("\n")
  end

  # This method parses the rucksack inputs and finds a common character between the first and second half of the String.
  # It then assigns a priority score to the common item for each rucksack and sums all of the common items' scores.
  # @return [Integer] the sum of all common items in rucksack halves.
  def score_all_rucksacks
    @rucksacks.map do |bp|
      score bp
    end.sum
  end

  # This method parses the rucksack inputs and divides the list into teams of elves.
  # The teams of elves then have their rucksacks examined to find their badge items.
  # The badge items are assigned a priority score and then all of the teams' badges' scores are summed.
  # @return [Integer] the sum of each team's badge's priority score.
  def score_all_badges
    elf_teams = @rucksacks.each_slice(3).to_a
    elf_teams.each.map do |team|
      badge = find_badge team
      translate_item_priority badge
    end.sum
  end

  private

  def score(rucksack)
    duplicate_item = find_item_in_both_halves rucksack
    translate_item_priority duplicate_item
  end

  def translate_item_priority(item)
    return item.ord - 96 if item == item.downcase

    item.ord - 38
  end

  def find_item_in_both_halves(rucksack)
    side1, side2 = rucksack.chars.each_slice(rucksack.length / 2).map(&:join)
    side1.chars.select { |ch| side2.include? ch }.reduce { |i| i }
  end

  def find_badge(elf_team)
    elf1 = elf_team[0]
    elf2 = elf_team[1]
    elf3 = elf_team[2]

    elf1.chars.select { |item| elf2.include?(item) && elf3.include?(item) }.reduce { |i| i }
  end
end
