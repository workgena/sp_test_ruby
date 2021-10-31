# frozen_string_literal: true

require './lib/webserver_log_parser'
require './lib/formatters/cli_views_formatter'
require './lib/formatters/cli_unique_views_formatter'

file = File.open(ARGV[0], 'r')

parser = WebserverLogParser.new(file)

puts '> list of webpages with most page views ordered from most pages views to less page views'
CliViewsFormatter.new(parser.by_views_count).print

puts

puts '> list of webpages with most unique page views also ordered'
CliUniqueViewsFormatter.new(parser.by_views_count).print
