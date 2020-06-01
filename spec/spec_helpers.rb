# frozen_string_literal: true

require 'bundler/setup'
require 'bootstrap4jekyll'
require 'fileutils'
require 'jekyll'

# The directory where the tests shall happen.
TEST_DIR = File.dirname(__FILE__)
# A temporary directory to store the test results.
TMP_DIR  = File.expand_path('../tmp', TEST_DIR)
# A predefined directory that stores the fixture files.
FIX_DIR  = File.expand_path('./fixtures', TEST_DIR)

# Define helper methods for the RSpec test framework.
# see: [RSpec documentation](https://relishapp.com/rspec/rspec-core/docs/helper-methods/define-helper-methods-in-a-module)
module SpecHelpers
  # Returns a path in the temporary directory.
  # @param [Array<String>] sub_dirs a sequence of subdirectory or file names.
  # @return [String] a path in the temp directory with the given subdirectories joined together.
  def tmp_dir(*sub_dirs)
    File.join(TMP_DIR, *sub_dirs)
  end
  # Returns a path in the source directory.
  # @param [String] file_name optionally, the name of the file.
  # @return [String] a path in the source directory.
  def source_dir(*file_name)
    tmp_dir('source', *file_name)
  end
  # Returns a path in the destination directory.
  # @param [String] file_name optionally, the name of the file.
  # @return [String] a path in the destination directory.
  def dest_dir(*file_name)
    tmp_dir('dest', *file_name)
  end

  # Create source and destination directories.
  def init_source_and_dest
    FileUtils.mkdir_p source_dir
    FileUtils.rm_rf dest_dir
  end

  # Returns the path of a fixture file.
  # @param [String] fixture_file_name the name of an existing fixture file.
  # @return [String] the path of the given fixture file.
  def fixture_path(fixture_file_name)
    File.expand_path fixture_file_name, FIX_DIR
  end

  # Add a fixture file to the source directory
  # @param [String] fixture the name of the file.
  def add_fixture_to_source(fixture)
    FileUtils.cp fixture_path(fixture), source_dir(fixture)
  end

  # Calls  Jekyll::Site.new().
  # This simulates the jekyll build for our test purpose.
  def new_jekyll_site(opts = {})
    defaults = Jekyll::Configuration::DEFAULTS
    opts = opts.merge(
        'source'      => source_dir,
        'destination' => dest_dir,
    )
    conf = Jekyll::Utils.deep_merge_hashes(defaults, opts)
    Jekyll::Site.new(conf)
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  # Use rspec-expectation with "expect syntax"
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include SpecHelpers
end
