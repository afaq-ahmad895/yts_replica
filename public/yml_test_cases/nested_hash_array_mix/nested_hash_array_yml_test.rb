require 'pry'
require "awesome_print"
require 'yaml'

data = YAML.load_file('nested_hash_array.yml')
c = []
teachers1 = []
teachers2 = []

data['schools'].each_with_index do |school, index|
  teachers_classes = {}
  # Extract the students and classes for the current school
  students = school['classes'].flat_map { |klass| klass['students'] }
  classes = school['classes']

  puts "#{index + 1}#{index == 0 ? 'st' : 'nd'} school name: #{school['name']}"

  # Print information for each class
  puts "List of Classes (total #{classes.sum { |klass| klass['students'].length }} students):"
  classes.each do |klass|
    subject = klass['subject']
    students = klass['students'].length
    puts "- #{subject} (#{students})"
  end

  # Teachers teaching more than one class
  classes.each do |klass|
    teacher = klass['teacher']
    subject = klass['subject']

    if teachers_classes[teacher]
      teachers_classes[teacher] << subject
    else
      teachers_classes[teacher] = [subject]
    end
  end

  teachers_classes.each do |teacher, classes|
    if classes.length > 1
      puts "Mr.#{teacher} is Teaching: [#{classes.join(', ')}]"
    end
  end


  #unique subjects offered in one school but not in other.
  school_subjects = school['classes'].map { |klass| klass['subject'] }

  unique_subjects = school_subjects - (index == 0 ? data['schools'][1]['classes'].map { |klass| klass['subject'] }
  : data['schools'][0]['classes'].map { |klass| klass['subject'] })

  puts "subjects only offered in #{school['name']} school not in other:"
   unique_subjects.each do |subject|
     puts "- #{subject}"
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
