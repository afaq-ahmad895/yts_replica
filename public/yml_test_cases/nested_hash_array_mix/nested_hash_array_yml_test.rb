require 'pry'
require 'yaml'

data= YAML.load_file('nested_hash_array.yml')


# Iterate through each school
data['schools'].each do |school|
  # Print the school's name
  puts "School Name: #{school['name']}"

 # Print the list of subjects offered in the current school
  puts "Subjects Offered in this school: #{school['classes'].map { |klass| klass['subject'] }.join(', ')}"

 # Extract and print the list of all classes in the current school
  puts "Classes: #{school['classes'].map { |klass| klass['subject'] }.join(', ')}"

end