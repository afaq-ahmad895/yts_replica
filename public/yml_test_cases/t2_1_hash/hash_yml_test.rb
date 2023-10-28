require 'pry'
require 'yaml'

data = YAML.load_file('hash.yml')

# Initialize hashes to separate the data
string_data = {}
integer_data = {}

# Iterate through the hash and separate the data
data.each do |key, value|
  if value.is_a?(String)
    string_data[key] = value
  elsif value.is_a?(Integer)
    integer_data[key] = value
  end
end

# Print the string data
puts "String Data:"
puts "#{string_data}"


# Print the integer data
puts "Integer Data:"
 puts "#{integer_data}"

