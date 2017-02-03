#!/usr/bin/env ruby
require 'csv'

# Deliverables:
# A repo containing at least:
# data_parser.rb

#A Class "Delivery", which will represent the rows of that CSV file
# Requirements
# Define and use your Delivery class to represent each shipment
# I should be able to run ruby data_parser.rb and see the output on the screen

class Delivery
  attr_accessor :destination, :whatshipped, :number_of_crates, :money_we_made, :pilot,
  :bonus
  def initialize(destination:, what_got_shipped:, number_of_crates:, money_we_made:, pilot:, bonus: )
      @destination = destination
      @what_got_shipped = what_got_shipped
      @number_of_crates = number_of_crates.to_i
      @money_we_made = money_we_made.to_i
      @pilot = pilot
      @bonus = bonus

      # def pilot_bonus(destination, money_we_made)
      #   #pseudo-code pilot bonus = (.1 * :money_we_made)  *IF* pilot flies to destination
      #
      # planet_express.each do |youflyit|
      #   case whichpilot
      #   when "Earth"
      #     pilot = "Fry"
      #   when "Uranus"
      #     pilot = "Bender"
      #   when "Mars"
      #     pilot = "Amy"
      #   else
      #     pilot = "Leela"
      #   end


  end
end

# data = CSV.foreach("students.csv", headers: true, header_converters: :symbol)

# Explorer Mode

planet_express = []

CSV.foreach("planet_express_logs.csv", headers: true, header_converters:
:symbol, :pilot, :bonus) do |row|
  planet_express << Delivery.new(row)
    if
end

# Good news Rubyists!
# We have a week of records tracking what we shipped at Planet Express. I need you to answer a few questions for Hermes.

# How much money did we make this week?
total_money_we_made = 0
puts planet_express.collect(&:money_we_made).reduce(:+)
puts total_money_we_made

# How much of a bonus did each employee get? (bonuses are paid to employees who pilot the Planet Express)
# They get a bonus of 10% of the money for the shipment as the bonus

# Destination	What got shipped	Number of crates	Money we made
# Earth	Hamburgers	150	30000 - Fry
# Moon	Tacos	33	44500 - Leela
# Earth	Movies	34	5000 - Fry
# Mars	BBQ Sauce	999	15000 - Amy
# Uranus	Whiskey	1000	345600 - Bender
# Jupiter	Books	10	3451 - Leela
# Pluto	Beer	100	2344 - Leela
# Uranus	Pizza	66	10000 - Bender
# Saturn	Pizza	26	1000 - Leela
# Mercury	Pizza	36	80000 - Leela


# How many trips did each employee pilot?
# Different employees have favorite destinations they always pilot to
#
# Fry - pilots to Earth (because he isn't allowed into space)
# Amy - pilots to Mars (so she can visit her family)
# Bender - pilots to Uranus (teeheee...)
# Leela - pilots everywhere else because she is the only responsible one

#
# Adventure Mode
#
# Define a class "Parse", with a method parse_data, with an argument file_name that handles output to the console

class Parse
  def parse_data(file_name)
  end
end

# How much money did we make broken down by planet? ie. how much did we make shipping to Earth? Mars? Saturn? etc.

# Epic Mode
#
# No puts or print's in any method
# No methods longer than 10 lines long
# Make data_parser.rb executable with a command line argument of the file name
# ./data_parser.rb planet_express_logs.csv
#
# Legendary Mode
#
# All the above questions should have corresponding class methods in Parse
# If the script is called with a report argument (as in: ./data_parser.rb planet_express_logs.csv
# report), the script saves a new CSV file in the #current directory with payroll
# information in the format of: Pilot, Shipments, Total Revenue, Payment
