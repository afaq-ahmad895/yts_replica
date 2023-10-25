require 'pry'
require "awesome_print"
require 'yaml'

data = YAML.load_file('nested_hash_array.yml')

data['schools'].each_with_index do |school,index|
    puts "#{index + 1}#{index == 0 ? 'st' : 'nd'} school name: #{school['name']}"
    sum = 0
    school['classes'].each do |klass|
    # Track total students
    if klass['students'].is_a?(Array)
    sum += klass['students'].length
  end
#total students in each class.
puts "List of Classes (total #{sum} students):"
subject = klass['subject']
students = klass['students'].length
  
puts "- #{subject} (#{students})"

end





end
