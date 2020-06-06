# frozen_string_literal: true

require 'spec_helpers'

RSpec.describe Bootstrap4jekyll do
  let(:jekyll_config) { {} }
  let(:stylesheet) { dest_dir('style.css') }
  let(:output) { File.open(stylesheet).read }

  before do
    init_source_and_dest
    add_fixture_to_source 'style.scss'
    new_jekyll_site(jekyll_config).process
  end

  it 'produces a stylesheet file' do
    expect(File.exist?(stylesheet)).to be(true)
  end

  it 'produces a stylesheet file with the correct content' do
    regex = /Bootstrap v#{Regexp.escape(Bootstrap::VERSION)}/
    expect(output).to match(regex)
  end

  context 'when rendering assets' do
    context 'with no config' do
      it "doesn't render assets" do
        expect(assets_rendered?).not_to eql(true)
      end
    end

    context 'with a config' do
      context 'with assets enabled' do
        let(:jekyll_config) { { 'bootstrap' => { 'assets' => true } } }

        it 'renders assets' do
          expect(assets_rendered?).to be(true)
        end
      end

      context 'with assets disabled' do
        let(:jekyll_config) { { 'bootstrap' => { 'assets' => false } } }

        it "doesn't render assets" do
          expect(assets_rendered?).not_to eql(true)
        end
      end
    end
  end
end
