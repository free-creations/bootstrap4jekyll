# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Bootstrap4jekyll do
  it 'has a version number' do
    expect(Bootstrap4jekyll::VERSION).not_to be nil
  end

  it 'has access to the helper methods defined in the module' do
    expect(help).to be(:available)
  end

  # let(:stylesheet) { dest_dir('style.css') }
  #
  #
  # it 'outputs the stylesheet' do
  #   expect(File.exist?(stylesheet)).to eql(true)
  # end
end
