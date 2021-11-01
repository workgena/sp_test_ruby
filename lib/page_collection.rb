# frozen_string_literal: true

require 'forwardable'
require_relative './page'

class PageCollection
  extend Forwardable
  def_delegators :@collection, :sort_by, :reverse, :values

  def initialize
    @collection = {}
  end

  def upsert_page(url, ip_addr)
    page = find(url)
    if page
      page.add_ip_addr(ip_addr)
    else
      insert_page(url, ip_addr)
    end

    @collection
  end

  private

  def find(url)
    @collection[url]
  end

  def insert_page(url, ip_addr)
    @collection[url] = Page.new(url, ip_addr)
  end
end
