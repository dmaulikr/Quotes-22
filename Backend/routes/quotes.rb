require_relative '../models/quote'

module Quotes
  module Routes
    class Quotes < Sinatra::Base
      get '/quotes' do
        Models::Quote.all.to_json
      end
    end
  end
end
