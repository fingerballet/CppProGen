require 'erb'

project_name = ARGV[0].to_s
project_path = ARGV[1].to_s

puts "Generate the build_test script of project #{project_name} in #{project_path}"

File.open('build_test.temp') do |src|
  template = ERB.new src.read

  build_test_script_path = File.join(project_path + '/project', "build_test.rb")
  File.open(build_test_script_path, 'w+') do |dest| 
    dest.write(template.result)
  end
end