# frozen_string_literal: true

module Formatter
  class Base
    def initialize(visit_collection)
      @collection = visit_collection
    end

    def print
      raise 'Need to be implemented'
    end
  end
end
