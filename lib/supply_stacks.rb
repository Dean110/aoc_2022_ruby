# frozen_string_literal: true

require 'pry'

class SupplyStacks
  def initialize(input)
    @input = input
  end

  def move_crates
    parse_input_into_sections

    parse_section_into_stacks @sections[0]
    parse_section_into_moves @sections[1]
    shift_crates

    @stacks.map { |stack| stack[0] }.join
  end

  def parse_input_into_sections
    @sections = @input.split("\n\n")
  end

  def parse_section_into_stacks(data)
    lines = data.split("\n")
    stack_count = (lines.first.length + 1) / 4
    @stacks = []
    lines.each do |line|
      line.chars.each_slice(4).each_with_index do |crate, index|
        next unless crate.include? "["
        crate_id = crate[1]
        stack = @stacks[index] || []
        stack << crate_id unless crate_id.include? ' ' || crate_id
        @stacks[index] = stack
      end
    end
  end

  def shift_crates
    @moves.each do |move|
      pp @stacks
      move_crates_from_stacks amount: move[:amount], origin: move[:origin], destination: move[:destination]
    end
  end

  def move_crates_from_stacks(origin:, destination:, amount:)
      crates_to_move = @stacks[origin - 1].shift amount
      @stacks[destination - 1].unshift(crates_to_move)
      @stacks[destination - 1].flatten!
  end

  def parse_section_into_moves(data)
    @moves = data.split("\n").map do |move|
      move_hash = {}
      parsed_move = move.split(" ")
      move_hash[:amount] = parsed_move[1].to_i
      move_hash[:origin] = parsed_move[3].to_i
      move_hash[:destination] = parsed_move[5].to_i
      move_hash
    end.to_a
    puts @moves
  end
end
