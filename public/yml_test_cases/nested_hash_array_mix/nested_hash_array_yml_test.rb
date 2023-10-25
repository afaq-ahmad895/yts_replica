require 'pry'
require "awesome_print"
require 'yaml'

data = YAML.load_file('nested_hash_array.yml')
teachers1 = []
teachers2 = []

data['schools'].each_with_index do |school,index|
    puts "#{index + 1}#{index == 0 ? 'st' : 'nd'} school name: #{school['name']}"

  total_students = school['classes'].sum { |klass| klass['students'].length }
  #sum = 0

  teachers_classes = {}

   puts "List of Classes (total #{total_students} students):"
  school['classes'].each do |klass|
  #Track total students
  # if klass['students'].is_a?(Array)
  # sum += klass['students'].length
  # end

  #total students in each class.
  subject = klass['subject']
  students = klass['students'].length
  puts "- #{subject} (#{students})"

#teacher link more than one class.
    teacher = klass['teacher']
    subject = klass['subject']
    
    if teachers_classes[teacher]
      teachers_classes[teacher] << subject
    else
      teachers_classes[teacher] = [subject]
    end

teachers_classes.each do |teacher, classes|
    if classes.length > 1
      puts "Mr.#{teacher} is Teaching: [#{classes.join(', ')}]"
    end
  end
#puts "List of Classes (total #{sum} students):"
  end 
    


end 


#Commmon tacher linkedd more than one scchool
data['schools'][0]['classes'].each do |klass|
  teachers1 << klass['teacher']
end

data['schools'][1]['classes'].each do |klass|
  teachers2 << klass['teacher']
end

common_teacher = teachers1 & teachers2

if common_teacher.any?
  puts "List of Teachers Teaching in more then One School:"
  puts "- #{common_teacher.first}"
else
  puts "No common teacher found."
end
