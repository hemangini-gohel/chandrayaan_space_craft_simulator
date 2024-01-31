# frozen_string_literal: true

require_relative '../galactic_space_craft_control'

RSpec.describe Chandrayaan3::GalacticSpaceCraftControl do

  describe '#initialize' do
    context 'with valid initial direction and instructions' do
      it 'initializes the spacecraft correctly' do
        spacecraft = described_class.new(0, 0, 0, 'n', %w[f r u b l])
        expect(spacecraft.x).to eq(0)
        expect(spacecraft.y).to eq(0)
        expect(spacecraft.z).to eq(0)
        expect(spacecraft.direction).to eq('n')
      end
    end

    context 'with invalid initial direction' do
      it 'does not initialize the spacecraft' do
        expect { described_class.new(0, 0, 0, 'x', %w[f r u b l]) }.to output("Invalid Initial Direction\n").to_stdout
      end
    end

    context 'with invalid instructions' do
      it 'does not initialize the spacecraft' do
        expect { described_class.new(0, 0, 0, 'n', %w[f r u b x]) }.to output("Invalid Commands\n").to_stdout
      end
    end
  end

  describe '#set_direction' do
    it 'updates the direction' do
      spacecraft = described_class.new(0, 0, 0, 'n', [])
      expect { spacecraft.set_direction('e') }.to change { spacecraft.direction }.from('n').to('e')
    end
  end

  describe '#set_position' do
    it 'updates the position' do
      spacecraft = described_class.new(0, 0, 0, 'n', [])
      expect { spacecraft.set_position(1, 2, 3) }.to change { [spacecraft.x, spacecraft.y, spacecraft.z] }.from([0, 0, 0]).to([1, 2, 3])
    end
  end
  describe '#valid_inputs?' do
    context 'with valid inputs' do
      it 'returns true' do
        spacecraft = described_class.new(0, 0, 0, 'n', %w[f b l r u d])
        expect(spacecraft.valid_inputs?('n', %w[f b l r u d])).to eq(true)
      end
    end

    context 'with invalid initial direction' do
      it 'returns false' do
        spacecraft = described_class.new(0, 0, 0, 'n', %w[f b l r u d])
        expect(spacecraft.valid_inputs?('x', %w[f b l r u d])).to eq(false)
      end
    end

    context 'with invalid commands' do
      it 'returns false' do
        spacecraft = described_class.new(0, 0, 0, 'n', %w[f b l r u d])
        expect(spacecraft.valid_inputs?('n', %w[x y z])).to eq(false)
      end
    end
  end
end
