# frozen_string_literal: true

class AssignmentCoordinator
  def initialize(input)
    @input = input
  end

  def tally_duplicated_assignments
    assignment_pairs = @input.split "\n"

    assignment_pairs.filter { |pair| duplicated_assignment? pair }.count
  end

  def tally_overlapping_assignments
    assignment_pairs = @input.split "\n"

    assignment_pairs.filter { |pair| overlapped_assignment? pair }.count
  end

  private

  def duplicated_assignment?(assignemnt_pair)
    assignment1, assignment2 = assignemnt_pair.split(',').map do |assignment|
      start_and_end = parse_assignment assignment
      (start_and_end[0].to_i..start_and_end[1].to_i).to_a
    end

    (assignment1 - assignment2).empty? || (assignment2 - assignment1).empty?
  end

  def overlapped_assignment?(assignemnt_pair)
    assignment1, assignment2 = assignemnt_pair.split(',').map do |assignment|
      start_and_end = parse_assignment assignment
      (start_and_end[0].to_i..start_and_end[1].to_i).to_a
    end

    (assignment1 - assignment2).count < assignment1.count || (assignment2 - assignment1).count < assignment2.count
  end

  def parse_assignment(assignment)
    assignment.split('-')
  end
end
