#!/usr/bin/ruby
# frozen_string_literal: true

require './lib/webserver_log_reader'
require './lib/formatter/cli_by_views'
require './lib/formatter/cli_by_unique_views'

file = File.open(ARGV[0], 'r')

logs = WebserverLogReader.new(file)
by_views_count = logs.sort_by(:views_count)
views_count_unique = logs.sort_by(:views_count_unique)

puts '> list of webpages with most page views ordered from most pages views to less page views'
Formatter::CliByViews.new(by_views_count).print

puts "\n> list of webpages with most unique page views also ordered"
Formatter::CliByUniqueViews.new(views_count_unique).print
