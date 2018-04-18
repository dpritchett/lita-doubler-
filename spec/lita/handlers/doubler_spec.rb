require 'spec_helper'

describe Lita::Handlers::Doubler, lita_handler: true do
  let(:robot) { Lita::Robot.new(registry) }

  subject { described_class.new(robot) }

  # START:route
  describe 'routing' do
    it { is_expected.to route('Lita double 2') }
    it { is_expected.to route('Lita double    22') }
    it { is_expected.to route('Lita doUble 4') }

    it { is_expected.to_not route('Lita double two') }
    it { is_expected.to_not route('Lita double 1e4') }
  end
  # END:route

  describe 'functionality' do
    # START:unit_test
    describe ':double_number' do
      let(:n) { rand(1..100) }

      it 'returns double the input' do
        actual = subject.double_number n
        expected = n * 2

        expect(actual).to eq(expected)
      end
    end
    # END:unit_test

    # START:integration_test
    it 'doubles numbers when asked to' do
      send_message 'Lita double 2'
      expect(replies.last).to eq('2 + 2 = 4')
    end
    # END:integration_test
  end
end
