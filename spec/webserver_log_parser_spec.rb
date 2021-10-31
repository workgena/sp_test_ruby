# frozen_string_literal: true

require 'spec_helper'

require 'webserver_log_parser'

describe WebserverLogParser do
  let(:parser) do
    file = File.open('./spec/fixtures/example_webserver.log')
    described_class.new(file)
  end

  it '.by_views_count' do
    result = parser.by_views_count

    expect(result.map(&:url)).to eq(['/contact', '/help_page/1', '/home'])
  end

  it '.by_unique_views_count' do
    result = parser.by_unique_views_count

    expect(result.map(&:url)).to eq(['/help_page/1', '/home', '/contact'])
  end

  it 'raise error when file content is invalid' do
    file = File.open('./spec/fixtures/invalid.log')

    expect { described_class.new(file) }.to raise_error('Wrong format, expect webserver log')
  end
end
