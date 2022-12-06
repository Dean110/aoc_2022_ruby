require 'rspec'
require 'supply_stacks'

describe SupplyStacks do
  describe '#move_crates' do
    subject { described_class.new(input).move_crates }

    let(:input) do
      <<~HEREDOC
            [D]    
        [N] [C]    
        [Z] [M] [P]
         1   2   3 
        
        move 1 from 2 to 1
        move 3 from 1 to 3
        move 2 from 2 to 1
        move 1 from 1 to 2
      HEREDOC
    end

    it { is_expected.to eq "MCD" }
  end
end
