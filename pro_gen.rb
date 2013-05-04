project_name = ARGV[0].to_s
project_path = ARGV[1].to_s

if project_name == '' || project_path == '' || !(File.directory? project_path) then
  puts 'Inputs error!'
  return -1;
end

puts "Generate project #{project_name} in #{project_path}"

current_path = Dir.pwd

Dir.chdir project_path
Dir.mkdir project_name
Dir.chdir project_name
project_full_path = Dir.pwd
Dir.mkdir 'include'
Dir.mkdir 'src'
Dir.mkdir 'test'
Dir.mkdir 'project'
Dir.chdir './test'
Dir.mkdir 'tools'
Dir.mkdir 'include'
Dir.mkdir 'src'
Dir.chdir './tools'
Dir.mkdir 'include'
Dir.mkdir 'lib'
Dir.chdir current_path

system "ruby cmake_gen.rb #{project_name} #{project_full_path}"
system "ruby build_gen.rb #{project_name} #{project_full_path}"

puts "Project generate OK !!!!!!!!!!!!!"

