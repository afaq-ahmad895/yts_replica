require 'pry'
require 'yaml'
binding.pry

array = YAML.load_file('array.yml')
binding.pry

string_values = []
sum = 0

array.each do |element|
  if element.is_a?(String)
    string_values << element
  elsif element.is_a?(Integer)
    sum += element
  end
end

binding.pry

# Print the string values
puts "string values are: #{string_values}"


# Print the sum of integer values
puts "Sum of Integer Values: #{sum}"
