# frozen_string_literal: true

class Page
  attr_reader :url,
              :ip_addresses,
              :views_count,
              :views_count_unique

  def initialize(url, ip_addr)
    @url = url
    @ip_addresses = [ip_addr]
    @views_count = 1
    @views_count_unique = 1
  end

  def add_ip_addr(ip_addr)
    @views_count_unique += 1 unless @ip_addresses.include?(ip_addr)
    @views_count += 1
    @ip_addresses << ip_addr
  end
end
