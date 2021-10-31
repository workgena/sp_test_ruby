# frozen_string_literal: true

class CliUniqueViewsFormatter
  def initialize(visit_collection)
    @collection = visit_collection
  end

  def print
    @collection.each do |v|
      printf "  %-20s %-4s unique views\n", v.url, v.views_count_unique
    end
  end
end
