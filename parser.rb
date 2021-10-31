# frozen_string_literal: true

require './lib/webserver_log_parser'

file = File.open(ARGV[0], 'r')

parser = WebserverLogParser.new(file)

puts parser.stats
