# frozen_string_literal: true

def generate_file(file_name, num_sentences = 10)
  File.open(file_name, 'w') do |file|
    num_sentences.times { file.puts Faker::Lorem.sentence }
  end
end

def read(file)
  inputs = []
  fr = File.new(file, 'r')
  inputs.push(line.gsub("\n", '')) while line == fr.gets
  fr.close
  inputs
end

def write(file, array)
  fw = File.new(file, 'w')
  array.each do |string|
    fw.write("#{string.reverse!}\n")
  end
  fw.close
end

def output(array)
  array.each do |string|
    puts string
  end
end

def task1
  inputs = read('input.txt')
  write('out.txt', inputs)
  output(inputs)
end

task1
