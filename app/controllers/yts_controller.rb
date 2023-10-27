require 'pry'
require "awesome_print"
require 'yaml'

data = YAML.load_file('nested_hash_array.yml')
teachers1 = []
teachers2 = []

data['schools'].each_with_index do |school,index|
  puts "school name: #{school['name']}"
  teachers_classes = {}
  puts "List of Classes (total students):"
  school['classes'].each do |klass|
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

puts

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
