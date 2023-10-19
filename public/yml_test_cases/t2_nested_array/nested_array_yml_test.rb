require 'yaml'
require 'pry'

#binding.pry
 data = YAML.load_file('nested_array.yml')


days_array = data['february_2023'].shift
remaining_arrays = data['february_2023']

puts "Enter a date between 1 and 28:"
number = gets.chomp.to_i

index_value = nil

remaining_arrays .each do |array|

    index_value = array.find_index(number)

   if index_value
    break  # No need to continue searching if found
  end
end

 if index_value
    day = days_array[index_value]
     puts "#{number} is present in the calendar data for February at index #{index_value}."
  puts "February #{number}, 2023 is a #{day}"
 
 else
   puts "#{number} is not present in the calendar data for February."
 end




