require 'pry'
require 'yaml'

data= YAML.load_file('nested_hash_array.yml')


# Iterate through each school
data['schools'].each do |school|
  # Print the school's name
  puts "School Name: #{school['name']}"

 

end