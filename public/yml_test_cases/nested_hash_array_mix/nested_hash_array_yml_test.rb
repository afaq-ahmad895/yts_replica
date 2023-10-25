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


# Print school names.
data['schools'].each_with_index do |school,index|
puts "#{index + 1}#{index == 0 ? 'st' : 'nd'} school name: #{school['name']}"

#total_students = school['classes'].sum { |klass| klass['students'].length }

#sum of school students.
sum = 0
school['classes'].each do |klass|
  if klass['students'].is_a?(Array)
    sum += klass['students'].length
  end
end

#total students in wach class.
puts "List of Classes (total #{sum} students):"
school['classes'].each do |klass|
  subject = klass['subject']
  students = klass['students'].length
  
  puts "- #{subject} (#{students})"
end


#teacher link more than one class.
  teachers_classes = {}

  school['classes'].each do |klass|
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
teachers1 = []
teachers2 = []

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
