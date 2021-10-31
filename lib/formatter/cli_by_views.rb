# frozen_string_literal: true

require_relative './base'

module Formatter
  class CliByViews < Base
    def print
      @collection.each do |v|
        printf "  %-20s %-4s visits\n", v.url, v.views_count
      end
    end
  end
end
