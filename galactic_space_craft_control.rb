# frozen_string_literal: true

module Chandrayaan3
  class GalacticSpaceCraftControl
    attr_accessor :x, :y, :z, :direction, :instructions, :hash

    def initialize(x, y, z, initial_direction, instructions)
      return unless valid_inputs?(initial_direction, instructions)

      @instructions = instructions
      set_position(x, y, z)
      set_direction(initial_direction.downcase)
      set_movement_hash
    end

    # Determine the movement based on the current direction and update position
    def move(type)
      coordinates = @hash[@direction.to_sym][:move_forward]
      movement = type == 'f' ? coordinates : coordinates.transform_values { |value| -value }
      set_position(@x + movement[:x], @y + movement[:y], @z + movement[:z])
    end

    # Determine the new direction based on the turn instruction
    def turn(element)
      direction = element == 'l' ? @hash[@direction.to_sym][:turn_left] : @hash[@direction.to_sym][:turn_right]
      set_direction(direction)
    end

    # Define the movement hash for each direction
    def set_movement_hash
      @hash = {
        n: { turn_left: 'w', turn_right: 'e', move_forward: { x: 0, y: 1, z: 0 } },
        s: { turn_left: 'e', turn_right: 'w', move_forward: { x: 0, y: -1, z: 0 } },
        e: { turn_left: 'n', turn_right: 's', move_forward: { x: 1, y: 0, z: 0 } },
        w: { turn_left: 's', turn_right: 'n', move_forward: { x: -1, y: 0, z: 0 } },
        u: { turn_left: 'n', turn_right: 's', move_forward: { x: 0, y: 0, z: 1 } },
        d: { turn_left: 's', turn_right: 'n', move_forward: { x: 0, y: 0, z: -1 } }
      }
    end

    # Set the direction
    def set_direction(direction)
      @direction = direction
      puts "Current Direction: #{@direction}"
    end

    # Set the position
    def set_position(x, y, z)
      @x, @y, @z = x, y, z
      puts "Current Position: X #{@x}, y: #{@y}, z: #{@z}"
    end

    # Validate input parameters
    def valid_inputs?(direction, instructions)
      allowed_directions = %w[n e w s u d]
      allowed_instructions = %w[f b l r u d]

      unless allowed_directions.include?(direction)
        puts 'Invalid Initial Direction'
        return false
      end

      unless instructions.all? { |input| allowed_instructions.include?(input) }
        puts 'Invalid Commands'
        return false
      end
      true
    end
  end
end

# Chandrayaan3::GalacticSpaceCraftControl.new(0, 0, 0, 'n', %w[f r u b l])
