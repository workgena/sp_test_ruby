# frozen_string_literal: true

require 'webserver_log_parser'

describe WebserverLogParser do
  let(:parser) do
    file = File.open('./spec/fixtures/example_webserver.log')
    described_class.new(file)
  end

  it 'returns zero' do
    expect(parser.stats).to eq(0)
  end
end
