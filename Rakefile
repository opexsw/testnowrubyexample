require 'rubygems'
require 'bundler'
require 'bundler/setup'
require 'parallel_tests/tasks'
require 'cucumber/rake/task'

#
# require 'cucumber/rake/task'
Cucumber::Rake::Task.new(:features) do |features|
  features.cucumber_opts = "features -p selenium --format progress --format json --out=reports/is_report.json"
end
#
#
#
# Cucumber::Rake::Task.new(:features_ci) do |t|
#   t.profile = 'ci'
# end
#
# task :default => :features_ci


# Cucumber::Rake::Task.new(:features) do |t|
#   t.profile = 'ci'
# end
#
# task :default => :jenkin