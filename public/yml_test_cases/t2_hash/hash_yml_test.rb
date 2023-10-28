require 'pry'
require 'yaml'
#binding.pry

data= YAML.load_file('hash.yml')
#binding.pry

# Initialize arrays to separate the data
string_data = []
integer_data = []

# Iterate through the hash and separate the data
data.each do |key, value|
  if value.is_a?(String)
    string_data << "#{key}: #{value}"
  elsif value.is_a?(Integer)
    integer_data << "#{key}: #{value}"
  end
end

#binding.pry
# Print the string data
puts "String Data: #{string_data }"

  
#binding.pry
# Print the integer data
puts "Integer Data: #{integer_data }"
