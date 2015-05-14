require 'rubygems'
require 'bundler/setup'

require 'sinatra/base'
require 'active_record'

require_relative 'routes/quotes'

module Quotes
  class App < Sinatra::Base
    ActiveRecord::Base.establish_connection(
      adapter: 'sqlite3',
      database: 'quotes.db'
    )

    use Routes::Quotes
  end
end
