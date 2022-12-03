# frozen_string_literal: true

require 'rspec'
require 'tournament_tally'

describe TournamentTally do
  let(:input) do
    <<~HEREDOC
      A Y
      B X
      C Z
    HEREDOC
  end
  describe '#tally_game_points_part_one' do
    subject { described_class.new(input).tally_game_points_part_one }

    it { is_expected.to eq(15) }

    context 'given one match' do
      let(:input) { "#{opponent_move} #{my_move}" }

      context 'playing paper' do
        let(:my_move) { 'Y' }
        context 'lose to scissors' do
          let(:opponent_move) { 'C' }

          it { is_expected.to eq(2) }
        end

        context 'draw to paper' do
          let(:opponent_move) { 'B' }

          it { is_expected.to eq(5) }
        end

        context 'win to rock' do
          let(:opponent_move) { 'A' }

          it { is_expected.to eq(8) }
        end
      end

      context 'playing scissors' do
        let(:my_move) { 'Z' }
        context 'draw to scissors' do
          let(:opponent_move) { 'C' }

          it { is_expected.to eq(6) }
        end

        context 'win to paper' do
          let(:opponent_move) { 'B' }

          it { is_expected.to eq(9) }
        end

        context 'lose to rock' do
          let(:opponent_move) { 'A' }

          it { is_expected.to eq(3) }
        end
      end
    end
  end

  describe '#tally_game_points_part_two' do
    subject { described_class.new(input).tally_game_points_part_two }

    it { is_expected.to eq(12) }

    context 'given one match' do
      let(:input) { "#{opponent_move} #{game_outcome}" }

      context 'game is a draw' do
        let(:game_outcome) { 'Y' }

        context 'to scissors' do
          let(:opponent_move) { 'C' }

          it { is_expected.to eq(6) }
        end

        context 'to paper' do
          let(:opponent_move) { 'B' }

          it { is_expected.to eq(5) }
        end

        context 'to rock' do
          let(:opponent_move) { 'A' }

          it { is_expected.to eq(4) }
        end
      end

      context 'you win' do
        let(:game_outcome) { 'Z' }
        context 'to scissors' do
          let(:opponent_move) { 'C' }

          it { is_expected.to eq(7) }
        end

        context 'to paper' do
          let(:opponent_move) { 'B' }

          it { is_expected.to eq(9) }
        end

        context 'to rock' do
          let(:opponent_move) { 'A' }

          it { is_expected.to eq(8) }
        end
      end
    end
  end
end
