#!/usr/bin/env ruby
require 'csv'
require 'pry'

# Deliverables:
# A repo containing at least:
# data_parser.rb

#A Class "Delivery", which will represent the rows of that CSV file
# Requirements
# Define and use your Delivery class to represent each shipment
# I should be able to run ruby data_parser.rb and see the output on the screen

class Delivery
  attr_accessor :destination, :whatshipped, :number_of_crates, :money_we_made, :pilot, :bonus

  def initialize(destination:, what_got_shipped:, number_of_crates:, money_we_made:)
      @destination = destination
      @what_got_shipped = what_got_shipped
      @number_of_crates = number_of_crates.to_i
      @money_we_made = money_we_made.to_i
      @pilot = get_pilot
      @bonus = self.money_we_made * 0.1
  end

  # Different employees have favorite destinations they always pilot to
  #Grab the pilot and inject into array
  def get_pilot
    case destination
      # Fry - pilots to Earth (because he isn't allowed into space)
      when "Earth"
        "Fry"
      # Amy - pilots to Mars (so she can visit her family)
      when "Mars"
        "Amy"
      # Bender - pilots to Uranus (teeheee...)
      when "Uranus"
        "Bender"
      # Leela - pilots everywhere else because she is the only responsible one
      else
        "Leela"
    end
  end

end
# data = CSV.foreach("students.csv", headers: true, header_converters: :symbol)

# Explorer Mode

planet_express = []

CSV.foreach("planet_express_logs.csv", headers: true, header_converters:
:symbol) do |row|
  planet_express << Delivery.new(row)
end

# puts planet_express.count { |snafu| snafu.pilot == "Leela" }

### Raw Data for Reference ###
# Destination	What got shipped	Number of crates	Money we made   Pilot
# Earth	      Hamburgers	       150	            30000           Fry
# Moon	      Tacos	             33	              44500           Leela
# Earth	      Movies	           34	              5000            Fry
# Mars	      BBQ Sauce	         999	            15000           Amy
# Uranus	    Whiskey	           1000	            345600          Bender
# Jupiter	    Books	             10	              3451            Leela
# Pluto	      Beer	             100	            2344            Leela
# Uranus	    Pizza	             66	              10000           Bender
# Saturn	    Pizza	             26	              1000            Leela
# Mercury	    Pizza	             36	              80000           Leela

# Good news Rubyists!
# We have a week of records tracking what we shipped at Planet Express. I need you to answer a few questions for Hermes.

puts "How much money did we make this week?\n \n"

total_money_we_made = 0
puts planet_express.collect(&:money_we_made).reduce(:+)
puts total_money_we_made

#Create an array of pilots
pilot_array = planet_express.collect(&:pilot).uniq!

puts "How much of a bonus did each employee get? (Bonuses are paid to employees who pilot the Planet Express.)\n \n"
# They get a bonus of 10% of the money for the shipment as the bonus
# The bonus was calculated per trip on initialize. But not totaled per employee.
# Iterate through the pilots array. For each pilot, as long as they match the pilot in
# the planet_express array collect the bonus and add it
#
puts "Fry's bonus:"
pilot_bonus = []
pilot_bonus = planet_express.select{ |bonus| bonus.pilot.include? "Fry" }
puts "#{pilot_bonus.collect{|delivery| delivery.bonus}.inject(0){|sum, item| sum + item}}"

puts "Amy's bonus:"
pilot_bonus = planet_express.select{ |bonus| bonus.pilot.include? "Amy"}
puts "#{pilot_bonus.collect{|delivery| delivery.bonus}.inject(0){|sum, item| sum + item}}"

puts "Bender's bonus:"
pilot_bonus = planet_express.select{ |bonus| bonus.pilot.include? "Bender"}
puts "#{pilot_bonus.collect{|delivery| delivery.bonus}.inject(0){|sum, item| sum + item}}"

puts "Leela's bonus:"
pilot_bonus = planet_express.select{ |bonus| bonus.pilot.include? "Leela"}
puts "#{pilot_bonus.collect{|delivery| delivery.bonus}.inject(0){|sum, item| sum + item}}"

#Add a line
"\n"

#planet_express.each do |bonus|
#   if bonus.pilot == self.pilot
#     puts "#{bonus.pilot} and #{self.pilot} are the same!"
#   else
#     puts "#{bonus.pilot} and #{self.pilot} are different!"
#   end
#     #pilot.collect {|sum, delivery| sum += delivery.bonus})
# end

puts "How many trips did each employee pilot?\n"
  # fry_array, amy_array, bender_array, leela_array = []

puts "Fry's Trips:"
puts planet_express.count {|trip| trip.pilot.include? "Fry"}

puts "Amy's Trips:"
puts planet_express.count {|trip| trip.pilot.include? "Amy"}

puts "Bender's Trips:"
puts planet_express.count {|trip| trip.pilot.include? "Bender"}

puts "Leela's Trips:"
puts planet_express.count {|trip| trip.pilot.include? "Leela"}

binding.pry

  # planet_express.select do |pilot|
  #   case pilot
  #   when "Fry"
  #     fry_array << planet_express.pilot
  #     puts fry_array.inspect
  #   when "Amy"
  #     amy_array << planet_express.pilot
  #     puts amy_array.inspect
  #   when "Bender"
  #     bender_array << planet_express.pilot
  #     puts bender_array.inspect
  #   when "Leela"
  #     leela_array << planet_express.pilot
  #     puts leela_array.inspect
  #   end
  # end
  #
  # puts "Fry made:  #{fry_array.count} trips."
  # puts "Amy made: " + amy_array.count + " trips."
  # puts "Bender made: " + bender_array.count + " trips."
  # puts "Leela made:" + leela_array.count + " trips."

### Adventure Mode ###
# Define a class "Parse", with a method parse_data, with an argument file_name that handles output to the console

class Parse
  def parse_data(file_name)
  end
end

# How much money did we make broken down by planet? ie. how much did we make shipping to Earth? Mars? Saturn? etc.

### Epic Mode ###
# No puts or prints in any method
# No methods longer than 10 lines long
# Make data_parser.rb executable with a command line argument of the file name
# ./data_parser.rb planet_express_logs.csv

### Legendary Mode ###
# All the above questions should have corresponding class methods in Parse
# If the script is called with a report argument (as in: ./data_parser.rb planet_express_logs.csv
# report), the script saves a new CSV file in the #current directory with payroll
# information in the format of: Pilot, Shipments, Total Revenue, Payment
