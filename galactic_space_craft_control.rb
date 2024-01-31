# frozen_string_literal: true

module Chandrayaan3
  class GalacticSpaceCraftControl
    attr_accessor :x, :y, :z, :direction, :instructions

    def initialize(x, y, z, initial_direction, instructions)
      return unless valid_inputs?(initial_direction, instructions)

      @instructions = instructions
      set_position(x, y, z)
      set_direction(initial_direction.downcase)
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
