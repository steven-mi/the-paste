# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %w(app lib config test spec features) \
#  .select{|d| Dir.exists?(d) ? d : UI.warning("Directory #{d} does not exist")}

## Note: if you are using the `directories` clause above and you are not
## watching the project directory ('.'), then you will want to move
## the Guardfile to a watched dir and symlink it back, e.g.
#
#  $ mkdir config
#  $ mv Guardfile config/
#  $ ln -s config/Guardfile .
#
# and, you'll have to watch "config/Guardfile" instead of "Guardfile"

guard 'annotate' do
  watch('db/schema.rb')

  # Uncomment the following line if you also want to run annotate anytime
  # a model file changes
  #watch( 'app/models/**/*.rb' )

  # Uncomment the following line if you are running routes annotation
  # with the ":routes => true" option
  #watch( 'config/routes.rb' )
end

guard :bundler do
  require 'guard/bundler'
  require 'guard/bundler/verify'
  helper = Guard::Bundler::Verify.new

  files = ['Gemfile']
  files += Dir['*.gemspec'] if files.any? {|f| helper.uses_gemspec?(f)}

  # Assume files are symlinked from somewhere
  files.each {|file| watch(helper.real_path(file))}
end

guard :minitest do
  # with Minitest::Unit
  watch(%r{^test/(.*)\/?test_(.*)\.rb$})
  watch(%r{^lib/(.*/)?([^/]+)\.rb$}) {|m| "test/#{m[1]}test_#{m[2]}.rb"}
  watch(%r{^test/test_helper\.rb$}) {'test'}

  # with Minitest::Spec
  # watch(%r{^spec/(.*)_spec\.rb$})
  # watch(%r{^lib/(.+)\.rb$})         { |m| "spec/#{m[1]}_spec.rb" }
  # watch(%r{^spec/spec_helper\.rb$}) { 'spec' }

  # Rails < 4
  watch(%r{^app/controllers/(.*)\.rb$}) {|m| "test/functional/#{m[1]}_test.rb"}
  watch(%r{^app/helpers/(.*)\.rb$}) {|m| "test/helpers/#{m[1]}_test.rb"}
  watch(%r{^app/models/(.*)\.rb$}) {|m| "test/unit/#{m[1]}_test.rb"}
end

guard :rubocop do
  watch(%r{.+\.rb$})
  watch(%r{(?:.+/)?\.rubocop(?:_todo)?\.yml$}) {|m| File.dirname(m[0])}
end