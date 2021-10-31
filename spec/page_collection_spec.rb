# frozen_string_literal: true

require 'spec_helper'
require 'page_collection'

describe PageCollection do
  subject { described_class.new }

  describe '.upsert_page' do
    it 'creates new Page-model with visits equal to 1(one)' do
      collection = subject.upsert_page('/home', '184.123.665.067')

      expect(collection[0]).to have_attributes(
        url: '/home',
        ip_addresses: ['184.123.665.067'],
        views_count: 1,
        views_count_unique: 1
      )
    end

    it 'updates existing Page by URL, increate visit counter' do
      subject.upsert_page('/home', '192.168.1.1')
      collection = subject.upsert_page('/home', '192.168.1.2')

      expect(collection.count).to eq(1)

      expect(collection[0]).to have_attributes(
        url: '/home',
        ip_addresses: ['192.168.1.1', '192.168.1.2'],
        views_count: 2,
        views_count_unique: 2
      )
    end

    it 'updates existing Page by URL, increate visit counter but not unique counter' do
      subject.upsert_page('/home', '192.168.1.1')
      collection = subject.upsert_page('/home', '192.168.1.1')

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
