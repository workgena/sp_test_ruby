# frozen_string_literal: true

require_relative './visit_collection'

class WebserverLogParser
  attr_accessor :file, :visit_collection

  def initialize(file)
    self.file = file
    visit_collection = VisitCollection.new

    file.each_line do |row|
      url, ip_addr = row.split

      visit_collection.add_visit(url, ip_addr)
    end
  end

  def stats
    # sort
    # output
    0
  end
end
