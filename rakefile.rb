# Automated tests.
#
# Command line examples:
# bundle exec rake run_test[td]
# bundle exec rake run_test[td,"-t olx_pesquisa"]

# require 'rake/log_clear_tasks'
require 'rspec/core/rake_task'
require './lib/rake/rake_utils.rb'
# Rake::LogClearTasks.new

task default: [:run_test]
################################################################################
# Test Runner Task
#
RSpec::Core::RakeTask.new(:run_test, :test_area, :tags) do |t, param|
  ENV['test_area'] = RakeUtils.parse_test_area param[:test_area]
  t.verbose = false
  t.rspec_opts = "-p --require './spec/spec_helper.rb'"
end

RSpec::Core::RakeTask.new(:olx_test) do |t|
  ENV['test_area'] = RakeUtils.parse_test_area 'td'
  t.verbose = false
  t.rspec_opts = "-p --require './spec/spec_helper.rb'"
end

################################################################################
# RSpec Dry Run Task
#
RSpec::Core::RakeTask.new(:dry_run) do |t|
  ENV['test_area'] = 'teste_olx'
  t.rspec_opts = "--require './spec/spec_helper.rb' --dry-run"
end