# frozen_string_literal: true

require 'rspec'
require 'assignment_coordinator'

describe AssignmentCoordinator do
  let(:input) do
    <<~HEREDOC
      2-4,6-8
      2-3,4-5
      5-7,7-9
      2-8,3-7
      6-6,4-6
      2-6,4-8
    HEREDOC
  end
  describe '#tally_duplicate_assignments' do
    subject { described_class.new(input).tally_duplicated_assignments }

    it { is_expected.to eq 2 }

    context 'given one set of overlapping assignments' do
      let(:input) { '2-8,3-7' }

      it { is_expected.to eq 1 }
    end

    context 'given three sets, one overlapping' do
      let(:input) do
        <<~HEREDOC
          12-80,12-81
          13-94,14-93
          9-9,10-61
        HEREDOC
      end

      it { is_expected.to eq 2 }
    end
  end

  describe '#tally_overlapping_assignments' do
    subject { described_class.new(input).tally_overlapping_assignments }

    it { is_expected.to eq 4 }

    context 'given one set of overlapping assignments' do
      let(:input) { '2-8,3-7' }

      it { is_expected.to eq 1 }
    end

    context 'given four sets, one overlapping' do
      let(:input) do
        <<~HEREDOC
          12-80,12-81
          13-94,14-93
          9-9,10-61
          10-14,14-20
        HEREDOC
      end

      it { is_expected.to eq 3 }
    end
  end
end
