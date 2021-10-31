# frozen_string_literal: true

require 'spec_helper'
require 'visit_collection'

describe VisitCollection do
  subject { described_class.new }

  describe '.add_visit' do
    it 'adding new visit build Visit-model with counters equals to 1 (one)' do
      collection = subject.add_visit('/home', '184.123.665.067')

      expect(collection[0]).to have_attributes(
        url: '/home',
        ip_addresses: ['184.123.665.067'],
        views_count: 1,
        views_count_unique: 1
      )
    end

    it 'adding existing URL visit with new IP-address' do
      subject.add_visit('/home', '192.168.1.1')
      collection = subject.add_visit('/home', '192.168.1.2')

      expect(collection.count).to eq(1)

      expect(collection[0]).to have_attributes(
        url: '/home',
        ip_addresses: ['192.168.1.1', '192.168.1.2'],
        views_count: 2,
        views_count_unique: 2
      )
    end

    it 'adding existing URL visit with duplicated IP-address' do
      subject.add_visit('/home', '192.168.1.1')
      collection = subject.add_visit('/home', '192.168.1.1')

      expect(collection.count).to eq(1)

      expect(collection[0]).to have_attributes(
        url: '/home',
        ip_addresses: ['192.168.1.1', '192.168.1.1'],
        views_count: 2,
        views_count_unique: 1
      )
    end
  end
end
