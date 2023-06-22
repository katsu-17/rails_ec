# frozen_string_literal: true

module CommonModule
  extend ActiveSupport::Concern

  module ClassMethods
    def column_symbolized_names
      column_names.map(&:to_sym)
    end
  end
end
