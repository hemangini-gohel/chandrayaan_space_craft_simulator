# frozen_string_literal: true

require_relative 'lib/galactic_space_craft_control'

puts 'Enter values for initial position:'

puts 'Enter x coordinate'
x = gets.chomp.to_i

puts 'Enter y coordinate'
y = gets.chomp.to_i

puts 'Enter z coordinate'
z = gets.chomp.to_i

puts 'Enter initial direction (n/e/w/s/u/d):'
initial_direction = gets.chomp.downcase

puts 'Enter instructions (e.g., fblrud without spaces):'
instructions = gets.chomp.downcase.chars

# Pass your inputs here to test various scenarios
Chandrayaan3::GalacticSpaceCraftControl.new(x, y, z, initial_direction, instructions)
