# cd /project/path
# rake test

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test*.rb']
end