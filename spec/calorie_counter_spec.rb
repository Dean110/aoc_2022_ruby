# frozen_string_literal: true

require 'rspec'
require 'calorie_counter'

describe CalorieCounter do
  let(:input) do
    <<~HEREDOC
      1000
      2000
      3000

      4000

      5000
      6000

      7000
      8000
      9000

      10000
    HEREDOC
  end

  describe '#highest_calorie_count' do
    subject { described_class.new(input).highest_calorie_count }

    it { is_expected.to eq 24_000 }

    context 'when given a single elf with a single value' do
      let(:input) { '1000' }

      it { is_expected.to eq 1000 }
    end

    context 'when given a single elf with multiple values' do
      let(:input) { "1000\n1000" }

      it { is_expected.to eq 2000 }
    end

    context 'when given two elves with multiple values' do
      let(:input) do
        <<~HEREDOC
          1000
          1000

          2000
          2000
        HEREDOC
      end

      it { is_expected.to eq 4000 }
    end
  end

  describe '#three_highest_calorie_counts_summed' do
    subject { described_class.new(input).three_highest_calorie_counts_summed }

    it { is_expected.to eq 45_000 }
  end
end
