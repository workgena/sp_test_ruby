# frozen_string_literal: true

class CliViewsFormatter
  def initialize(visit_collection)
    @collection = visit_collection
  end

  def print
    @collection.each do |v|
      printf "  %-20s %-4s visits\n", v.url, v.views_count
    end
  end
end
