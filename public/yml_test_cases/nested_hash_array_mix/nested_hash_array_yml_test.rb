require 'pry'
require "awesome_print"
require 'yaml'

data = YAML.load_file('nested_hash_array.yml')

i = 1
subject_in_one_school = []
teacher_in_one_school = []

data['schools'].each do |school|

  puts "#{i}:school name: #{school['name']}"
  i += 1
  puts "List of Classes (total students):"

  teachers_classes = {}
  subject_all = teacher_all = []

  school['classes'].each do |klass|
    puts "- #{klass['subject']} (#{klass['students'].length})"

    teacher = klass['teacher']
    teacher_all << teacher
    
    subject = klass['subject']
    subject_all << subject

    if teachers_classes[teacher]
      teachers_classes[teacher] << subject
    else
      teachers_classes[teacher] = [subject]
    end

  end

    subject_in_one_school << subject_all
    teacher_in_one_school << teacher_all

    teach_in_multiple = teachers_classes.select { |key, value| value.count > 1 }
    puts teach_in_multiple.keys.join(", ") + " is Teaching:" + " [#{teach_in_multiple.values.uniq.join(", ")}]"
end

  puts "subjects offered in 1st school but not in other."
  school1 = subject_in_one_school[0] - subject_in_one_school[1]
  puts "- #{school1.join}"

  puts "subjects offered in 2nd school but not in other."
  school2= subject_in_one_school[1] - subject_in_one_school[0]
  puts "- #{school2.join}"

  puts "Teacher is teaching more than one school"
  unique_teacher =  teacher_in_one_school[0] & teacher_in_one_school[1]
  puts "- #{unique_teacher.join}"
