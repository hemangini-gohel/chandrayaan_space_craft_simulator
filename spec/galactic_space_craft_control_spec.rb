# frozen_string_literal: true

require_relative '../galactic_space_craft_control'

RSpec.describe Chandrayaan3::GalacticSpaceCraftControl do

  describe '#initialize' do
    context 'with valid initial direction and instructions' do
      it 'initializes the spacecraft correctly and apply commands' do
        spacecraft = described_class.new(0, 0, 0, 'n', %w[f r u b l])
        expect(spacecraft.x).to eq(0)
        expect(spacecraft.y).to eq(1)
        expect(spacecraft.z).to eq(-1)
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

  describe '#execute_commands' do
    it 'executes the commands correctly' do
      spacecraft = described_class.new(0, 0, 0, 'n', %w[f r u b l])
      expect(spacecraft.x).to eq(0)
      expect(spacecraft.y).to eq(1)
      expect(spacecraft.z).to eq(-1)
      expect(spacecraft.direction).to eq('n')
    end
  end

  describe '#move' do
    context 'when moving forward' do
      it 'updates the position correctly' do
        spacecraft = described_class.new(0, 0, 0, 'n', [])
        spacecraft.move('f')
        expect(spacecraft.x).to eq(0)
        expect(spacecraft.y).to eq(1)
        expect(spacecraft.z).to eq(0)
      end
    end

    context 'when moving backward' do
      it 'updates the position correctly' do
        spacecraft = described_class.new(0, 0, 0, 'n', [])
        spacecraft.move('b')
        expect(spacecraft.x).to eq(0)
        expect(spacecraft.y).to eq(-1)
        expect(spacecraft.z).to eq(0)
      end
    end
  end

  describe '#turn' do
    context 'when turning left' do
      it 'updates the direction correctly' do
        spacecraft = described_class.new(0, 0, 0, 'n', [])
        spacecraft.turn('l')
        expect(spacecraft.direction).to eq('w')
      end
    end

    context 'when turning right' do
      it 'updates the direction correctly' do
        spacecraft = described_class.new(0, 0, 0, 'n', [])
        spacecraft.turn('r')
        expect(spacecraft.direction).to eq('e')
      end
    end
  end

  describe '#set_movement_hash' do
    it 'sets the movement hash' do
      spacecraft = described_class.new(0, 0, 0, 'n', [])
      spacecraft.set_movement_hash
      expect(spacecraft.instance_variable_get(:@hash)).to eq({
        n: { turn_left: 'w', turn_right: 'e', move_forward: { x: 0, y: 1, z: 0 } },
        s: { turn_left: 'e', turn_right: 'w', move_forward: { x: 0, y: -1, z: 0 } },
        e: { turn_left: 'n', turn_right: 's', move_forward: { x: 1, y: 0, z: 0 } },
        w: { turn_left: 's', turn_right: 'n', move_forward: { x: -1, y: 0, z: 0 } },
        u: { turn_left: 'n', turn_right: 's', move_forward: { x: 0, y: 0, z: 1 } },
        d: { turn_left: 's', turn_right: 'n', move_forward: { x: 0, y: 0, z: -1 } }
      })
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
