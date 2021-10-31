# frozen_string_literal: true

require_relative './base'

module Formatter
  class CliByUniqueViews < Base
    def print
      @collection.each do |v|
        printf "  %-20s %-4s unique views\n", v.url, v.views_count_unique
      end
    end
  end
end
