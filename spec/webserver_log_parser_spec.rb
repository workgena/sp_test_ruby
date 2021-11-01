# frozen_string_literal: true

require 'spec_helper'

require 'webserver_log_reader'

describe WebserverLogReader do
  let(:logs) do
    file = File.open('./spec/fixtures/example_webserver.log')
    described_class.new(file)
  end

  it '.sort_by views_count' do
    result = logs.sort_by(:views_count)

    expect(result.map(&:url)).to eq(['/contact', '/help_page/1', '/home'])
  end

  it '.sort_by views_count_unique' do
    result = logs.sort_by(:views_count_unique)

    expect(result.map(&:url)).to eq(['/help_page/1', '/home', '/contact'])
  end

  it 'raise error when file content is invalid' do
    file = File.open('./spec/fixtures/invalid.log')

    expect { described_class.new(file) }.to raise_error(Error::InvalidInput, 'Wrong format, expect webserver log')
  end
end
