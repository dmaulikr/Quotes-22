module Quotes
  module Models
    class Quote < ActiveRecord::Base
      validates :quote, :author, presence: true
    end
  end
end
