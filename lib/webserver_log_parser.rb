# frozen_string_literal: true

require_relative './visit_collection'

class WebserverLogParser
  attr_accessor :collection

  def initialize(file)
    @collection = VisitCollection.new

    file.each_line do |row|
      url, ip_addr = row.split
      raise 'Wrong format, expect webserver log' if url.nil? || ip_addr.nil?

      @collection.add_visit(url, ip_addr)
    end
  end

  def sort_by(column = :views_count)
    @collection
      .sort_by(&column)
      .reverse
  end
end
