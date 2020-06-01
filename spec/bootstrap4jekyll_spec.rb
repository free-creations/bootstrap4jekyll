# frozen_string_literal: true

require 'spec_helpers'

RSpec.describe Bootstrap4jekyll do

  let(:jekyll_config) { {} }
  let(:stylesheet) { dest_dir('style.css') }

  before(:each) do
    init_source_and_dest
    add_fixture_to_source 'style.scss'
    new_jekyll_site(jekyll_config).process
  end



  it 'outputs the stylesheet' do
    expect(File.exist?(stylesheet)).to be(true)
  end
end
