# frozen_string_literal: true

require 'forwardable'
require_relative './visit'

class VisitCollection
  extend Forwardable
  def_delegators :@collection, :sort_by, :reverse

  def initialize
    @collection = []
  end

  def add_visit(url, ip_addr)
    visit = find(url)
    if visit
      visit.add_ip_addr(ip_addr)
    else
      insert(url, ip_addr)
    end

    @collection
  end

  private

  def find(url)
    @collection.find { |v| v.url == url }
  end

  def insert(url, ip_addr)
    @collection << Visit.new(url, ip_addr)
  end
end