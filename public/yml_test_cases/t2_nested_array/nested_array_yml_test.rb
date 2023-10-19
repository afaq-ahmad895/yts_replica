require 'yaml'
require 'pry'
data = YAML.load_file('nested_array.yml')

puts "Enter a date between 1 and 28:"
date = gets.chomp.to_i

case date
when 1..28
  # Calculate the row and column index

  day_index = (date - 1) % 7   # Calculate the index for the day within a week (0 to 6)
                                
  week_index = (date - 1) / 7  # Calculate the index for the week within the month (0 to 4)

  day = data['february_2023'][week_index][day_index]   # Retrieve the day of the week from the 'february_2023' section of the data
  
  puts "February #{date}, 2023 is a #{day}"
else
  puts "Invalid date. Please enter a date between 1 and 28."
end
