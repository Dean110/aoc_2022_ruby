# frozen_string_literal: true

require 'rspec'
require 'rucksack_scorer'

describe RucksackScorer do
  let(:input) do
    <<~HEREDOC
      vJrwpWtwJgWrhcsFMMfFFhFp
      jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
      PmmdzqPrVvPwwTWBwg
      wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
      ttgJtRGJQctTZtZT
      CrZsJsPPZsGzwwsLwLmpwMDw
    HEREDOC
  end

  describe '#score_all_rucksacks' do
    subject { described_class.new(input).score_all_rucksacks }

    it { is_expected.to eq 157 }
  end

  describe '#score_all_badeges' do
    subject { described_class.new(input).score_all_badges }

    it { is_expected.to eq 70 }
  end
end
