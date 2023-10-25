require 'pry'
require "awesome_print"
require 'yaml'
# binding.pry
data= YAML.load_file('nested_hash_array.yml')
c = [] 

data['schools'].each_with_index do |school, index|

  students = []
  school['classes'].each do |klass|
    students += klass['students']
  end

 c += students 

 puts "#{index + 1}#{index == 0 ? 'st' : 'nd'} school name: #{school['name']}"

  puts "List of students(total #{students.length})->unique(#{students.uniq.length})"


end
puts "total students of both school: (#{c.length} students)->unique (#{c.uniq.length})"


puts "==================================================================================================="




