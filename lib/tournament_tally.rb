# frozen_string_literal: true

# TournamentTally is for {https://adventofcode.com/2022/day/2 the 2nd day of Advent of Code 2022}.
# The problem was to parse a list of pairs of characters to get a score for a paper, rocks, scissors tourney.
# @author Dean110
class TournamentTally
  # String representing the moves and outcomes of a paper, rock, scissors tourney.
  # @return [String] the input from the day two puzzle.
  attr_reader :input

  # @param input [String] the day two problem input.
  def initialize(input)
    @input = input
  end

  # @return [Integer] The sum of all matches using moves from each line.
  def tally_game_points_part_one
    games.map do |game|
      score game.split(' ').map(&:ord)
    end.sum
  end

  # @return [Integer] The sum of all matches using opponent move and game outcome from each line.
  def tally_game_points_part_two
    games.map do |game|
      moves = determine_moves game.split(' ')

      score moves
    end.sum
  end

  private

  def determine_moves(game)
    my_move = compute_move_values(game[1], game[0])
    my_move = adjust_move_values(my_move)
    [game[0], my_move + 23]
  end

  def adjust_move_values(my_move)
    my_move -= 3 if my_move.equal? 68
    my_move += 3 if my_move == 64
    my_move
  end

  def compute_move_values(game_result, opp_move)
    case game_result
    when 'X'
      opp_move.ord - 1
    when 'Y'
      opp_move.ord
    else
      opp_move.ord + 1
    end
  end

  def games
    input.split("\n")
  end

  def score(moves)
    move_score = compute_move_score(moves[1])

    outcome_score = compute_outcome(moves)
    outcome_score + move_score
  end

  def compute_outcome(moves)
    moves[1] -= 23
    moves[0] = moves[0].ord

    my_move, opp_move = offset_move_values(moves[1], moves[0])

    determine_outcome_score(my_move, opp_move)
  end

  def determine_outcome_score(my_move, opp_move)
    case my_move - opp_move
    when 0
      3
    when 1
      6
    else
      0
    end
  end

  def offset_move_values(my_move, opp_move)
    my_move += 3 if opp_move - my_move == 2
    opp_move += 3 if my_move - opp_move == 2
    [my_move, opp_move]
  end

  def compute_move_score(move)
    case move
    when 'X'.ord
      1
    when 'Y'.ord
      2
    else
      3
    end
  end
end
